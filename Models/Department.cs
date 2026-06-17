using System;
using System.ComponentModel.DataAnnotations;

namespace DepartmentMaster.Models
{
    public class Department
    {
        [Key]
        public int RecordNo { get; set; }

        [Required(ErrorMessage = "Department Code is required")]
        [StringLength(50, MinimumLength = 2, ErrorMessage = "Department Code must be between 2 and 50 characters")]
        [Display(Name = "Department Code")]
        public string DepartmentCode { get; set; }

        [Required(ErrorMessage = "Department Name is required")]
        [StringLength(100, MinimumLength = 2, ErrorMessage = "Department Name must be between 2 and 100 characters")]
        [Display(Name = "Department Name")]
        public string DepartmentName { get; set; }

        [Required(ErrorMessage = "Japanese Head is required")]
        [StringLength(1)]
        [Display(Name = "Got Japanese Head")]
        public string JapanHead { get; set; }

        [Required(ErrorMessage = "Office Type is required")]
        [StringLength(1)]
        [Display(Name = "Direct/Indirect Dept")]
        public string Office { get; set; }

        [Required(ErrorMessage = "Section is required")]
        [StringLength(1)]
        [Display(Name = "Got Section")]
        public string Section { get; set; }

        [Required(ErrorMessage = "Abbreviation is required")]
        [StringLength(50, MinimumLength = 1, ErrorMessage = "Abbreviation must be between 1 and 50 characters")]
        [Display(Name = "General Abbreviation")]
        public string Prefix { get; set; }

        [StringLength(50)]
        [Display(Name = "Created By")]
        public string CreatedBy { get; set; }

        [Display(Name = "Created On")]
        public DateTime? CreatedOn { get; set; }

        [StringLength(50)]
        [Display(Name = "Edited By")]
        public string EditedBy { get; set; }

        [Display(Name = "Edited On")]
        public DateTime? EditedOn { get; set; }

        [Display(Name = "Active")]
        public bool IsActive { get; set; } = true;
    }
}
