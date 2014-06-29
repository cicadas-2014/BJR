/*----------------------------------------------------------
 Page Configuration
 -----------------------------------------------------------*/
(function () {
    var path = "M0,402.5c133,0,266,0,399,0s266,0,399,0c0.7,0,1.3,0,2,0c3.2,0,3.2-5,0-5c-133,0-266,0-399,0s-266,0-399,0c-0.7,0-1.3,0-2,0C-3.2,397.5-3.2,402.5,0,402.5L0,402.5z"

    firstRacer = $('.maze > .walker')[0],
        racers = [];

    function AnimateRacer(racer) {
        this.raceAnimator = new RaceAnimator(path);
        this.racer = racer;
        this.speed = 0.1;
        this.color = '#0000FF'; // visually separate different racers easily
    }

    AnimateRacer.prototype = {
        start: function () {
            this.startOffset = 0;
            this.raceAnimator.context = this;
            this.raceAnimator.start(this.speed, this.step, this.reverse, this.startOffset, this.finish);

        },

        step: function (point, angle) {

            if (this.winner) {
                racers.sort(function (a, b) {
                    if (a.raceAnimator.percent > b.raceAnimator.percent) return -1;
                    if (a.raceAnimator.percent < b.raceAnimator.percent) return 1;
                    return 0;
                });
                if (this.raceAnimator.percent > 50) {
                    if (racers[0].id != this.id) {
                        this.raceAnimator.speed += .001;
                        racers[1].raceAnimator.speed += .0001;
                        racers[2].raceAnimator.speed -= .0001;
                        racers[3].raceAnimator.speed -= .0002;
                        racers[4].raceAnimator.speed += .0002;
                    }
                }
            }

            this.racer.style.cssText =
                "top:" + point.y + "px;" +
                "left:" + point.x + "px;" +
                "transform:rotate(" + angle + "deg);" +
                "-webkit-transform:rotate(" + angle + "deg);" +
                "color:" + this.color;
        },

        finish: function () {

        }
    }
    ;

    function generateRacer(domElement) {
        var racer = new AnimateRacer(domElement);
        racer.id = racers.length + 1;
        racer.winner = true;
        racers.push(racer);
        return racer;
    }

    function addRacer(color) {
        var domElement = firstRacer.cloneNode(true);
        var racer = generateRacer(domElement);
        racer.winner = false
        $(firstRacer).after(domElement);
        racer.color = color;
        racer.start();
    }

    generateRacer(firstRacer).start();

    addRacer('#FF0000');
    addRacer('#FF0000');
    addRacer('#FF0000');
    addRacer('#FF0000');

    $('#svgPath').toggleClass('show');
})
();