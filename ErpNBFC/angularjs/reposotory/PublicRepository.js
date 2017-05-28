angular.module('PublicRepository', [])
    .factory('PublicRepository', ['$http', '$q', function ($http, $q) {
        return {
            GetLocationPages: function (callback, error, always) {
                $http({
                        method: 'GET',
                        url: 'http://localhost:51050/api/GetPages'
                    })
                    .then(function successCallback(data) {
                        callback(data);
                    }).error(function errorCallback(data, status, headers, config) {
                        error(data, status, headers, config);
                    })
                    .finally(function() {
                        always();
                    });
            },
            AddSubject: function (subject, callback, error, always) {
                $http({
                    method: 'POST',
                    url: '/api/Organization/Subject/create',//ROUTES.AddSubject,
                    data: subject
                })
                    .success(function (data) {
                        callback(data);
                    }).error(function (data, status, headers, config) {
                        error(data, status, headers, config);
                    })
                    .finally(function () {
                        always();
                    });
            },
            AddQuestion: function (question,orgGuid, callback, error, always) {
                $http({
                    method: 'POST',
                    url: '/api/Organization/'+ orgGuid +'/Question/create',
                    data: question
                })
                    .success(function (data) {
                        callback(data);
                    }).error(function (data, status, headers, config) {
                        error(data, status, headers, config);
                    })
                    .finally(function () {
                        always();
                    });
            },
            GetSubjects: function (orgGuid,callback, error, always) {
                $http({
                    method: 'GET',
                    url: '/api/organization/'+orgGuid+'/subjects'//ROUTES.GetSubjects.formatWith(orgGuid)
                })
                    .success(function (data) {
                        callback(data);
                    }).error(function (data, status, headers, config) {
                        error(data, status, headers, config);
                    })
                    .finally(function () {
                        always();
                    });
            },

            GetScheduledExam: function (orgGuid,callback, error, always) {
                $http({
                    method: 'GET',
                    url: '/api/organization/'+orgGuid+'/GetScheduledExams'
                })
                    .success(function (data) {
                        callback(data);
                    }).error(function (data, status, headers, config) {
                        error(data, status, headers, config);
                    })
                    .finally(function () {
                        always();
                    });
            },





        };
    }]);