(function() {
  window.Kiss = (function() {
    var _init, _initSuperSlider, _initWaypoints;
    _init = function() {
      return _initSuperSlider();
    };
    _initWaypoints = function() {
      return $('.js_slide_cont').waypoint(function(direction) {
        if (direction === 'down') {
          console.log("Is this ture..");
          return $('.js_header').addClass('animated slideInDown').removeClass('hide');
        }
      });
    };
    _initSuperSlider = function() {
      return $('#slides').superslides();
    };
    return {
      intiQuickSand: function() {
        console.log("After data...");
        return $('#container').mixItUp({
          animation: {
            enable: true,
            effects: 'fade scale',
            duration: 600,
            easing: 'ease',
            perspectiveDistance: '3000',
            perspectiveOrigin: '50% 50%',
            queue: true,
            queueLimit: 1,
            animateChangeLayout: true,
            animateResizeContainer: true,
            animateResizeTargets: false,
            staggerSequence: false,
            reverseOut: true
          },
          load: {
            filter: 'all',
            sort: false
          }
        });
      },
      init: function() {
        _init();
        return true;
      }
    };
  })();

  $(Kiss.init);

}).call(this);
