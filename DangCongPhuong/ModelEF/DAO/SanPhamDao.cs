using ModelEF.Model;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models.DAO
{
    public class SanPhamDao
    {
        private DangCongPhuongContext db;
        public SanPhamDao()
        {
            db = new DangCongPhuongContext();
        }
        //tìm sp thêm 
        public SanPham Find(string sanPham)
        {
            return db.SanPhams.Find(sanPham); ;
        }
        public List<SanPham> ListAll()
        {
            return db.SanPhams.ToList();
        }
        //tìm kiếm
        public IEnumerable<SanPham> ListWhereAll(string keysearch, int page, int pagesize)
        {
            IQueryable<SanPham> model = db.SanPhams;
            if (!string.IsNullOrEmpty(keysearch))
            {
                model = model.Where(x => x.TenSP.Contains(keysearch)).OrderBy(x => x.Soluong).ThenByDescending(x => x.Dongia);
            }
            return model.OrderBy(x => x.Soluong).ThenByDescending(x => x.Dongia).ToPagedList(page, pagesize);
        }
        public bool Delete(string masp)
        {
            try
            {
                var sanpham = db.SanPhams.Find(masp);
                db.SanPhams.Remove(sanpham);
                db.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }
        public void Insert(SanPham entitySanPham)
        {
            db.SanPhams.Add(entitySanPham);
            db.SaveChanges();
        }
    }
}
