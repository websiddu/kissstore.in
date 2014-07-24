angular.module('kissApp', [])
  .controller('kissController', [ '$http', '$scope', ($http, $scope) ->

    $scope.works = []
    $scope.testimonials = []

    $scope.init = ->
      $scope.fillWorks()
      $scope.fillTestimonials()

    $scope.fillTestimonials = ->
      $http(
        url: 'data/testimonials.json'
        method: 'GET'
      ).success (data, status) ->
        $scope.testimonials = data


    $scope.fillWorks = ->
      $http(
        url: 'data/works.json'
        method: 'GET'
      ).success (data, status) ->
        $scope.works = data
        setTimeout ->
          Kiss.intiQuickSand()
        , 1000

    $scope.init()



  ])
