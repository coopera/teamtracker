var app = angular.module('teamtracker', ['teamtracker.controllers', 'teamtracker.services'])

var controllers = angular.module('teamtracker.controllers', []);
var services = angular.module('teamtracker.services', []);

app.config([
  "$httpProvider", function($httpProvider) {
    $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');
  }
]);