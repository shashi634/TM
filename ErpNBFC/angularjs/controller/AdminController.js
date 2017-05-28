angular.module("app").controller("AdminController", [
    "$rootScope", "$scope", "blockUI", "$http",
    function ($rootScope, $scope, blockUi, $http) {
        var gridBlock = blockUi.instances.get('main');
        $scope.HotelPackage = {};
        $scope.PriceType = null;
        $scope.PriceTypeExtraChild = null;
        $scope.PriceTypeExtraAdult = null;
        $scope.PriceTypeTac = null;
        $scope.PriceTypes = ["Per NT", "NETT"];
        $scope.PriceTypeForExtraAdult = ["NETT", "Percentage"];
        $scope.PriceTypeForExtraChild = ["NETT", "Percentage","2 Children Complementry"];
        $scope.PriceTypeForTac = ["NETT Rate", "Percentage"];
        //$scope.MealType = {};
        //$scope.RoomType = {};
        $scope.NormalPrice = 0;
        $scope.NormalPriceType = null;
        $scope.ExtraChildPrice = 0;
        $scope.ExtraChildPriceType = null;
        $scope.ExtraAdultPrice = 0;
        $scope.ExtraAdultPriceType = null;
        $scope.Tac = 0;
        $scope.TacType = null;
        $scope.searchParam = {};
        $scope.searchParam.City = null;
        $scope.searchParam.Country = null;
        
        $scope.Rooms = [];
        $scope.GetRoomType = function () {
            console.log($scope.searchParam);
            gridBlock.start();
            $http.get("http://localhost:51050/api/roomTypes").then(successCallback, errorCallback);
            function successCallback(response) {
                $scope.Rooms = response.data;
                gridBlock.stop();
            }
            function errorCallback() {
                gridBlock.stop();
            }
        }
        $scope.GetRoomType();
        $scope.Meals = [];
        $scope.GetMealType = function () {
            gridBlock.start();
            $http.get("http://localhost:51050/api/mealTypes").then(successCallback, errorCallback);
            function successCallback(response) {
                $scope.Meals = response.data;
                gridBlock.stop();
            }
            function errorCallback() {
                gridBlock.stop();
            }
        }
        $scope.GetMealType();
        
        $scope.HotelPackageRoom = [];
        $scope.SetValue = function () {
            var c = {};
            c.MealType = angular.fromJson($scope.MealType).MealType;
            c.RoomType = angular.fromJson($scope.RoomType).RoomType;
            c.RoomPriceNormal  = $scope.NormalPrice;
            c.RoomPriceNormalType = $scope.NormalPriceType;
            c.ExtraChildPrice = $scope.ExtraChildPrice;
            c.ExtraChildPriceType = $scope.ExtraChildPriceType;
            c.ExtraAdultPrice = $scope.ExtraAdultPrice;
            c.ExtraAdultPriceType = $scope.ExtraAdultPriceType;
            c.Tac = $scope.Tac;
            c.TacType = $scope.TacType;
            $scope.HotelPackageRoom.push(c);
        };
        $scope.newData = function () {
            console.log("Selected Meal Type");
            console.log(angular.fromJson($scope.MealType));
        };
        $scope.deleteData = function (item) {
            var index = $scope.HotelPackageRoom.indexOf(item);
            $scope.HotelPackageRoom.splice(index, 1);
        }
        $scope.description = null;
        $scope.createPackage = function (packageObject) {
            gridBlock.start();
            $http.post("http://localhost:51050/api/CreatePackage", packageObject).then(successCallback, errorCallback);
            function successCallback(response) {
                gridBlock.stop();
            }
            function errorCallback() {
                gridBlock.stop();
            }
        }
        function sendData(dataSend) {
                $http({
                    url: 'http://localhost:51050/api/CreatePackage',
                    contentType: "application/json; charset=UTF-8",
                    method: "POST",
                    data: angular.fromJson(dataSend)
                })
                .then(function(response) {
                    gridBlock.stop();
                }, 
                function(response) { // optional
                    gridBlock.stop();
                });
            }
        $scope.addPackage = function () {
            gridBlock.start();
            $scope.dtoCreatePackage = {};
            $scope.dtoCreatePackage.DtoPackageDetails = {};
            $scope.dtoCreatePackage.HotelId = $scope.selectedHotel;
            $scope.dtoCreatePackage.StartDate = $scope.StartDate;
            $scope.dtoCreatePackage.EndDate = $scope.EndDate;
            $scope.dtoCreatePackage.DefaultMember = $scope.DefaultMember;
            $scope.dtoCreatePackage.NoOfDays = $scope.NoOfDays;
            $scope.dtoCreatePackage.NoOfNights = $scope.NoOfNights;
            $scope.dtoCreatePackage.DtoPackageDetails = $scope.HotelPackageRoom;
            $scope.dtoCreatePackage.Inclusion = $scope.inclusion;
            $scope.dtoCreatePackage.Description = $scope.description;
            console.log($scope.dtoCreatePackage);
            sendData($scope.dtoCreatePackage);
            
        };
    }
]);