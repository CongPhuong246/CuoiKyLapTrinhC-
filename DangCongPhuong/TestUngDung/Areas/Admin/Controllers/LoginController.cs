using ModelEF.DAO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TestUngDung.Areas.Admin.Models;
using TestUngDung.Common;

namespace TestUngDung.Areas.Admin.Controllers
{
    public class LoginController : Controller
    {
        // GET: Admin/Login
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Index(LoginModel user)
        {
            if (ModelState.IsValid)
            {  
                var dao = new UserDao();
                var result = dao.login(user.UserName, Encryptor.EncryptMD5(user.Password));
                if (result == 1)
                {
                    //ModelState.AddModelError("", "Đăng nhập thành công");
                    if (user.UserName == "admin")
                    {
                        Session.Add(Constants.USER_SESSION, user);
                        return RedirectToAction("Index", "Home");
                    }
                    else
                    {
                        Session.Add(Constants.USER_SESSION, user);
                        return RedirectToAction("Index", "TrangNguoiDung");
                    }
                }
                else
                {
                    ModelState.AddModelError("", "Đăng nhập thất bại");
                }
            }
            return View("Index");
        }
    }
}