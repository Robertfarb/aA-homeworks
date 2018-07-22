document.addEventListener("DOMContentLoaded", function(){
  let canvas = document.getElementById('mycanvas');
  let ctx = canvas.getContext('2d');

  ctx.fillStyle = 'green';
  ctx.fillRect(10, 10, 500, 500);

  ctx.beginPath();
  ctx.arc(10, 10, 25, 25);
  ctx.strokeStyle("perriwinkle");
  ctx.lineWidth("5");
  ctx.stroke();
});

