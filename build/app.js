(function e(t,n,r){function s(o,u){if(!n[o]){if(!t[o]){var a=typeof require=="function"&&require;if(!u&&a)return a(o,!0);if(i)return i(o,!0);var f=new Error("Cannot find module '"+o+"'");throw f.code="MODULE_NOT_FOUND",f}var l=n[o]={exports:{}};t[o][0].call(l.exports,function(e){var n=t[o][1][e];return s(n?n:e)},l,l.exports,e,t,n,r)}return n[o].exports}var i=typeof require=="function"&&require;for(var o=0;o<r.length;o++)s(r[o]);return s})({1:[function(require,module,exports){
// Generated by CoffeeScript 1.10.0
var frameCounter;

frameCounter = function(size) {
  console.log("greetings from frameCounter");
  return new PointText({
    point: size,
    justification: 'right',
    fontSize: 8,
    fillColor: 'black',
    onFrame: function(event) {
      return this.content = event.count;
    }
  });
};

module.exports = {
  frameCounter: frameCounter
};

},{}],2:[function(require,module,exports){
// Generated by CoffeeScript 1.10.0

/* level model values & functions: */
var model;

model = function() {
  var dirs, steppify;
  this.state = new function() {
    return {
      level: [1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
      dimensions: {
        x: 5,
        y: 5
      },
      position: void 0,
      get: function(input) {
        return this.level[this.idx(input)];
      },
      idx: function(input) {
        return this.dimensions.x * input.y + input.x;
      },
      is_available: function(direction) {
        var np;
        np = this.step(direction);
        if (np.x < 0 || np.x >= this.dimensions.x) {
          return false;
        }
        if (np.y < 0 || np.y >= this.dimensions.y) {
          return false;
        }
        return this.level[this.idx(np)] === 1;
      },
      step: function(direction) {
        return {
          x: this.position.x + direction.x,
          y: this.position.y + direction.y
        };
      },
      print: function() {
        var j, k, ref, ref1, row, x, y;
        for (y = j = 0, ref = this.dimensions.y; 0 <= ref ? j < ref : j > ref; y = 0 <= ref ? ++j : --j) {
          row = "";
          for (x = k = 0, ref1 = this.dimensions.x; 0 <= ref1 ? k < ref1 : k > ref1; x = 0 <= ref1 ? ++k : --k) {
            row += this.level[this.idx({
              x: x,
              y: y
            })] + " ";
          }
          console.log(row);
        }
        console.log("position", this.position);
      }
    };
  };
  dirs = [
    {
      x: -1,
      y: 0
    }, {
      x: 0,
      y: -1
    }, {
      x: 1,
      y: 0
    }, {
      x: 0,
      y: 1
    }
  ];
  this.set_position = function(x, y) {
    this.state.position = {
      x: x,
      y: y
    };
    this.state.level[this.state.idx(this.state.position)] = 0;
  };
  this.move = function(direction) {
    var np, path;
    path = [];
    while (this.state.is_available(direction)) {
      np = this.state.step(direction);
      this.state.level[this.state.idx(np)] = 0;
      this.state.position = np;
      path.push(np);
    }
    return path;
  };
  steppify = function(i) {
    return i / Math.abs(i);
  };
  this.clicked = function(tilexy) {
    var dx, dy, result;
    if (this.state.position === void 0) {
      this.set_position(tilexy.x, tilexy.y);
      return [tilexy];
    }
    if (tilexy.x === this.state.position.x) {
      dy = steppify(tilexy.y - this.state.position.y);
      console.log(dy);
      result = dy !== 0 ? this.move({
        x: 0,
        y: dy
      }) : [];
      return result;
    }
    if (tilexy.y === this.state.position.y) {
      dx = steppify(tilexy.x - this.state.position.x);
      console.log(dx);
      result = dx !== 0 ? this.move({
        x: dx,
        y: 0
      }) : [];
      return result;
    }
    return [];
  };
  this.checkwin = function() {
    return 0 === state.level.reduce((function(pv, cv) {
      return pv + cv;
    }), 0);
  };
  return this;
};

module.exports = {
  model: model
};

},{}],3:[function(require,module,exports){
// Generated by CoffeeScript 1.10.0
var tile, tileAnimator, view;

tile = function(x, y, w, h, bus, taken) {
  var result;
  result = new Path.Rectangle({
    info: {
      x: x,
      y: y
    },
    taken: taken,
    bus: bus,
    topLeft: [0, 0],
    bottomRight: [w, h],
    radius: ((w + h) * 0.5) * 0.125,
    strokeColor: 'black',
    strokeWidth: 2,
    fillColor: taken === 0 ? {
      gradient: {
        stops: ['yellow', 'red', 'red'],
        radial: true
      },
      origin: [0, 0],
      destination: [w, h]
    } : {
      gradient: {
        stops: ['white', 'grey', 'grey'],
        radial: true
      },
      origin: [0, 0],
      destination: [w, h]
    },
    onMouseDown: function(event) {
      return bus.signal(this);
    }
  });
  result.translate([x * w, y * h]);
  return result;
};

tileAnimator = function() {
  this.process = [];
  this.add = function(tile, delay) {
    if (delay == null) {
      delay = 0;
    }
    return this.process.push({
      start: new Date().getTime() + delay,
      object: tile
    });
  };
  return this.animate = function(event) {};
};

view = function(model, center) {
  var h, i, j, ref, ref1, t, w, x, y;
  this.model = model;
  t = [];
  for (y = i = 0, ref = model.state.dimensions.y; 0 <= ref ? i < ref : i > ref; y = 0 <= ref ? ++i : --i) {
    for (x = j = 0, ref1 = model.state.dimensions.x; 0 <= ref1 ? j < ref1 : j > ref1; x = 0 <= ref1 ? ++j : --j) {
      t.push(new tile(x, y, 60, 60, this, model.state.get({
        x: x,
        y: y
      })));
    }
  }
  this.tiles = new Group(t);
  console.log(this.tiles);
  w = 60 * model.state.dimensions.x;
  h = 60 * model.state.dimensions.y;
  this.tiles.translate([center.x - (w * 0.5), center.y - (h * 0.5)]);
  this.signal = function(tile) {
    var k, len, results, step, test;
    test = this.model.clicked(tile.info);
    results = [];
    for (k = 0, len = test.length; k < len; k++) {
      step = test[k];
      results.push(this.tiles.children[this.model.state.idx(step)].fillColor = 'green');
    }
    return results;
  };
  return this;
};

module.exports = {
  tile: tile,
  view: view
};

},{}],4:[function(require,module,exports){
// Generated by CoffeeScript 1.10.0
var level, main, utils, viewcontroller;

utils = require('./display.js');

level = require('./levelModel.js');

viewcontroller = require('./levelViewController.js');

main = function() {
  var test;
  this.current = new level.model();

  /*    console.log "--------------------------------"
  @current.state.print()
  @current.set_position 3, 3
  console.log "--------------------------------"
  @current.state.print()
  test = @current.move {x: -1, y: 0}
  console.log "test", test
  console.log "--------------------------------"
  @current.state.print()
  @current.move {x: 0, y: -1}
  console.log "--------------------------------"
  @current.state.print()
  @current.move {x: 1, y: 0}
  console.log "--------------------------------"
  @current.state.print()
   */
  test = new viewcontroller.view(this.current, view.center);
  return this;
};

paper.install(window);

window.onload = function() {
  var app, fc;
  paper.setup('puzzls');
  fc = utils.frameCounter(view.size);
  return app = new main();

  /*
  current = intro.object signal
  
  signal = (value) -> 
      if value == "start"
          current.handle.remove()
          current = new level.level("")
   */
};

},{"./display.js":1,"./levelModel.js":2,"./levelViewController.js":3}]},{},[4]);