document.addEventListener("DOMContentLoaded", function(){
  const canvas = document.getElementById('mycanvas');

  const ctx = canvas.getContext('2d');
  ctx.fillStyle = 'purple';
  ctx.fillRect(0, 0, 210, 250);

  ctx.beginPath();
  ctx.arc(75, 75, 50, 0, 2 * Math.PI, false);
  ctx.stroke();
  ctx.fillStyle = "green";
  ctx.fill();

});
