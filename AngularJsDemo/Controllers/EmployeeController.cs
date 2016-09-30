using System;
using System.Linq;
using System.Web.Mvc;
using AngularJsDemo.Models.CustomModel;
using AngularJsDemo.Models.CustomRepository;
using System.Web;

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

        #region Upload Image
        [HttpPost]
        public virtual ActionResult Upload()
        {
            HttpPostedFileBase myFile = Request.Files["EmpImage"];

            string message = "";
            string logoError = "";
            string ClientInfoPath = Server.MapPath("/Uploads/");
            if (Request.Files["EmpImage"].ContentLength != 0)
            {
                /*Store name in database*/
                string FileName =  DateTime.Now.ToString().Replace("-", "").Replace(":", "").Replace(" ", "").Replace("/", "");

                string extention = myFile.FileName.Substring(myFile.FileName.LastIndexOf(".") + 1);
                string fullpath = ClientInfoPath + "\\" + FileName + "." + extention;
                if (extention == "png" || extention == "jpg" || extention == "jpeg")
                {
                    //System.IO.Stream stream = myFile.InputStream;
                    //System.Drawing.Image image = System.Drawing.Image.FromStream(stream);

                    //int height = image.Height;
                    //int width = image.Width;

                    //if ((width <= 200 && width>=35) && (height <= 200 && height>=35))
                    //{
                    myFile.SaveAs(fullpath);
                    message = "\\Uploads\\" + FileName + "." + extention;
                    //}
                    //else { logoError = "Required image width and height is less than 200 and greater than 35.\n"; }
                }
                else
                {
                    message = "N";
                }
            }
            return Json(new { message = message, logoError = logoError }, "text/html");
        }
        #endregion
    }
}