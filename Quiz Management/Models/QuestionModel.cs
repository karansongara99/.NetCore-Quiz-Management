using System.ComponentModel.DataAnnotations;

namespace QuizApplication.Models
{
    public class QuestionModel
    {
        public int QuestionID { get; set; }

        [Required(ErrorMessage = "Enter Question Text is Required")]
        public string QuestionText { get; set; }
        public int QuestionLevelID { get; set; }

        [Required(ErrorMessage = "Enter OptionA is Required")]
        public string OptionA { get; set; }

        [Required(ErrorMessage = "Enter OptionB is Required")]
        public string OptionB { get; set; }

        [Required(ErrorMessage = "Enter OptionC is Required")]
        public string OptionC { get; set; }

        [Required(ErrorMessage = "Enter OptionD is Required")]
        public string OptionD { get; set; }

        [Required(ErrorMessage = "Enter Correct Option is Required")]
        public string CorrectOption { get; set; }

        [Required(ErrorMessage = "Enter Question Marks is Required")]
        public int QuestionMarks { get; set; }
        public bool IsActive { get; set; }
        public int UserID { get; set; }
        public int Created { get; set; }
        public int Modified { get; set; }
    }
}
