'use strict';

angular.module('todo')
  .controller('TodoCtrl', function ($scope, tasks, $resource) {

    $scope.tasks = tasks.query();

    $scope.newTask = new tasks;
    $scope.addTask = function() {
      var task = $scope.newTask.$save();
      task.then(function(response) {
        console.log(response);
        $scope.tasks.unshift(response);
        $scope.newTask = new tasks;
      });
    };

    $scope.deleteTask = function(task) {
      task.$delete();
      console.log($scope.tasks);
      $scope.tasks.splice( $scope.tasks.indexOf(task), 1);
    };

  });
