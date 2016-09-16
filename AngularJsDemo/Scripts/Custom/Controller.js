//Login
app.controller("loginCtrl", function ($scope, LoginService) {
    $scope.divError = false;
    //User login
    $scope.Login = function () {
        var User = {
            Username: $scope.Username,
            Password: $scope.Password
        }

        var getLoginData = LoginService.LoginUser(User);
        getLoginData.then(function (msg) {
            if (msg.data.Flag === true) {
                window.location = "Dashboard/Index";
            }
            else {
                $scope.divError = true;
                $scope.Error = msg.data.Message;
            }
        }, function () {
            Lobibox.notify('error', {
                msg: "Error in login."
            });
        });
    }
});

//EmployeeController
app.controller("EmployeeController", function ($scope, employeeService, DTOptionsBuilder, DTColumnDefBuilder, $anchorScroll) {
    $scope.EmployeeList = [];
    $scope.DesignationList = [];
    $scope.HbList = [];

    getEmployeeList();
    getDesignationList();
    getHobbyList();

    $scope.emailFormat = /^[a-z]+[a-z0-9._]+@[a-z]+\.[a-z.]{2,5}$/;

    //Datatable
    $scope.dtOptions = DTOptionsBuilder.newOptions();
    $scope.dtColumnDefs = [
        DTColumnDefBuilder.newColumnDef(6).notSortable()
    ];

    //Get List
    function getEmployeeList() {
        var getEmployee = employeeService.GetList();
        getEmployee.then(function (emp) {
            $scope.EmployeeList = emp.data;
        });
    }


    //Get hobby List
    function getHobbyList() {
        var getHobby = employeeService.GetHobbyResult();
        getHobby.then(function (hobby) {
            $scope.HbList = hobby.data;
        });
    }


    //GetDesignationList
    function getDesignationList() {
        var getDesignation = employeeService.GetDesignationResult();
        getDesignation.then(function (designation) {
            $scope.DesignationList = designation.data;
        });
    }

    //clear
    function clear() {
        $scope.EmpId = "";
        $scope.EmpName = "";
        $scope.EmpAddress = "";
        $scope.EmpGender = "Male";
        $scope.EmpEmail = "";
        $scope.EmpDesignation = "";
        $scope.Birthdate = "";
        angular.forEach($scope.HbList, function (hobby) {
            hobby.Selelcted = false;
        });
        $scope.myform.$setPristine();
    }

    $scope.Save = function () {
        var emp = {
            EmpId: $scope.EmpId,
            EmpName: $scope.EmpName,
            EmpAddress: $scope.EmpAddress,
            EmpEmail: $scope.EmpEmail,
            EmpGender: $scope.EmpGender,
            Birthdate: $scope.Birthdate,
            EmpDesignation: $scope.EmpDesignation,
            IsDelete: false,
            IsActive: true,
            HbList: $scope.HbList
        }
        var getEmpData;
        if (emp.EmpId > 0) {
            getEmpData = employeeService.Update(emp);
            getEmpData.then(function (msg) {
                Lobibox.notify("success", {
                    msg: msg.data.message
                });
                clear();
                getEmployeeList();
            }, function () {
                Lobibox.notify("error", {
                    msg: "Error in updataing record."
                });
            });
        } else {
            getEmpData = employeeService.Add(emp);
            getEmpData.then(function (msg) {
                Lobibox.notify("success", {
                    msg: msg.data.message
                });
                clear();
                getEmployeeList();
            },
                function () {
                    Lobibox.notify('error', {
                        msg: "Error in insert of record."
                    });
                });
        }
    }

    //Edit
    $scope.Edit = function (emp) {
        debugger;
        // parse JSON formatted date to javascript date object
        var bdate = new Date(parseInt(emp.Birthdate.substr(6)));

        // format display date (e.g. 04/10/2012)
        var displayDate = $.datepicker.formatDate("mm/dd/yy", bdate);

        var getEmpData = employeeService.GetById(emp.EmpId);
        getEmpData.then(function () {
            $scope.EmpId = emp.EmpId;
            $scope.EmpName = emp.EmpName;
            $scope.EmpAddress = emp.EmpAddress;
            $scope.EmpGender = emp.EmpGender;
            $scope.EmpEmail = emp.EmpEmail;
            $scope.Birthdate = displayDate;
            $scope.EmpDesignation = emp.EmpDesignation;
            $scope.HbList = emp.HbList;
        },
            function () {
                Lobibox.notify('error', {
                    msg: "Error in getting record."
                });
            });
    }

    $scope.Delete = function (emp) {
        Lobibox.confirm({
            msg: "Do you want to delete this record?",
            callback: function ($this, type, ev) {
                if (type == "yes") {
                    var getEmpData = employeeService.Delete(emp.EmpId);
                    getEmpData.then(function (msg) {
                        Lobibox.notify('success', {
                            msg: msg.data.message
                        });
                        clear();
                        getEmployeeList();
                    },
                        function () {
                            Lobibox.notify('error', { msg: "error in deleting record" });
                        });
                }
            }
        });
    }

    //Reset
    $scope.Reset = function () {
        clear();
    }

    //Scroll top
    $scope.scrollTop = function () {
        $anchorScroll();
    }
});

