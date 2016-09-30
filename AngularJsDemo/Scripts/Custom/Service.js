//Employee
app.service("employeeService", function ($http) {

    //List
    this.GetList = function() {
        return $http.post("/Employee/GetListResult");
    }

    //GetDesignationResult
    this.GetDesignationResult = function() {
        return $http.post("/Employee/GetDesignationResult");
    }

    //GetHobbyResult
    this.GetHobbyResult = function() {
        return $http.post("/Employee/GetHobbyResult");
    }


    //GetById
    this.GetById = function (EmpId) {
        var response = $http({
            method: "post",
            url: "/Employee/GetById",
            params: {
                empId: JSON.stringify(EmpId)
            }
        });
        return response;
    }
    //Delete
    this.Delete = function (EmpId) {
        var responce = $http({
            method: "post",
            url: "/Employee/Delete",
            params: { empId: JSON.stringify(EmpId) },
            dataType: "json"
        });
        return responce;
    }

    //Add
    this.Add = function (emp) {
        var response = $http({
            method: "post",
            url: "Employee/Index",
            data: JSON.stringify(emp),
            dataType: "json"
        });
        return response;
    }

    //Update 
    this.Update = function (emp) {
        var response = $http({
            method: "post",
            url: "Employee/Index",
            data: JSON.stringify(emp),
            dataType: "json"
        });
        return response;
    }

    //Upload Image
    this.uploadFile = function (file, uploadUrl) {
        var fd = new FormData();
        fd.append('EmpImage', file);
        var response = $http.post('/Employee/Upload', fd,
        {
            transformRequest: angular.identity,
            headers: { 'Content-Type': undefined }
        });
        return response;
    }

});


//Role
app.service("roleService", function ($http) {

    //List
    this.GetList = function () {
        return $http.get("/Role/GetRoleListResult");
    };

    //Add
    this.Add = function (role) {
        var response = $http({
            method: "post",
            url: "Role/Index",
            data: JSON.stringify(role),
            dataType: "json"
        });
        return response;
    }

    //Update 
    this.Update = function (role) {
        var response = $http({
            method: "post",
            url: "/Role/Index",
            data: JSON.stringify(role),
            dataType: "json"
        });
        return response;
    }

    //GetRoleById
    this.GetRoleById = function (RoleId) {
        var response = $http({
            method: "post",
            url: "/Role/GetRoleById",
            params: {
                RoleId: JSON.stringify(RoleId)
            }
        });
        return response;
    }

    //Delete
    this.Delete = function (RoleId) {
        var response = $http({
            method: "post",
            url: "/Role/Delete",
            params: {
                RoleId: JSON.stringify(RoleId)
            }
        });
        return response;
    }
});