using ModelEF.DAO;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace TestUngDung.Areas.Admin.Controllers
{
    public class UserController : BaseController
    {
        // GET: Admin/User
        public ActionResult Index(int page = 1, int pagesize = 5)
        {
            var taikhoan = new UserDao();
            var model = taikhoan.ListAll();
            return View(model.ToPagedList(page, pagesize));
        }

        [HttpPost]
        public ActionResult Index(string searchString, int page = 1, int pagesize = 5)
        {
            var taikhoan = new UserDao();
            var model = taikhoan.ListWhereAll(searchString, page, pagesize);
            ViewBag.SearchString = searchString;
            return View(model.ToPagedList(page, pagesize));
        }

        [HttpGet]
        public ActionResult KichHoat(string id)
        {
            var danhmuc = new UserDao();
            if (danhmuc.KichHoat(id))
            {
                SetAlert("Đã kích hoạt thành công", "success");
                return RedirectToAction("Index");
            }
            SetAlert("Kích hoạt không thành công", "error");
            return RedirectToAction("Index");
        }

        [HttpGet]
        public ActionResult Khoa(string id)
        {
            var danhmuc = new UserDao();
            if (danhmuc.Khoa(id))
            {
                SetAlert("Đã khoá thành công", "success");
                return RedirectToAction("Index");
            }
            SetAlert("Khoá không thành công", "error");
            return RedirectToAction("Index");
        }

        [HttpDelete]
        public ActionResult Delete(string id)
        {
            var dao = new UserDao().Delete(id);
            return RedirectToAction("Index");
        }
    }
}