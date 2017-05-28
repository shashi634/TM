angular.module("app").controller("PackageDetailsController", [
    "$rootScope", "$scope", "blockUI", "$http", "$location", "$sce",
    function ($rootScope, $scope, blockUI, $http, $location, $sce) {
        var gridBlock = blockUI.instances.get('main');
        $scope.Id = null;
        $scope.Package = {};
        $scope.Name = null;
        $scope.hotel = {}
        $scope.location = null;
        $scope.checkInDate = null;
        $scope.checkOutDate = null;
        $scope.selectedRoomNo = "--";
        $scope.selectedAdultNo = "--";
        $scope.selectedChildNo = "--";
        $scope.MainImage = "";
        function getParameterByName(name, url) {
            if (!url) url = window.location.href;
            name = name.replace(/[\[\]]/g, "\\$&");
            var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
                results = regex.exec(url);
            if (!results) return null;
            if (!results[2]) return '';
            return decodeURIComponent(results[2].replace(/\+/g, " "));
        }
        $scope.Id = getParameterByName("id");
        $scope.GetPackage = function () {
           gridBlock.start();
            $http.get('http://localhost:51050/api/Package/' + getParameterByName("id")).then(successCallback, errorCallback);
            function successCallback(response) {
                $scope.Package = response.data[0];
                $scope.myContent = $sce.trustAsHtml($scope.Package.PackageDetail);
                console.log($scope.Package);
              gridBlock.stop();

            }
            function errorCallback(error) {
                gridBlock.stop();
            }
        }
        $scope.GetPackage();
        $scope.NoOfChild = 1;
        $scope.NoOfAdult = 1;
        $scope.NoOfSP = 1;
        $scope.ChildUpdate = function () { };
        $scope.AdultUpdate = function () { };
        $scope.SinglePersonUpdate = function () { };
     }
]);