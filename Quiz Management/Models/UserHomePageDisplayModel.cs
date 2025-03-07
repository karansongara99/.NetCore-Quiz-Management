using System.Data;

namespace QuizApplication.Models
{
    public class UserHomePageDisplayModel
    {
        public List<QuizModel> quizData { get; set; } = [];
        public List<QuestionModel> questionData { get; set; } = [];
    }
}
