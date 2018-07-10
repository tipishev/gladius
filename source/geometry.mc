using Toybox.System as Sys;
using Toybox.Math as Math;

const sqrt = Math.sqrt;
const pow = Math.pow;

// TODO package as a module

class Point {
  var x, y;

  function initialize(x, y) {
    self.x = x;
    self.y = y;
  }

  function equals(point) {
    return (self.x == point.x)  && (self.y == point.y);
  }

  function distanceTo(point) {
    return sqrt(pow(self.x - point.x, 2) + pow(self.y - point.y, 2));
  }

  function readFrom(point) {
    self.x = point.x;
    self.y = point.y;
  }

  function addVector(vector) {
    self.x += vector.x;
    self.y += vector.y;
    return self;
  }

  function clone() {
    return new Point(self.x, self.y);
  }

  function toString() {
    return "Point (" + self.x + ", " + self.y + ")";
  }
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
    return self;
  }

  function getLength() {
    return sqrt(self.x * self.x + self.y * self.y);
  }

  function toUnitVector () {
    var length = self.getLength();
    self.scale(1/length);
    return self;
  }

  function toString() {
    return "Vector (" + self.x + ", " + self.y + ")";
  }

}
