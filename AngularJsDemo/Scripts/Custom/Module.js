var app = angular.module("angularJsApp", ['datatables']);

app.directive("datepicker", function () {
    return {
        restrict: 'EA',
        require: '?ngModel',
        link: function (scope, element, attrs, ngModel) {
            var datepicker;
            var optionsObj = {
                changeMonth: true,
                changeYear: true,
                maxDate: "today",
                yearRange: "-100:+0",
                dateFormat: 'mm/dd/yy',
                onSelect: function (dateText, inst) {
                    scope.$apply(function () {
                        ngModel.$setViewValue(dateText);
                    });
                }
            };
            datepicker = $(element).datepicker(optionsObj);
        }
    };
});

//File Upload directive
app.directive('fileModel', ['$parse', function ($parse) {
    return {
        restrict: 'A',
        template: "<input type='file' />",
        link: function (scope, element, attrs) {
            var model = $parse(attrs.fileModel);
            var modelSetter = model.assign;
            var onChange = $parse(attrs.onChange);

            var updateModel = function () {
                scope.$apply(function () {
                    modelSetter(scope, element[0].files[0]);
                    onChange(scope);
                });
            };

            element.bind('change', updateModel);
        }
    };
}]);


app.filter("dateFilter", function () {
    return function (item) {
        if (item != null) {
            return new Date(parseInt(item.substr(6)));
        }
        return "";
    };
});
