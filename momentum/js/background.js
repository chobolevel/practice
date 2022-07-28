const images = ["1.jpg", "2.jpg", "3.jpg"];

const todaysImage = images[Math.floor(Math.random() * images.length)];
const img = document.createElement("img");
img.src = `img/${todaysImage}`;
document.body.appendChild(img);