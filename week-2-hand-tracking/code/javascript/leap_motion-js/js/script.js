var canvas = document.getElementById("leap-overlay");

// fullscreen
canvas.width = window.innerWidth;
canvas.height = window.innerHeight;

// create a rendering context
var ctx = canvas.getContext("2d");
ctx.translate(canvas.width/2,canvas.height);
ctx.fillStyle = "rgba(0,0,0,0.7)";

// render each frame
function draw(obj) {
  // clear last frame
  //ctx.clearRect(-canvas.width/2,-canvas.height,canvas.width,canvas.height);
    
  // cover the canvas with a 10% opaque layer for fade out effect.
  ctx.fillStyle = "white";
  ctx.globalAlpha=0.2;
  ctx.fillRect(-canvas.width/2,-canvas.height,canvas.width,canvas.height);
  // render circles based on pointable positions
  var pointablesMap = obj.pointablesMap;
  for (var i in pointablesMap) {
    // get the pointable's position
    var pointable = pointablesMap[i];
    var pos = pointable.tipPosition;

    // create a circle for each pointable
    var radius = Math.min(600/Math.abs(pos[2]),20);
    ctx.beginPath();
    ctx.fillStyle = "rgba(0,0,0,1)";
    ctx.arc(pos[0]-radius/2,-pos[1]-radius/2,radius,0,2*Math.PI);
    ctx.fill();
  }
};

// listen to Leap Motion
Leap.loop(draw);