//Role
app.controller("RoleController", function ($scope, roleService, DTOptionsBuilder, DTColumnDefBuilder, $anchorScroll) {
    $scope.roles = [];

    //Datatable
    $scope.dtOptions = DTOptionsBuilder.newOptions();
    $scope.dtColumnDefs = [
        DTColumnDefBuilder.newColumnDef(2).notSortable()
    ];

    //GetList
    function getRoleList() {
        var getData = roleService.GetList();
        getData.then(function (role) {
            $scope.roles = role.data;
        }, function () {
            Lobibox.notify("error", {
                msg: "Error in getting records."
            });
        });
    }
    getRoleList();

    //clear
    function clear() {
        $scope.Name = "";
        $scope.Description = "";
        $scope.myform.$setPristine();
    }

    //Save
    $scope.Save = function () {
        var role = {
            RoleId: $scope.RoleId,
            Name: $scope.Name,
            Description: $scope.Description
        }
        var getRoleData;
        if (role.RoleId > 0) {
            getRoleData = roleService.Update(role);
            getRoleData.then(function (msg) {
                Lobibox.notify("success", {
                    msg: msg.data.message
                });
                clear();
                getRoleList();
            }, function () {
                Lobibox.notify("error", {
                    msg: "Error in updataing record."
                });
            });
        } else {
            getRoleData = roleService.Add(role);
            getRoleData.then(function (msg) {
                Lobibox.notify("success", {
                    msg: msg.data.message
                });
                clear();
                getRoleList();
            },
                function () {
                    Lobibox.notify('error', {
                        msg: "Error in insert of record."
                    });
                });
        }
    }

    //Edit
    $scope.Edit = function (role) {
        var getRoleData = roleService.GetRoleById(role.RoleId);
        getRoleData.then(function () {
            $scope.RoleId = role.RoleId;
            $scope.Name = role.Name;
            $scope.Description = role.Description;
        },
            function () {
                Lobibox.notify('error', {
                    msg: "Error in getting record."
                });
            });
    }

    //Delete
    $scope.Delete = function (role) {
        Lobibox.confirm({
            msg: "Do you want to delete this record?",
            callback: function ($this, type, ev) {
                if (type == "yes") {
                    var getRoleData = roleService.Delete(role.RoleId);
                    getRoleData.then(function (msg) {
                        Lobibox.notify('success', {
                            msg: msg.data.message
                        });
                        clear();
                        getRoleList();
                    },
                        function () {
                            Lobibox.notify('error', { msg: "error in deleting record" });
                        });
                }
            }
        });
    }
    //Reset
    $scope.Reset = function () {
        clear();
        $scope.myform.$setPristine();
    }

    //Scroll top
    $scope.scrollTop = function () {
        $anchorScroll();
    }
});

