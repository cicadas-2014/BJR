/*----------------------------------------------------------
 Page Configuration
 -----------------------------------------------------------*/
 (function () {
  var path = "M757.2,499.5H293.8C166.3,499.5,62,395.2,62,267.8l0,0C62,140.3,166.3,36,293.8,36h463.5C884.7,36,989,140.3,989,267.8l0,0C989,395.2,884.7,499.5,757.2,499.5z"

  firstRacer = $('.maze > .walker')[0],
  racers = [];

  function AnimateRacer(racer) {
    this.raceAnimator = new RaceAnimator(path);
    this.racer = racer;
    this.speed = 0.1;
        this.color = '#00FFFF'; // visually separate different racers easily
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
              }else{
                this.raceAnimator.speed += .000;
                racers[1].raceAnimator.speed += .0001;
                racers[2].raceAnimator.speed -= .0001;
                racers[3].raceAnimator.speed -= .0002;
                racers[4].raceAnimator.speed += .0003;
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