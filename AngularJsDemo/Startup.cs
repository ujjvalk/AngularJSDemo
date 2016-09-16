using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(AngularJsDemo.Startup))]
namespace AngularJsDemo
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
