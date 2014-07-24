(function() {
  angular.module('kissApp', []).controller('kissController', [
    '$http', '$scope', function($http, $scope) {
      $scope.works = [];
      $scope.testimonials = [];
      $scope.init = function() {
        $scope.fillWorks();
        return $scope.fillTestimonials();
      };
      $scope.fillTestimonials = function() {
        return $http({
          url: 'data/testimonials.json',
          method: 'GET'
        }).success(function(data, status) {
          return $scope.testimonials = data;
        });
      };
      $scope.fillWorks = function() {
        return $http({
          url: 'data/works.json',
          method: 'GET'
        }).success(function(data, status) {
          $scope.works = data;
          return setTimeout(function() {
            return Kiss.intiQuickSand();
          }, 1000);
        });
      };
      return $scope.init();
    }
  ]);

}).call(this);
