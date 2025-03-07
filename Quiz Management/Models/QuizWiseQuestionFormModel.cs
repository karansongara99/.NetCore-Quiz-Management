namespace QuizApplication.Models
{
    public class QuizWiseQuestionFormModel
    {
        public int quizselectedID { get; set; }
        public List<QuizModel> quizlist { get; set; }
        public List<String> questionSelectedID { get; set; }
        public List<QuestionModel> questionlist { get; set; }
    }
}
