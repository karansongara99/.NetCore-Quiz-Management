using System.Data;
using System.Reflection;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using QuizApplication.Models;
using CrudOperationEntityFrameWork.Constants;


namespace QuizApplication.Controllers
{
    public class QuizController : Controller
    {
        private IConfiguration configuration;
        public QuizController(IConfiguration _configuration)
        {
            configuration = _configuration;
        }

        public IActionResult QuizList()
        {
            string connectionString = this.configuration.GetConnectionString("ConnectionString");
            SqlConnection connection = new(connectionString);
            connection.Open();
            SqlCommand command = connection.CreateCommand();
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "PR_MST_Quiz_SelectAll";
            command.Parameters.AddWithValue("@UserID",HttpContext.Session.GetString(Constants.USERID_SESSION_KEY));
            SqlDataReader reader = command.ExecuteReader();
            DataTable table = new();
            table.Load(reader);
            return View(table);
        }

        public IActionResult QuizDelete(int QuizID) 
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
                TempData["SuccessMessage"] = "Deleted Succesfully";
                return RedirectToAction("QuizList");
            }
            catch (Exception ex)
            {
                TempData["ErrorMessage"] = "Can't be deleted";
                Console.WriteLine(ex.ToString());
            }
            return RedirectToAction("QuizList");
        }
        [HttpGet]

        public IActionResult QuizForm(int QuizID)
        {
            if (QuizID == 0)
            {
                TempData["PageTitle"] = "Add Quiz";
            }
            else
            {
                TempData["PageTitle"] = "Edit Quiz";
            }

            //------------User Drop Down Model

            string connectionString = this.configuration.GetConnectionString("ConnectionString");
            SqlConnection sqlConnection1 = new SqlConnection(connectionString);
            sqlConnection1.Open();
            SqlCommand sqlCommand1 = sqlConnection1.CreateCommand();
            sqlCommand1.CommandType = CommandType.StoredProcedure;
            sqlCommand1.CommandText = "PR_MST_User_SelectAll";
            SqlDataReader reader1 = sqlCommand1.ExecuteReader();
            DataTable dataTable1 = new DataTable();
            dataTable1.Load(reader1);
            List<UserDropDownModel> userList = new List<UserDropDownModel>();
            foreach (DataRow data in dataTable1.Rows)
            {
                UserDropDownModel userDropDownModel = new UserDropDownModel();
                userDropDownModel.UserID = Convert.ToInt32(data["UserID"]);
                userDropDownModel.UserName = data["UserName"].ToString();
                userList.Add(userDropDownModel);
            }
            ViewBag.UserList = userList;

            //---------------------------Quiz Backend Code 
            ViewBag.QuizID = QuizID;
            SqlConnection sqlConnection = new SqlConnection(connectionString);
            sqlConnection.Open();
            SqlCommand sqlCommand = sqlConnection.CreateCommand();
            sqlCommand.CommandType = CommandType.StoredProcedure;
            sqlCommand.CommandText = "PR_MST_Quiz_SelectByID";
            sqlCommand.Parameters.AddWithValue("@QuizID", QuizID);
            SqlDataReader reader = sqlCommand.ExecuteReader();
            DataTable table = new DataTable();
            table.Load(reader);
            QuizModel quizModel = new QuizModel();

            foreach (DataRow dataRow in table.Rows)
            {
                quizModel.QuizID = Convert.ToInt32(@dataRow["QuizID"]);
                quizModel.QuizName = @dataRow["QuizName"].ToString();
                quizModel.TotalQuestions = Convert.ToInt32(@dataRow["TotalQuestions"]);
                quizModel.QuizDate = Convert.ToDateTime(@dataRow["QuizDate"]);

            }

            return View("QuizForm", quizModel);
        }

        public IActionResult QuizSave(QuizModel model)
        {
            if (ModelState.IsValid)
            {
                string connectionString = this.configuration.GetConnectionString("ConnectionString");
                SqlConnection connection = new SqlConnection(connectionString);
                connection.Open();
                SqlCommand command = connection.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                if (model.QuizID == 0)
                {
                    command.CommandText = "PR_MST_Quiz_Insert";
                    command.Parameters.Add("@Created", SqlDbType.DateTime).Value = DateTime.Now;
                }
                else
                {
                    command.CommandText = "PR_MST_Quiz_UpdateByPK";
                    command.Parameters.Add("@QuizID", SqlDbType.Int).Value = model.QuizID;
                }
                command.Parameters.Add("@QuizName", SqlDbType.VarChar).Value = model.QuizName;
                command.Parameters.Add("@TotalQuestions", SqlDbType.Int).Value = model.TotalQuestions;
                command.Parameters.Add("@QuizDate", SqlDbType.DateTime).Value = model.QuizDate;
                command.Parameters.Add("@UserID", SqlDbType.Int).Value = HttpContext.Session.GetString(Constants.USERID_SESSION_KEY);
                command.Parameters.Add("@Modified", SqlDbType.DateTime).Value = DateTime.Now;
                command.ExecuteNonQuery();
                return RedirectToAction("QuizList");
            }
            return View("QuizForm", model);
        }
    }
}
