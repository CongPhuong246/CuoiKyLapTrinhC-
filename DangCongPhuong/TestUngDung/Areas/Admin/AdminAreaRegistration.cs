using System.Web.Mvc;

namespace TestUngDung.Areas.Admin
{
    public class AdminAreaRegistration : AreaRegistration 
    {
        public override string AreaName 
        {
            get 
            {
                return "Admin";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context) 
        {

            context.MapRoute(
                "KichHoat_default",
                "Admin/{controller}/{action}/{id}",
                new { action = "KichHoat", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "Khoa_default",
                "Admin/{controller}/{action}/{id}",
                new { action = "Khoa", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "Delete_default",
                "Admin/{controller}/{action}/{id}",
                new { action = "Delete", id = UrlParameter.Optional }
            );
            //context.MapRoute(
            //    "User_Index_default",
            //    "Admin/{controller}/{action}/{id}",
            //    new { controller = "User", action = "Index", id = UrlParameter.Optional }
            //);

            context.MapRoute(
                "Admin_default",
                "Admin/{controller}/{action}/{id}",
                new { action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}