(function() {
  window.Kiss = (function() {
    var _doSmoothScroll, _init, _initSuperSlider, _initWaypoints;
    _init = function() {
      _initSuperSlider();
      _initWaypoints();
      return _doSmoothScroll();
    };
    _initWaypoints = function() {
      return $('.js_point').waypoint({
        offset: 80,
        handler: function(direction) {
          var id;
          $('li', '.p-navbar-nav').removeClass('active');
          id = $(this).attr('id');
          return $("a[href='#" + id + "']", '.p-navbar-nav').parent('li').addClass('active');
        }
      });
    };
    _doSmoothScroll = function() {
      return $("a", '.p-navbar-nav').on('click', function(event) {
        var id, _target;
        event.preventDefault();
        id = $(this).attr('href');
        setTimeout(function() {
          $("li", '.p-navbar-nav').removeClass('active');
          return $(event.target).parent('li').addClass('active');
        }, 500);
        _target = $("#" + (id.slice(1)));
        return $('body, html').animate({
          scrollTop: _target.offset().top - 80
        });
      });
    };
    _initSuperSlider = function() {
      return $('#slides').superslides();
    };
    return {
      intiQuickSand: function() {
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
