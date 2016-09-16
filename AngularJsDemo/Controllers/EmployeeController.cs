using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using AngularJsDemo.Models.CustomModel;
using AngularJsDemo.Models.CustomRepository;

namespace AngularJsDemo.Controllers
{
    public class EmployeeController : Controller
    {
        // GET: Employee
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public JsonResult Index(EmployeeModel model)
        {
            bool flag = false;
            string message;
            try
            {
                if (model.HbList.Any())
                {
                    foreach (var item in model.HbList)
                    {
                        if (item.Selelcted == true)
                        {
                            if (string.IsNullOrEmpty(model.EmpHobby))
                            {
                                model.EmpHobby += item.Id.ToString();
                            }
                            else
                            {
                                model.EmpHobby += "," + item.Id.ToString();
                            }

                        }

                    }
                }
                using (var repo = new EmployeeRepository())
                {
                    flag = model.EmpId > 0 ? repo.EditData(model) : repo.AddData(model);
                    message = "Record saved successfully.";
                }
                return Json(new { flag, message });
            }
            catch (Exception)
            {
                message = "Please try again.";
                return Json(new { flag, message });
            }
        }

        [HttpPost]
        public JsonResult GetListResult()
        {
            using (var repo = new EmployeeRepository())
            {
                return Json(repo.GetList().EmpList);
            }
        }

        [HttpPost]
        public JsonResult GetDesignationResult()
        {
            using (var repo = new EmployeeRepository())
            {
                return Json(repo.DegList(), JsonRequestBehavior.AllowGet);
            }
        }

        [HttpPost]
        public JsonResult GetHobbyResult()
        {
            using (var repo = new EmployeeRepository())
            {
                return Json(repo.HbList());
            }
        }

        [HttpPost]
        public JsonResult GetById(long empId = 0)
        {
            using (var repo = new EmployeeRepository())
            {
                var data = repo.GetById(empId);
                if (data != null)
                {
                    if (data.EmpHobby != null)
                    {
                        var hobbyData = repo.HbList(data.EmpHobby.Split(','));
                        if (hobbyData.Any())
                        {
                            data.HbList = hobbyData;
                        }
                    }
                }
                return Json(data);
            }
        }

        [HttpPost]
        public JsonResult Delete(long empId = 0)
        {
            using (var repo = new EmployeeRepository())
            {
                string message;
                bool flag = repo.DeleteRecord(empId);
                if (flag)
                {
                    message = "Record deleted successfully.";
                }
                else
                {
                    message = "Please try again.";
                }
                return Json(new { flag, message });
            }
        }
    }
}