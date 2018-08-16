using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(WebKarachiNimco.Startup))]
namespace WebKarachiNimco
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
