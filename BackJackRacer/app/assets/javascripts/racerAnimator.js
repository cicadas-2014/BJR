/*-----------------------------
 Path Animator v1.1.0
 (c) 2013 Yair Even Or <http://dropthebit.com>

 MIT-style license.
 ------------------------------*/

function RaceAnimator(path) {
    if (path) this.updatePath(path);
    this.timer = null;
    this.percent = 0;
}

RaceAnimator.prototype = {

    start: function (speed, step, reverse, startPercent, callback) {

        var racer = this;
        this.stop();

        this.speed =  speed * (0.65 + Math.random() * 0.35);

        (function calc() {
            var points = {};
            var angle;
            var percent = racer.percent;
            var speed = racer.speed;

            if (percent > 99) {
                racer.stop();
                return callback.call(racer.context);
            }

            points.behind = racer.pointAt(percent - 1);
            points.ahead = racer.pointAt(percent + 1);
            angle = Math.atan2(points.ahead.y - points.behind.y, points.ahead.x - points.behind.x) * 180 / Math.PI;

            racer.percent = percent + speed;
            racer.timer = setTimeout(calc, 15);

            step.call(racer.context, racer.pointAt(percent), angle);
        })();
    },

    stop: function () {
        clearTimeout(this.timer);
        this.timer = null;
    },


    pointAt: function (percent) {
        return this.path.getPointAtLength(this.len * percent / 100);
    },

    updatePath: function (path) {
        this.path = document.createElementNS('http://www.w3.org/2000/svg', 'path');
        this.path.setAttribute('d', path);
        this.len = this.path.getTotalLength();
    }
};