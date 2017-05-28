//todo refator to take size param
app.directive("userIcon", function () {
    return {
        restrict: 'E',
        scope: {
            first: '@',
            last: '@',
            size: '@',
            fullname: '@'
        },
        transclude: true,
        template: "<canvas width = '40' height = '40' />",
        link: function (scope, element, attrs) {
            //console.log(scope.size);
            scope.canvas = element.find('canvas')[0];
            context = scope.canvas.getContext('2d');
            scope.first = scope.first || '';
            scope.last = scope.last || '';
            var initials;
            if (scope.fullname) {
                var nameSplit = scope.fullname.split(" ");
                initials = nameSplit[0].charAt(0).toUpperCase() + nameSplit[1].charAt(0).toUpperCase();
            }
            else
                initials = scope.first.charAt(0).toUpperCase() + scope.last.charAt(0).toUpperCase();
            var color = [
                "#A3CD3B",
                "#F47920",
                "#006a98",
                "#FABD2E",
                "#564138",
                "#5B2333",
                "#424B54",
                "#223127",
                "#540D6E",
                "#F05D5E",
                "#5C415D"
            ];

            var charIndex = initials.charCodeAt(0) + initials.charCodeAt(1),
                colourIndex = charIndex % color.length;
            var canvasWidth = 40,
                canvasHeight = 40,
                canvasCssWidth = canvasWidth,
                canvasCssHeight = canvasHeight;

            if (window.devicePixelRatio) {
                element.attr("width", canvasWidth * window.devicePixelRatio);
                element.attr("height", canvasHeight * window.devicePixelRatio);
                element.css("width", canvasCssWidth);
                element.css("height", canvasCssHeight);
                context.scale(window.devicePixelRatio, window.devicePixelRatio);
            }

            context.fillStyle = color[colourIndex];
            context.fillRect(0, 0, scope.canvas.width, scope.canvas.height);
            context.font = "20px Arial";
            context.textAlign = "center";
            context.fillStyle = "#FFF";
            context.fillText(initials, canvasCssWidth / 2, canvasCssHeight / 1.5);

            // click handler
            // scope.canvas.addEventListener('click', iconClick, false);

        }

    };
});
app.directive("userIconMd", function () {
    return {
        restrict: 'E',
        scope: {
            first: '@',
            last: '@',
            size: '@',
            fullname: '@'
        },
        transclude: true,
        template: "<canvas width = '60' height = '60' />",
        link: function (scope, element, attrs) {
            console.log(scope.size);
            scope.canvas = element.find('canvas')[0];
            context = scope.canvas.getContext('2d');
            scope.first = scope.first || '';
            scope.last = scope.last || '';
            var initials = '??'
            if (scope.fullname) {
                var nameSplit = scope.fullname.split(" ");
                initials = nameSplit[0].charAt(0).toUpperCase() + nameSplit[1].charAt(0).toUpperCase();
            }
            else
                initials = scope.first.charAt(0).toUpperCase() + scope.last.charAt(0).toUpperCase();
            var color = [
                "#A3CD3B",
                "#F47920",
                "#006a98",
                "#FABD2E",
                "#564138",
                "#5B2333",
                "#424B54",
                "#223127",
                "#540D6E",
                "#F05D5E",
                "#5C415D"
            ];

            var charIndex = initials.charCodeAt(0) + initials.charCodeAt(1),
                colourIndex = charIndex % color.length;
            var canvasWidth = 60,
                canvasHeight = 60,
                canvasCssWidth = canvasWidth,
                canvasCssHeight = canvasHeight;

            if (window.devicePixelRatio) {
                element.attr("width", canvasWidth * window.devicePixelRatio);
                element.attr("height", canvasHeight * window.devicePixelRatio);
                element.css("width", canvasCssWidth);
                element.css("height", canvasCssHeight);
                context.scale(window.devicePixelRatio, window.devicePixelRatio);
            }

            context.fillStyle = color[colourIndex];
            context.fillRect(0, 0, scope.canvas.width, scope.canvas.height);
            context.font = "24px Arial";
            context.textAlign = "center";
            context.fillStyle = "#FFF";
            context.fillText(initials, canvasCssWidth / 2, canvasCssHeight / 1.5);
        }

    };
});

app.directive("userIconLg", function () {
    return {
        restrict: 'E',
        scope: {
            first: '@',
            last: '@',
            size: '@',
            fullname: '@'
        },
        transclude: true,
        template: "<canvas width = '75' height = '75' />",
        link: function (scope, element, attrs) {
            console.log(scope.size);
            scope.canvas = element.find('canvas')[0];
            context = scope.canvas.getContext('2d');
            scope.first = scope.first || '';
            scope.last = scope.last || '';
            var initials = '??'
            if (scope.fullname) {
                var nameSplit = scope.fullname.split(" ");
                initials = nameSplit[0].charAt(0).toUpperCase() + nameSplit[1].charAt(0).toUpperCase();
            }
            else
                initials = scope.first.charAt(0).toUpperCase() + scope.last.charAt(0).toUpperCase();
            var color = [
                "#A3CD3B",
                "#F47920",
                "#006a98",
                "#FABD2E",
                "#564138",
                "#5B2333",
                "#424B54",
                "#223127",
                "#540D6E",
                "#F05D5E",
                "#5C415D"
            ];

            var charIndex = initials.charCodeAt(0) + initials.charCodeAt(1),
                colourIndex = charIndex % color.length;
            var canvasWidth = 75,
                canvasHeight = 75,
                canvasCssWidth = canvasWidth,
                canvasCssHeight = canvasHeight;

            if (window.devicePixelRatio) {
                element.attr("width", canvasWidth * window.devicePixelRatio);
                element.attr("height", canvasHeight * window.devicePixelRatio);
                element.css("width", canvasCssWidth);
                element.css("height", canvasCssHeight);
                context.scale(window.devicePixelRatio, window.devicePixelRatio);
            }

            context.fillStyle = color[colourIndex];
            context.fillRect(0, 0, scope.canvas.width, scope.canvas.height);
            context.font = "42px Arial";
            context.textAlign = "center";
            context.fillStyle = "#FFF";
            context.fillText(initials, canvasCssWidth / 2, canvasCssHeight / 1.5);
        }

    };
});