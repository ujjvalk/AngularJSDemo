using System;
using System.Data.Entity;
using System.Linq;
using System.Web.Mvc;
using AngularJsDemo.Models;

namespace AngularJsDemo.Controllers
{
    public class RoleController : Controller
    {
        // GET: Role
        public ActionResult Index()
        {
            return View();
        }

        public JsonResult GetRoleById(long RoleId = 0)
        {
            using (TestDemoEntities db = new TestDemoEntities())
            {
                return Json(db.tblRoles.First(e => e.RoleId == RoleId) , JsonRequestBehavior.AllowGet);
            }
        }
        public JsonResult GetRoleListResult()
        {
            using (TestDemoEntities db = new TestDemoEntities())
            {
                return Json(db.tblRoles.ToList(), JsonRequestBehavior.AllowGet);
            }
        }

        [HttpPost]
        public JsonResult Index(tblRole model)
        {
            string message;
            bool flag;
            try
            {
                using (var db = new TestDemoEntities())
                {
                    if (model.RoleId > 0)
                    {
                        //Update
                        db.Entry(model).State = EntityState.Modified;
                        db.SaveChanges();
                    }
                    else
                    {
                        //ADD
                        db.tblRoles.Add(model);
                        db.SaveChanges();
                    }
                    flag = true;
                    message = "Record saved successfully.";
                }
            }
            catch (Exception)
            {
                flag = false;
                message = "Please try again.";
            }
            return Json(new { flag, message });
        }

        public JsonResult Delete(long roleId = 0)
        {
            string message;
            bool flag;

            try
            {
                using (var db = new TestDemoEntities())
                {
                    db.Database.ExecuteSqlCommand("delete from tblRole where RoleId={0}", roleId);
                    flag = true;
                    message = "Record deleted successfully.";
                }
            }
            catch (Exception)
            {
                flag = false;
                message = "Please try again.";
            }
            return Json(new { flag, message }, JsonRequestBehavior.AllowGet);
        }
    }
}