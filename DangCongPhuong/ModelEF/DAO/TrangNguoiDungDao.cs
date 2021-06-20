using ModelEF.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ModelEF.DAO
{
    public class TrangNguoiDungDao
    {
        private DangCongPhuongContext db;

        public TrangNguoiDungDao()
        {
            db = new DangCongPhuongContext();
        }

        public List<SanPham> ListAll()
        {
            return db.SanPhams.ToList();
        }

        public List<SanPham> ListWhereAll(string keysearch)
        {
            if (!string.IsNullOrEmpty(keysearch))
                return db.SanPhams.Where(x => x.TenSP.Contains(keysearch)).ToList();
            return db.SanPhams.ToList();
        }
    }

}
