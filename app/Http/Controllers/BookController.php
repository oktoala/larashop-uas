<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
use App\Models\Book;

class BookController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $status = $request->get('status');
        $keyword = $request->get("keyword") ? $request->get("keyword") : '';
        $books = Book::with('categories')->where('title', 'LIKE', "%$keyword%")->paginate(10);

        if ($status) {
            $books = Book::with('categories')->where('status', strtoupper($status))->paginate(10);
        }

        return view('books.index', [
            'books' => $books
        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('books.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $book = new Book();
        $validator = $request->validate([
            'title' => 'required|min:3',
            'description' => 'required|min:3',
            'author' => 'required',
            'publisher' => 'required',
            'price' => 'required',
        ]);

        $book->title = $validator['title'];
        $book->description = $validator['description'];
        $book->author = $validator['author'];
        $book->publisher = $validator['publisher'];
        $book->price = $validator['price'];

        $book->status = $request->get('save_action');
        $book->slug = Str::slug($validator['title']);
        $book->created_by = Auth::user()->id;
        $book->cover = 'books-cover/nocover.png';

        $book->categories()->attach($request->get('categories'));

        if ($request->hasFile('cover')) {
            $book->cover = $request->file('cover')->store('books-cover', 'public');
        }

        $book->save();

        if ($request->get('save_action') === 'PUBLISH') {
            return redirect()->route('books.create')->with('status', 'Buku Berhasil Di Publish');
        }

        return redirect()->route('books.create')->with('status', 'Buku disimpan sebagai draft');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $book = Book::findOrFail($id);

        return view('books.edit', ['book' => $book]);
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
        $book = Book::findOrFail($id);
        $validator = $request->validate([
            'title' => 'required|min:3',
            'description' => 'required|min:3',
            'author' => 'required',
            'publisher' => 'required',
            'price' => 'required',
            'status' => '',
        ]);

        $book->title = $validator['title'];
        $book->description = $validator['description'];
        $book->author = $validator['author'];
        $book->publisher = $validator['publisher'];
        $book->price = $validator['price'];

        $book->slug = Str::slug($book->title);
        $book->updated_by = Auth::user()->id;

        if ($request->hasFile('cover')) {
            $book->cover = $request->file('cover')->store('books-cover', 'public');
            if ($book->cover !== 'books-cover/nocover.png') {
                Storage::delete('public' . $book->cover);
            }
        }

        $book->categories()->sync($request->get('categories'));
        $book->save();



        return redirect()->route('books.edit', [$id])->with('status', 'Buku Berhasil Diupdate');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        Book::where('id', $id)->delete();

        return redirect()->route('books.index')->with('status', 'Buku Dipindahkan ke Recycle Bin');
    }

    public function trash()
    {
        $books = Book::onlyTrashed()->paginate(10);
        return view('books.trash', [
            'books' => $books
        ]);
    }

    public function restore($id)
    {
        $book = Book::withTrashed()->findOrFail($id);

        if ($book->trashed()) {
            $book->restore();
            return redirect()->route('books.trash')->with('status', 'Buku Berhasil Dikembalikan');
        }
        return redirect()->route('books.trash')->with('status', 'Buku Tidak Ada Di Dalam Recycle Bin');
    }

    public function deletePermanent($id)
    {
        $book = Book::withTrashed()->findOrFail($id);

        if (!$book->trashed()) {
            return redirect()->route('books.trash')->with('status', 'Buku Tidak Ada Di Dalam Recycle Bin')->with('status_type', 'alert');
        }

        $book->categories()->detach();
        $book->forceDelete();

        return redirect()->route('books.trash')->with('status', 'Buku Berhasil Dihapus Permanen');
    }
}
