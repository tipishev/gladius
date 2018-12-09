'use strict'

/* globals
*/

// shortcuts
const PI = Math.PI
const cos = Math.cos
const sin = Math.sin
const sqrt = Math.sqrt

// constants
const HEX_SIZE = 24
const FENIX_5_SCREEN_RADIUS = 120

// calculated constants
const HEX_WIDTH = HEX_SIZE * sqrt(3)
const HEX_HEIGHT = HEX_SIZE * 2
const HEX_VERTICAL_SPACING = HEX_HEIGHT * 3 / 4

// utils
const print = function (text) { console.log(text) }

// Models
const Point = function (x, y) {
  return { x: x, y: y }
}

const Board = function (spec) {
  // extract from spec
  // let width = spec.width
  // let height = spec.height

  let canvas = document.getElementById('myCanvas')
  let ctx = canvas.getContext('2d')

  const self = {}

  const pointyHexCorner = function (center, size, idx) {
    let angleInDegrees = 60 * idx - 30
    let angleInRadians = PI / 180 * angleInDegrees
    return Point(center.x + size * cos(angleInRadians),
      center.y + size * sin(angleInRadians))
  }

  // private
  const drawHex = function (ctx, center, size) {
    print('Drawing a hex')
    let corners = []
    for (let i = 0; i < 6; i++) {
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

  // public
  self.draw = function () {
    let row = 0
    let col = 0
    let x = 0
    let y = 0
    while (y < canvas.height) {
      x = (row % 2 === 0) ? 0 : HEX_WIDTH / 2
      while (x < canvas.width) {
        drawHex(ctx, Point(x, y), HEX_SIZE)
        x += HEX_WIDTH
      }
      y += HEX_VERTICAL_SPACING
      row += 1
    }
  }

  self.drawBounds = function (center, radius) {
    radius = radius || FENIX_5_SCREEN_RADIUS
    let x = center.x
    let y = center.y
    ctx.moveTo(x + radius, y)
    ctx.arc(x, y, radius, 0, 2 * PI)
    ctx.stroke()
  }

  return self
}

// show time

let board = Board({ widht: 1024, height: 780 })
board.draw()
board.drawBounds(Point(120, 120))
