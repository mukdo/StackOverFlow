using Microsoft.Owin;
using Owin;
using SharpArch.NHibernate.Web.Mvc;

[assembly: OwinStartupAttribute(typeof(StackOverflow.Web.Startup))]
namespace StackOverflow.Web
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
            ConfigureData();
        }

        private static void ConfigureData()
        {
            var storage = new WebSessionStorage(System.Web.HttpContext.Current.ApplicationInstance);
            DataConfig.Configure(storage);
        }
    }
}
