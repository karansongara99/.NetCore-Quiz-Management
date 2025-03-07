using System.Data;
using System.Diagnostics;
using System.Net.NetworkInformation;
using CrudOperationEntityFrameWork.Services;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using QuizApplication.Models;
using CrudOperationEntityFrameWork.Constants;

using static System.Runtime.InteropServices.JavaScript.JSType;

namespace QuizApplication.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private IConfiguration configuration;
        private readonly SessionService sessionService;

        public HomeController(IConfiguration _configuration, SessionService sessionService)
        {
            configuration = _configuration;
            this.sessionService = sessionService;
        }

        public IActionResult Index()
        {
            ViewBag.UserName = sessionService.GetUserName();
            string connectionString = this.configuration.GetConnectionString("ConnectionString");
            SqlConnection connection = new(connectionString);
            connection.Open();
            SqlCommand command = connection.CreateCommand();

            //Quiz Count ------------------------------
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "PR_MST_Quiz_Count";
            command.Parameters.AddWithValue("@UserID", HttpContext.Session.GetString(Constants.USERID_SESSION_KEY));
            SqlDataReader reader = command.ExecuteReader();
            DataTable table = new();
            table.Load(reader);
            foreach(DataRow dataRow in table.Rows)
            {
                TempData["QuizCount"] = dataRow["Count"];
            }



            //Question Count -------------------------
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "PR_MST_Question_Count";
            reader = command.ExecuteReader();
            table = new();
            table.Load(reader);
            foreach (DataRow dataRow in table.Rows)
            {
                TempData["QuestionCount"] = dataRow["Count"];
            }


            //QuestionLevel Count -----------------------------------
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "PR_MST_QuestionLevel_Count";
            reader = command.ExecuteReader();
            table = new();
            table.Load(reader);
            foreach (DataRow dataRow in table.Rows)
            {
                TempData["QuestionLevelCount"] = dataRow["Count"];
            }


            // Top 10 Quiz 


            UserHomePageDisplayModel userHomePageDisplayModel = new();

            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "PR_MST_Quiz_TopTen";
            reader = command.ExecuteReader();
            table = new();
            table.Load(reader);

            foreach (DataRow dataRow in table.Rows)
            {
                var quizModel = new QuizModel();
                quizModel.QuizID = (int)dataRow["QuizID"];
                quizModel.QuizName = (string)dataRow["QuizName"];
                quizModel.QuizDate = DateTime.Parse(dataRow["QuizDate"].ToString());
                quizModel.TotalQuestions = (int)dataRow["TotalQuestions"];
                userHomePageDisplayModel.quizData.Add(quizModel);
            }


            // Top 10 Questions
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "PR_MST_Question_TopTen";
            reader = command.ExecuteReader();
            table = new();
            table.Load(reader);

            foreach (DataRow dataRow in table.Rows)
            {
                var questionModel = new QuestionModel();
                questionModel.QuestionID = (int)dataRow["QuestionId"];
                questionModel.QuestionText = (string)dataRow["QuestionText"];
                questionModel.QuestionMarks = (int)dataRow["QuestionMarks"];
                questionModel.CorrectOption = (string)dataRow["CorrectOption"];
                userHomePageDisplayModel.questionData.Add(questionModel);
            }

            return View(userHomePageDisplayModel);
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
