<?php

namespace App\Http\Controllers;

use App\Models\Category;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;

class CategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $categories = Category::paginate(10);
        $keyword = $request->get('name');

        if ($keyword) {
            $categories = Category::where("name", 'LIKE', "%$keyword%")->paginate(10);
        }

        return view('categories.index', [
            'categories' => $categories
        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('categories.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $validator = $request->validate([
            'name' => 'required|min:3',

        ]);

        $validator['image'] = 'categories-image/nopic.png';

        if ($request->hasFile('image')) {
            $validator['image'] = $request->file('image')->store('categories-image', 'public');
        }

        $validator['created_by'] = Auth::user()->id;
        $validator['slug'] = Str::slug($validator['name'], '-');

        Category::create($validator);

        return redirect()->route('categories.create')->with('status', 'Kategori Berhasil Dibuat');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $category = Category::findOrFail($id);

        return view('categories.show', [
            'category' => $category
        ]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $category = Category::findOrFail($id);

        return view('categories.edit', [
            'category' => $category
        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $category = Category::findOrFail($id);

        $validator = $request->validate([
            'name' => 'required|min:3',
            'slug' => 'required|unique:categories',
        ]);

        $validator['slug'] = Str::slug($validator['slug'], '-');

        if ($request->hasFile('image')) {
            $validator['image'] = $request->file('image')->store('categories-image', 'public');
            if ($category->image !== 'categories-image/nopic.png') {
                Storage::delete('public/' . $category->image);
            }
        }
        Category::where('id', $id)->update($validator);

        return redirect()->route('categories.edit', [$id])->with('status', "Categori Berhasil Diupdate");
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        Category::where('id', $id)->delete();

        return redirect()->route('categories.index')->with('status', 'Categori Berhasil Dihapus');
    }

    public function trash()
    {
        $deleted_category = Category::onlyTrashed()->paginate(10);

        return view('categories.trash', [
            'categories' => $deleted_category
        ]);
    }

    public function restore($id)
    {
        $category = Category::withTrashed()->findOrFail($id);

        if ($category->trashed()) {
            $category->restore();
        } else {
            return redirect()->route('categories.index')->with('status', 'Kategori tidak ada di dalam Recycle Bin');
        }

        return redirect()->route('categories.index')->with('status', 'Kategori Berhasil Dikembalikan');
    }

    public function deletePermanent($id)
    {
        $category = Category::withTrashed()->findOrFail($id);

        if (!$category->trashed()) {
            return redirect()->route('categories.index')->with('status', 'Tidak bisa menghapus permanent kategori');
        } else {
            $category->forceDelete();

            return redirect()->route('categories.index')->with('status', 'Kategori berhasil dihapus secara permanen');
        }
    }
}