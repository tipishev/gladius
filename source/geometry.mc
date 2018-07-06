using Toybox.System as Sys;
using Toybox.Math as Math;

const sqrt = Math.sqrt;
const pow = Math.pow;


class Point {
  var x, y;

  function initialize(x, y) {
    self.x = x;
    self.y = y;
  }

  function toString() {
    return "Point (" + self.x + ", " + self.y + ")";
  }

  // TODO distance
}

function distance(point1, point2) {  // TODO typecheck?
  return sqrt(pow(point2.x - point1.x, 2) + pow(point2.y - point1.y, 2));
}

class Vector {
  var x, y;

  function initialize(start, end) {
    self.x = end.x - start.x;
    self.y = end.y - start.y;
  }

  function scale(k) {
    self.x *= k;
    self.y *= k;
  }

  function getLength() {
    return sqrt(self.x * self.x + self.y * self.y);
  }

  function toUnitVector () {
    // getting hot-hot-hot, return new Vector? :)
  }

  function toString() {
    return "Vector (" + self.x + ", " + self.y + ")";
  }

}
