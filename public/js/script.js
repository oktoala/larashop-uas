
const img = document.querySelector('#img');
const inputImg = document.querySelector("#avatar");

inputImg.addEventListener('change', (e) => {
    const imgUrl = URL.createObjectURL(e.target.files?.[0]);

    img.src = imgUrl;
});

