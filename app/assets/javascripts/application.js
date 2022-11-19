// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
//= require chartkick
//= require Chart.bundle
//= require jquery3
//= require popper
//= require bootstrap-sprockets



var c = document.getElementById("c");
var ctx = c.getContext("2d");
var cw = c.width = window.innerWidth;
var ch = c.height = window.innerHeight;
var cX = cw / 2,
    cY = ch / 2;
var rad = Math.PI / 180;
var howMany = 100;
// size of the tangent
var t = 1 / 5;

ctx.strokeStyle = "white";
ctx.shadowBlur = 5;
ctx.shadowOffsetX = 2;
ctx.shadowOffsetY = 2;
ctx.shadowColor = "#333";
ctx.globalAlpha = .85;

var colors = ["#930c37", "#ea767a", "#ee6133", "#ecac43", "#fb9983", "#f9bc9f", "#f8ed38", "#a8e3f9", "#d1f2fd", "#ecd5f5", "#fee4fd", "#8520b4", "#FA2E59", "#FF703F", "#FF703F", "#F7BC05", "#ECF6BB", "#76BCAD"];
var flowers = [];
for (var hm = 0; hm < howMany; hm++) {
    flowers[hm] = {}
    flowers[hm].cx = ~~(Math.random() * cw) + 1;
    flowers[hm].cy = ~~(Math.random() * ch) + 1;
    flowers[hm].R = randomIntFromInterval(20, 50);
    flowers[hm].Ri = randomIntFromInterval(5, 7) / 10;
    flowers[hm].k = randomIntFromInterval(5, 10) / 10;
    flowers[hm].ki = randomIntFromInterval(2, 7) / 100;
    flowers[hm].K = randomIntFromInterval(5, 16) / 10;
    flowers[hm].fs = ~~(Math.random() * colors.length) + 1;
    flowers[hm].cs = ~~(Math.random() * colors.length) + 1;
    flowers[hm].nP = randomIntFromInterval(4, 10);
    flowers[hm].spacing = randomIntFromInterval(4, 10);

}

function buildRy(R, k, cx, cy, nP, spacing) {
    var r = R * k;
    var A = 360 / nP; //nP num petals
    var petals = [];
    for (var i = 0; i < nP; i++) {
        var ry = [];

        ry[ry.length] = {
            x: cx,
            y: cy
        }

        var a1 = i * A + spacing;
        var x1 = ~~(cx + R * Math.cos(a1 * rad));
        var y1 = ~~(cy + R * Math.sin(a1 * rad));

        ry[ry.length] = {
            x: x1,
            y: y1,
            a: a1
        }

        var a2 = i * A + A / 2;
        var x2 = ~~(cx + r * Math.cos(a2 * rad));
        var y2 = ~~(cy + r * Math.sin(a2 * rad));

        ry[ry.length] = {
            x: x2,
            y: y2,
            a: a2
        }

        var a3 = i * A + A - spacing
        var x3 = ~~(cx + R * Math.cos(a3 * rad));
        var y3 = ~~(cy + R * Math.sin(a3 * rad));

        ry[ry.length] = {
            x: x3,
            y: y3,
            a: a3
        }

        ry[ry.length] = {
            x: cx,
            y: cy
        }

        petals[i] = ry;

    }
    return petals
}

function update() {
    ctx.clearRect(0, 0, cw, ch);

    for (var f = 0; f < flowers.length; f++) {

        if (flowers[f].k < flowers[f].K) {
            flowers[f].R += flowers[f].Ri;
            flowers[f].k += flowers[f].ki;
        }
        var R = flowers[f].R;
        var Ri = flowers[f].Ri;
        var k = flowers[f].k;
        var ki = flowers[f].ki;
        var K = flowers[f].K;
        var cx = flowers[f].cx;
        var cy = flowers[f].cy;
        var fs = colors[flowers[f].fs];
        var cs = colors[flowers[f].cs];
        var nP = flowers[f].nP;
        var spacing = flowers[f].spacing;

        for (var petal = 0; petal < petals.length; petal++) { //console.log(petals[petal])
            petals = buildRy(R, k, cx, cy, nP, spacing);
            ctx.fillStyle = fs;
            drawCurve(petals[petal]);
        }
        drawCenter(k, cx, cy, cs);
    }

    requestId = window.requestAnimationFrame(update);
}

function drawCenter(k, cx, cy, cs) {
    ctx.beginPath();
    ctx.fillStyle = cs;
    ctx.arc(cx, cy, k * 10, 0, 2 * Math.PI)
    ctx.fill();
}

function drawCurve(p) {

    var pc = controlPoints(p); // the control points array

    ctx.beginPath();
    ctx.moveTo(p[0].x, p[0].y);
    // the first & the last curve are quadratic Bezier
    // because I'm using push(), pc[i][1] comes before pc[i][0]
    ctx.quadraticCurveTo(pc[1][1].x, pc[1][1].y, p[1].x, p[1].y);

    if (p.length > 2) {
        // central curves are cubic Bezier
        for (var i = 1; i < p.length - 2; i++) {
            ctx.bezierCurveTo(pc[i][0].x, pc[i][0].y, pc[i + 1][1].x, pc[i + 1][1].y, p[i + 1].x, p[i + 1].y);
        }
        // the first & the last curve are quadratic Bezier
        var n = p.length - 1;
        ctx.quadraticCurveTo(pc[n - 1][0].x, pc[n - 1][0].y, p[n].x, p[n].y);
    }
    ctx.fill();
}

function controlPoints(p) {
    // given the points array p calculate the control points
    var pc = [];
    for (var i = 1; i < p.length - 1; i++) {
        var dx = p[i - 1].x - p[i + 1].x; // difference x
        var dy = p[i - 1].y - p[i + 1].y; // difference y
        // the first control point
        var x1 = p[i].x - dx * t;
        var y1 = p[i].y - dy * t;
        var o1 = {
            x: x1,
            y: y1
        };

        // the second control point
        var x2 = p[i].x + dx * t;
        var y2 = p[i].y + dy * t;
        var o2 = {
            x: x2,
            y: y2
        };

        // building the control points array
        pc[i] = [];
        pc[i].push(o1);
        pc[i].push(o2);
    }
    return pc;
}

function randomIntFromInterval(mn, mx) {
    return ~~(Math.random() * (mx - mn + 1) + mn);
}

for (var f = 0; f < flowers.length; f++) {
    var R = flowers[f].R;
    var Ri = flowers[f].Ri;
    var k = flowers[f].k;
    var ki = flowers[f].ki;
    var K = flowers[f].K;
    var cx = flowers[f].cx;
    var cy = flowers[f].cy;
    var fs = colors[flowers[f].fs];
    var cs = colors[flowers[f].cs];
    var nP = flowers[f].nP;
    var spacing = flowers[f].spacing;
    var petals = buildRy(R, k, cx, cy, nP, spacing);
    ctx.fillStyle = colors[flowers[f].fs];
    for (var i = 0; i < petals.length; i++) {
        drawCurve(petals[i]);
    }
}
requestId = window.requestAnimationFrame(update);

window.setTimeout(function() {
    if (requestId) {
        window.cancelAnimationFrame(requestId)
    };
    console.log("cancelAnimationFrame")
}, 6000)


