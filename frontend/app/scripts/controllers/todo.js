'use strict';

angular.module('todo')
  .controller('TodoCtrl', function ($scope, Tasks, $resource) {

    $scope.editTask = null;

    $scope.tasks = Tasks.query();

    $scope.newTask = new Tasks;
    $scope.newTask.finished = false;

    $scope.finishedItems = function() {
      var result = $scope.tasks.some(function(item, index, array) {
        return item.finished === true;
      });
      return result;
    };

    $scope.addTask = function() {
      if ($scope.newTodoItemForm.$valid) {
        var task = $scope.newTask.$save();
        task.then(function(response) {
          $scope.tasks.unshift(response);
          $scope.newTask = new Tasks;
          $scope.newTodoItemForm.invalidAttempt = false;
        });
      } else {
        $scope.newTodoItemForm.invalidAttempt = true;
      }
    };

    $scope.deleteTask = function(task) {
      task.$delete();
      $scope.tasks.splice( $scope.tasks.indexOf(task), 1 );
    };

    $scope.updateTask = function() {
      if ($scope.editTodoItemForm.$valid) {
        Tasks.update($scope.editTask);
        $scope.editTask = null;
        $scope.editTodoItemForm.invalidAttempt = false;
      } else {
        $scope.editTodoItemForm.invalidAttempt = true;
      }
    };

    $scope.startEditing = function(task) {
      $scope.editTask = task;
    };

    $scope.markAsFinished = function(task) {
      Tasks.update( { action: 'mark_as_finished' }, task );
      task.finished = true;
    };

    $scope.clearFinished = function() {
      Tasks.clearFinished( { action: 'clear_finished' }, null );
      $scope.tasks = $scope.tasks.filter(function(task) {
        return task.finished === false;
      });
    };

  });
