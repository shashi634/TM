var app = angular.module('app', [
                    'XSS',
                    'blockUI'
]).config([
        '$httpProvider', function ($httpProvider) {
            $httpProvider.interceptors.push('XSS');
            $httpProvider.defaults.headers.common["X-Requested-With"] = 'XMLHttpRequest';
            $httpProvider.defaults.headers.common["Access-Control-Allow-Headers"] = 'Access-Control-Allow-Headers';
            $httpProvider.defaults.headers.post['Content-Type'] = 'application/json';
            //$httpProvider.defaults.headers.post['Content-Type'] = 'application/json;charset=utf-8';
            $httpProvider.defaults.headers.common['Access-Control-Allow-Origin'] = '*';
            $httpProvider.defaults.headers.common['Access-Control-Allow-Methods'] = 'GET, POST, PUT, DELETE, OPTIONS';
        }
]).config([
    'blockUIConfig', function (blockUiConfig) {
        blockUiConfig.template = '<div class=\"block-ui-overlay\"></div><div class=\"block-ui-message-container\" aria-live=\"assertive\" aria-atomic=\"true\"><div class=\"block-ui-message\" ng-class=\"$_blockUiMessageClass\"><i class="fa fa-cog fa-spin fa-5x"></i></div></div>';
        blockUiConfig.autoBlock = false;
        blockUiConfig.autoInjectBodyBlock = false;
    }])

