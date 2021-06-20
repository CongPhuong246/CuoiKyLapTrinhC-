namespace ModelEF.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("SanPham")]
    public partial class SanPham
    {
        [Key]
        [StringLength(4,ErrorMessage ="Số ký tự tối đa là 4")]
        [Display(Name = "Mã sản phẩm")]
        [Required(ErrorMessage ="Bạn chưa nhập mã sản phẩm.")]
        public string MaSP { get; set; }

        [StringLength(200)]
        [Display(Name = "Tên sản phẩm")]
        [Required(ErrorMessage = "Bạn chưa nhập tên sản phẩm.")]
        public string TenSP { get; set; }

        [StringLength(50)]
        [Display(Name = "Đơn vị tính")]
        public string Donvitinh { get; set; }
        [Display(Name = "Đơn giá")]
        public double? Dongia { get; set; }
        [Display(Name = "Hình sản phẩm")]
        public string HinhSP { get; set; }
        [Display(Name = "Trạng thái")]
        public bool? TrangThai { get; set; }

        [StringLength(4)]
        [Display(Name = "Mã loại sản phẩm")]
        public string MaLoaiSP { get; set; }
        [Display(Name = "Số lượng")]
        [Range(0,Int32.MaxValue,ErrorMessage ="Bạn phải nhập số.")]
        public int? Soluong { get; set; }

        public virtual LoaiSP LoaiSP { get; set; }
    }
}
