using System.Web;
using System.Web.Optimization;

namespace AngularJsDemo
{
    public class BundleConfig
    {
        // For more information on bundling, visit http://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                    "~/Theme/js/jquery-1.11.3.min.js"));

            bundles.Add(new ScriptBundle("~/bundles/angularJS").Include(
                     "~/Scripts/angular.js"));

            bundles.Add(new ScriptBundle("~/bundles/customJS").Include(
                                 "~/Scripts/Custom/Module.js",
                                 "~/Scripts/Custom/Service.js",
                                 "~/Scripts/Custom/Controller.js"));
        }
    }
}
