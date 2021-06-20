using ModelEF.DAO;
using ModelEF.Model;
using Models.DAO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace TestUngDung.Areas.Admin.Controllers
{
    public class TrangNguoiDungController : Controller
    {
        // GET: Admin/TrangNguoiDung
        public ActionResult Index(string searchString)
        {
            var sanpham = new TrangNguoiDungDao();
            var model = sanpham.ListWhereAll(searchString);
            ViewBag.SearchString = searchString;
            return View(model);
        }
    }
}