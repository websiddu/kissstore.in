window.Kiss = do ->

  _init = ->
    $('body').jpreLoader();
    _initSuperSlider()
    _initWaypoints()
    _doSmoothScroll()
    _initOrderNow()

  _initWaypoints

  _initOrderNow = ->
    $('.js_order_now').on 'click', ->
      $('body, html').animate
        scrollTop: $('.js_name_field').offset().top - 100
      , ->
        $('.js_name_field').focus()


  _doSmoothScroll = ->
    $("a", '.p-navbar-nav').on 'click', (event) ->
      event.preventDefault()
      id = $(this).attr('href')
      setTimeout ->
        $("li", '.p-navbar-nav').removeClass('active')
        $(event.target).parent('li').addClass('active')
      , 500
      _target = $("##{id.slice(1)}")
      $('body, html').animate
        scrollTop: _target.offset().top - 50



  _initSuperSlider = ->
    $('#slides').superslides()
    # intiQuickSand()

  _initWaypoints = ->
    $('.js_point').waypoint
      offset: 50
      handler: (direction) ->
        $('li', '.p-navbar-nav').removeClass('active')
        id = $(this).attr('id')
        $("a[href='##{id}']", '.p-navbar-nav').parent('li').addClass('active')

    $(document).scroll ->
      if $(document).scrollTop() is 0
        $('li', '.p-navbar-nav').removeClass('active')
        $("a[href='#home']", '.p-navbar-nav').parent('li').addClass('active')

  initWaypoints: _initWaypoints

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
        filter: '.custom'
        sort: false
      callbacks:
        onMixEnd: ->
          Kiss.initWaypoints()

  # ###Kiss.init
  # This function is called after the dom is ready to and **$** is available
  init: ->
    _init()
    return true

$(Kiss.init)

