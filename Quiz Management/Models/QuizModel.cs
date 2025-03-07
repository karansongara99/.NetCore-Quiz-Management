using System.ComponentModel.DataAnnotations;

namespace QuizApplication.Models
{
    public class QuizModel
    {
        public int QuizID { get; set; }

        [Required(ErrorMessage = "Enter Quiz Name")]
        [MaxLength(100)]
        public string QuizName { get; set; }

        [Required(ErrorMessage = "Enter Total Question")]
        public int TotalQuestions { get; set; }

        [Required(ErrorMessage = "Select Quiz Date")]
        public DateTime QuizDate { get; set; }
        public int UserID { get; set; }
        public DateTime Created { get; set; }
        public DateTime Modified { get; set; }
    }

    public class QuizDropDownModel() 
    {
        public int QuizID { get; set; }
        public string QuizName { get; set; }
    }
}
