document.addEventListener("DOMContentLoaded", function(){
  let canvas = document.getElementById('mycanvas');
  let ctx = canvas.getContext('2d');

  ctx.fillStyle = 'green';
  ctx.fillRect(10, 10, 500, 500);

  ctx.beginPath();
  ctx.arc(100, 80, 50, 0, 2 * Math.PI);
  ctx.strokeStyle = "red";
  ctx.lineWidth = 5;
  ctx.stroke();
  ctx.lineWidth = 5;
  ctx.fillStyle = "chartreuse";
  ctx.fill();
});

