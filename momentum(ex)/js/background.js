const bgs = ["1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jgp"];
const img = document.createElement("img");
const bgChoice = bgs[Math.floor(Math.random() * bgs.length)];

img.src = `img/${bgChoice}`;
document.body.appendChild(img);