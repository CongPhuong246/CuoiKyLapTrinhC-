using ModelEF.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ModelEF.DAO
{
    public class LoaiSPDao
    {
        DangCongPhuongContext db = null;
        public LoaiSPDao()
        {
            db = new DangCongPhuongContext();
        }

        public List<LoaiSP> ListAll()
        {
            return db.LoaiSPs.ToList();
        }
    }
}
