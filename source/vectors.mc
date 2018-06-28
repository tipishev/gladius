using Toybox.System as Sys;
using Toybox.Math as Math;

const sqrt = Math.sqrt;

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

class Vector {
  var x;
  var y;

  function initialize(start, end) {
    self.x = end.x - start.x;
    self.y = end.y - start.y;
  }

  function toString() {
    return "Vector (" + self.x + ", " + self.y + ")";
  }

}
