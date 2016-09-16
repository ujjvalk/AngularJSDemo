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

app.filter("dateFilter", function () {
    return function (item) {
        if (item != null) {
            return new Date(parseInt(item.substr(6)));
        }
        return "";
    };
});
