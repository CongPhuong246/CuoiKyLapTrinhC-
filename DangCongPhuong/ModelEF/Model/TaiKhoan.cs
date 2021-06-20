namespace ModelEF.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("TaiKhoan")]
    public partial class TaiKhoan
    {
        [Key]
        [StringLength(4)]
        [Display(Name = "Mã tài khoản")]
        public string MaTK { get; set; }

        [StringLength(50)]
        [Display(Name = "Tên tài khoản")]
        public string TenTK { get; set; }

        [StringLength(50)]
        [Display(Name = "Mật khẩu")]
        public string MatKhau { get; set; }
        [Display(Name = "Trạng thái")]
        public bool? TrangThai { get; set; }
    }
}
