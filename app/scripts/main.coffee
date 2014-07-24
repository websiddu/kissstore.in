window.Kiss = do ->

  _init = ->
    _initSuperSlider()
    _initWaypoints()
    _doSmoothScroll()

  _initWaypoints = ->
    $('.js_point').waypoint
      offset: 80
      handler: (direction) ->
        $('li', '.p-navbar-nav').removeClass('active')
        id = $(this).attr('id')
        $("a[href='##{id}']", '.p-navbar-nav').parent('li').addClass('active')

  _doSmoothScroll = ->
    $("a", '.p-navbar-nav').on 'click', (event) ->
      event.preventDefault()
      id = $(this).attr('href')
      setTimeout ->
        $("li", '.p-navbar-nav').removeClass('active')
        $(event.target).parent('li').addClass('active')
      , 300
      _target = $("##{id.slice(1)}")
      $('body, html').animate
        scrollTop: _target.offset().top - 80



  _initSuperSlider = ->
    $('#slides').superslides()
    # intiQuickSand()


  intiQuickSand: ->
    $('#container').mixItUp
      animation:
        enable: true
        effects: 'fade scale'
        duration: 600
        easing: 'ease'
        perspectiveDistance: '3000'
        perspectiveOrigin: '50% 50%'
        queue: true
        queueLimit: 1
        animateChangeLayout: true
        animateResizeContainer: true
        animateResizeTargets: false
        staggerSequence: false
        reverseOut: true
      load:
        filter: 'all'
        sort: false

  # ###Kiss.init
  # This function is called after the dom is ready to and **$** is available
  init: ->
    _init()
    return true

$(Kiss.init)

