using ModelEF.DAO;
using ModelEF.Model;
using Models.DAO;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace TestUngDung.Areas.Admin.Controllers
{
    public class SanPhamController : BaseController
    {
        DangCongPhuongContext db = new DangCongPhuongContext();
        // GET: Admin/SanPham
        public ActionResult Index(int page = 1, int pagesize = 7)
        {
            var sanpham = new SanPhamDao();
            var model = sanpham.ListAll();

            return View(model.ToPagedList(page, pagesize));
        }
        [HttpPost]
        public ActionResult Index(string searchString, int page = 1, int pagesize = 7)
        {
            var sanpham = new SanPhamDao();
            var model = sanpham.ListWhereAll(searchString, page, pagesize);
            ViewBag.SearchString = searchString;
            return View(model.ToPagedList(page, pagesize));
        }
        [HttpDelete]
        public ActionResult Delete(string id)
        {
            var dao = new SanPhamDao().Delete(id);
            return RedirectToAction("Index");
        }
        public ActionResult Chitiet(string id)
        {
            return View(db.SanPhams.Where(s => s.MaSP == id).FirstOrDefault());
        }
        public ActionResult Create()
        {
            SetViewBag();
            return View();
        }


        [HttpPost]
        public ActionResult Create(SanPham model)
        {
            //kiểm tra mã sp có trùng không
            if (ModelState.IsValid)
            {
                var dao = new SanPhamDao();
                if (dao.Find(model.MaSP) != null)
                {
                    SetAlert("Mã sản phẩm tồn tại, Mời nhập tên khác", "warning");
                    return RedirectToAction("Create", "SanPham");
                }
                dao.Insert(model);
                //ModelState.AddModelError("", "Tạo sản phẩm không thành công");
                SetAlert("Thêm sản phẩm thành công", "success");
                return RedirectToAction("Index", "SanPham");
            }
            SetViewBag();
            return View();
        }
        public void SetViewBag(long? selectedId = null)
        {
            var dao = new LoaiSPDao();
            ViewBag.MaLoaiSP = new SelectList(dao.ListAll(), "MaLoaiSP", "TenLoaiSP", selectedId);
        }
        public string ProcessUpload(HttpPostedFileBase file)
        {
            file.SaveAs(Server.MapPath("~/Images/" + file.FileName));
            return "Images/" + file.FileName;
        }
    }
}