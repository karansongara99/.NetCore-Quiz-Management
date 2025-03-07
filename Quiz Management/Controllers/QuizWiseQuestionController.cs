using System.Data;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using CrudOperationEntityFrameWork.Constants;


namespace QuizApplication.Controllers
{
    public class QuizWiseQuestionController : Controller
    {
        private IConfiguration configuration;
        public QuizWiseQuestionController(IConfiguration _configuration)
        {
            configuration = _configuration;
        }
        public IActionResult QuizWiseQuestionList()
        {
            string connectionString = this.configuration.GetConnectionString("ConnectionString");
            SqlConnection connection = new(connectionString);
            connection.Open();
            SqlCommand command = connection.CreateCommand();
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "PR_MST_Quiz_SelectAll";
            command.Parameters.AddWithValue("@UserID", HttpContext.Session.GetString(Constants.USERID_SESSION_KEY));
            SqlDataReader reader = command.ExecuteReader();
            DataTable table = new();
            table.Load(reader);
            return View(table);
        }

        public IActionResult QuizWiseQuestionForm()
        {
            string connectionString = this.configuration.GetConnectionString("ConnectionString");
            SqlConnection connection = new(connectionString);
            connection.Open();
            SqlCommand command = connection.CreateCommand();
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "PR_MST_Question_SelectAll";
            command.Parameters.AddWithValue("@UserID", HttpContext.Session.GetString(Constants.USERID_SESSION_KEY));

            SqlDataReader reader = command.ExecuteReader();
            DataTable table = new();
            table.Load(reader);
            return View(table);
        }
       
        public IActionResult QuizWiseQuestionDetails()
        {
            string connectionString = this.configuration.GetConnectionString("ConnectionString");
            SqlConnection connection = new(connectionString);
            connection.Open();
            SqlCommand command = connection.CreateCommand();
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "PR_MST_Question_SelectAll";
            command.Parameters.AddWithValue("@UserID", HttpContext.Session.GetString(Constants.USERID_SESSION_KEY));

            SqlDataReader reader = command.ExecuteReader();
            DataTable table = new();
            table.Load(reader);
            return View(table);
        }

        public IActionResult QuizWiseQuestionQuizDelete(int QuizID)
        {
            try
            {
                string connectionString = this.configuration.GetConnectionString("ConnectionString");
                SqlConnection sqlConnection = new SqlConnection(connectionString);
                sqlConnection.Open();
                SqlCommand sqlCommand = sqlConnection.CreateCommand();
                sqlCommand.CommandType = CommandType.StoredProcedure;
                sqlCommand.CommandText = "PR_MST_Quiz_DeleteByPk";
                sqlCommand.Parameters.Add("@QuizID", SqlDbType.Int).Value = QuizID;
                sqlCommand.ExecuteNonQuery();

            }
            catch (Exception ex)
            {
                TempData["ErrorMessage"] = "Can't be deleted";
                Console.WriteLine(ex.ToString());
            }
            return RedirectToAction("QuizWiseQuestionList");
        }

        public IActionResult QuizWiseQuestionDelete(int QuestionID)
        {
            try
            {
                string connectionString = this.configuration.GetConnectionString("ConnectionString");
                SqlConnection sqlConnection = new SqlConnection(connectionString);
                sqlConnection.Open();
                SqlCommand sqlCommand = sqlConnection.CreateCommand();
                sqlCommand.CommandType = CommandType.StoredProcedure;
                sqlCommand.CommandText = "PR_MST_Question_DeleteByPk";
                sqlCommand.Parameters.Add("@QuestionID", SqlDbType.Int).Value = QuestionID;
                sqlCommand.ExecuteNonQuery();

            }
            catch (Exception ex)
            {
                TempData["ErrorMessage"] = "Can't be deleted";
                Console.WriteLine(ex.ToString());
            }
            return RedirectToAction("QuizWiseQuestionList");
        }
    }
}
