// Custom color
tracking.ColorTracker.registerColor('blue', function(r, g, b) {
  if (r < 76 && g < 118 && b > 133) {
    return true;
  }
  return false;
});

var video = document.getElementById('video');
var colors = new tracking.ColorTracker(['magenta', 'cyan', 'yellow', 'blue']);

  colors.on('track', function(event) {
    if (event.data.length === 0) {
      // No colors were detected in this frame.
      console.log("No colors detected");
    } else {
      event.data.forEach(function(rect) {
        // Colors were detected in this frame.
        console.log(rect.x, rect.y, rect.height, rect.width, rect.color);
      });
    }
  });

  tracking.track(video, colors, { camera: true });