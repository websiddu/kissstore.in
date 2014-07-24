window.Kiss = do ->

  _init = ->
    _initSuperSlider()
    #_initWaypoints()

  _initWaypoints = ->
    $('.js_slide_cont').waypoint (direction) ->
      if direction is 'down'
        console.log "Is this ture.."
        $('.js_header').addClass('animated slideInDown').removeClass('hide')


  _initSuperSlider = ->
    $('#slides').superslides()
    # intiQuickSand()


  intiQuickSand: ->
    console.log "After data..."
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

