using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace AngularJsDemo.Models.CustomModel
{
    public class EmployeeModel
    {
        [Key]
        public long EmpId { get; set; }

        [Required(ErrorMessage = "Name is Required.")]
        public string EmpName { get; set; }
        public string EmpAddress { get; set; }
        public string EmpGender { get; set; }
        public string EmpHobby { get; set; }

        [Required(ErrorMessage = "Employee Designation is Required.")]
        public long? EmpDesignation { get; set; }
        public bool? IsDelete { get; set; }
        public bool? IsActive { get; set; }
        public DateTime? DeletedDate { get; set; }
        public DateTime? CreatedDate { get; set; }
        public DateTime? ModifiedDate { get; set; }

        [Required(ErrorMessage = "Email is Requirde")]
        [RegularExpression(@"^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}" +
                            @"\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\" +
                            @".)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$",
                            ErrorMessage = "Email is not valid.")]
        public string EmpEmail { get; set; }

        public string HName { get; set; }

        public string DesName { get; set; }

        public List<EmployeeModel> EmpList { get; set; }

        public List<HobbyList> HbList { get; set; }

        public string EmpImage { get; set; }

        public DateTime? Birthdate { get; set; }
    }

    public class HobbyList
    {
        public long Id { get; set; }
        public string HName { get; set; }
        public bool Selelcted { get; set; }
    }
}
