using Toybox.System as Sys;

class Point {
  var x;
  var y;

  function initialize(x, y) {
    self.x = x;
    self.y = y;
  }

  function toString() {
    return "Point (" + self.x + ", " + self.y + ")";
  }
}
