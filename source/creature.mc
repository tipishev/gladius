class Creature {

  protected var _name;
  protected var _color;
  protected var _speed;
  protected var _position;

  function initialize(name, color, speed, position) {
    self._name = name;
    self._color = color;
    self._speed = speed;
    self._position = new Point(position.x, position.y);
  }

  function toString() {
    return "I am " + self._name + "! At " + self._position;
  }

  function getPosition() {
    return self._position.clone();
  }

  function setPosition(point) {
    self._position.readFrom(point);
  }

  function moveTowards(destination) {
    if (self._position.equals(destination)) {
      return;
    }
    var displacementVector = new Vector(self._position, destination)
                                 .toUnitVector()
                                 .scale(self._speed);
    self._position.addVector(displacementVector);
  }

  function draw(dc) {
    dc.setColor(self._color, TRANSPARENT);
    dc.fillCircle(self._position.x, self._position.y, 15);
  }
}
