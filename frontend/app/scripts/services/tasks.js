'use strict';

angular.module('todo').service('tasks', function() {
  this.query = function() {
    return [
    'Create TODO app',
    '. . .',
    'Profit'
    ];
  };
});