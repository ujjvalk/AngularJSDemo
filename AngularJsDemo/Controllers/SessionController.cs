using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace AngularJsDemo.Controllers
{
    public class SessionController : Controller
    {
        protected override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            HttpSessionStateBase session = filterContext.HttpContext.Session;
            if (session != null && (session["Fullname"] == null || session["Fullname"].ToString() == ""))
            {
                filterContext.Result = new RedirectResult("/");
            }
        }
    }
}