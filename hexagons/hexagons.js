PI = Math.PI
cos = Math.cos
sin = Math.sin
sqrt = Math.sqrt

HEX_SIZE = 24
HEX_WIDTH = HEX_SIZE * sqrt(3)
HEX_VERTICAL_SPACING = HEX_WIDTH * 3/4

const print = function(text) { console.log(text) }

const Point = function(x, y) {
  return {x: x, y: y}
}

const drawCircle = function(ctx, center, side) {
  x = center.x
  y = center.y
  ctx.moveTo(x + side, y)
  ctx.arc(x, y, side, 0, 2*Math.PI)
  ctx.stroke()
}


const drawHex = function(ctx, center, size) {

  const pointyHexCorner = function (center, size, i) {
    let angleInDegrees = 60 * i - 30
    let angleInRadians = PI / 180 * angleInDegrees
    return Point(center.x + size * cos(angleInRadians),
                 center.y + size * sin(angleInRadians))
  }

  let corners = []
  for (let i=0; i<6; i++) {
    let corner = pointyHexCorner(center, size, i)
    corners.push(corner)
  }
  ctx.moveTo(corners[0].x, corners[0].y)
  for (let corner of corners) {
    ctx.lineTo(corner.x, corner.y)
  }
  ctx.lineTo(corners[0].x, corners[0].y)
  ctx.stroke()
}


let canvas = document.getElementById("myCanvas")
let ctx = canvas.getContext("2d")

let row = 0
let x = 0
let y = 0
while (y < canvas.height) {

  x = (row % 2 === 0) ? 0 : HEX_WIDTH / 2

  print(y)
  while (x < canvas.width) {
    print(x)
    drawHex(ctx, Point(x, y), HEX_SIZE)
    x += HEX_WIDTH
  }
  y += HEX_VERTICAL_SPACING + 4  // FIXME wtf 4?
  row += 1
}
