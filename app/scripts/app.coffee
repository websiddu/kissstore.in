angular.module('kissApp', [])
  .controller('kissController', [ '$http', '$scope', ($http, $scope) ->

    $scope.works = []
    $scope.testimonials = []
    $scope.services = []

    $scope.init = ->
      $scope.fillWorks()
      $scope.fillTestimonials()
      $scope.fillServices()

    $scope.fillServices = ->
      $http(
        url: 'data/services.json'
        method: 'GET'
      ).success (data, status) ->
        $scope.services = data

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
