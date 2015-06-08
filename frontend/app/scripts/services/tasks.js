'use strict';

angular.module('todo').factory('Tasks', function($resource) {
  return $resource('/api/tasks/:id/:action', {id: '@id'},
    {
      'update': { method: 'PATCH' },
      'clearFinished': { method: 'POST' }
    });
});
