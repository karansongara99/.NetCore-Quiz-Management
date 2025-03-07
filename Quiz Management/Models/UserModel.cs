using System.ComponentModel.DataAnnotations;

namespace QuizApplication.Models
{
    public class UserModel
    {
        public int UserID { get; set; }
        [Required(ErrorMessage = "Enter Username")]
        public string UserName { get; set; }
        [Required(ErrorMessage = "Enter Password")]
        public string Password { get; set; }
        [Required(ErrorMessage = "Enter EmailID")]
        public string Email { get; set; }
        [StringLength(10)]
        [Required(ErrorMessage = "Enter MobileNo")]
        public string Mobile { get; set; }
        public bool IsActive { get; set; }
        public bool IsAdmin { get; set; }
        public DateTime Created { get; set; } = DateTime.Now;
        public DateTime Modified { get; set; } = DateTime.Now;
    }

    public class UserDropDownModel()
    {
        public int UserID { get; set; }
        public string UserName { get; set; }
    }
    public class UserLoginModel
    {
        [Required(ErrorMessage = "Username is required.")]
        public string UserName { get; set; }

        [Required(ErrorMessage = "Password is required.")]
        public string Password { get; set; }
    }

}
