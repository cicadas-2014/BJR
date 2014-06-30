/*----------------------------------------------------------
 Page Configuration
 -----------------------------------------------------------*/
 (function () {
  var finishExecuted = false;

  var path = "M436.7,380c0,0-69,71.1-92.9,35s-123.6,46.6-123.6,46.6s-130.6-57-98.7-80.9s-80.2-65.7-80.2-65.7s-24.4-143,22.1-134.5s15.4-93.7,15.4-93.7s100-84.1,107.2-40.4C193.3,90,295.4,5.1,295.4,5.1s110.4,28.4,82,67.2c-28.4,38.8,96.9,79.5,96.9,79.5s21.3,107.7-17,103.5S436.7,380,436.7,380z"
  firstRacer = $('.maze > .walker')[0],
  racers = [];
  var winner = $('#winner').val()
  var colors = ["red","green","yellow","blue"]
  var winner_color = "red"
  for (var i = 0; i < colors.length; i++) {
    if(i===parseInt(winner)-1){winner_color = colors[i];delete colors[i]}
  };
  console.log(winner_color)
  function AnimateRacer(racer) {
    this.raceAnimator = new RaceAnimator(path);
    this.racer = racer;
    this.speed = 0.1;
        this.color = winner_color; // visually separate different racers easily
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
                this.raceAnimator.speed += .0004;
                racers[1].raceAnimator.speed -= .0001;
                racers[2].raceAnimator.speed -= .0001;
                racers[3].raceAnimator.speed += .0002;
              }else{
                this.raceAnimator.speed -= .000;
                racers[1].raceAnimator.speed -= .0001;
                racers[2].raceAnimator.speed += .0001;
                racers[3].raceAnimator.speed += .0002;
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
          if(!(finishExecuted)){
            finishExecuted = true
              var speed = 1200;
              $(".back").css("background-color",winner_color)
              $("#logout").css("color","red")
            setTimeout(function(){
              $('.walker').fadeTo(speed*2,0);
              $(".back").fadeTo(speed*2,0.7);
              $('#svgPath').fadeTo(speed*2, 0);
              setTimeout(function(){$('#round #winner-box').slideDown(speed*3)},speed*2);
            },speed*3);
          }
        }
      }

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

      addRacer(colors[0]);
      addRacer(colors[1]);
      addRacer(colors[2]);

      $('#svgPath').toggleClass('show');
    })
();