using ModelEF.Model;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ModelEF.DAO
{
    public class UserDao
    {
        private DangCongPhuongContext db;

        public UserDao()
        {
            db = new DangCongPhuongContext();
        }

        public int login(string user, string pass)
        {
            var result = db.TaiKhoans.SingleOrDefault(x => x.TenTK.Contains(user) && x.MatKhau.Contains(pass));
            if (result == null)
            {
                return 0;
            }
            else
            {
                return 1;
            }
        }

        public List<TaiKhoan> ListAll()
        {
            return db.TaiKhoans.ToList();
        }

        //tìm kiếm
        public IEnumerable<TaiKhoan> ListWhereAll(string keysearch, int page, int pagesize)
        {
            IQueryable<TaiKhoan> model = db.TaiKhoans;
            if (!string.IsNullOrEmpty(keysearch))
            {
                model = model.Where(x => x.TenTK.Contains(keysearch));
            }
            return model.OrderBy(x => x.TenTK).ToPagedList(page,pagesize);
        }
        public bool KichHoat(string matk)
        {
            var taikhoan = db.TaiKhoans.Where(x => x.MaTK.Contains(matk)).FirstOrDefault();
            if (taikhoan != null)
            {
                taikhoan.TrangThai = true;
                db.SaveChanges();
                return true;
            }
            return false;
        }

        public bool Khoa(string matk)
        {
            var taikhoan = db.TaiKhoans.Where(x => x.MaTK.Contains(matk)).FirstOrDefault();
            if (taikhoan != null)
            {
                taikhoan.TrangThai = false;
                db.SaveChanges();
                return true;
            }
            return false;
        }
        public TaiKhoan Find(string matk)
        {
            return db.TaiKhoans.Find(matk); ;
        }
        public bool Delete(string matk)
        {
            try
            {
                var taikhoan = db.TaiKhoans.Find(matk);
                db.TaiKhoans.Remove(taikhoan);
                db.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

    }
}
