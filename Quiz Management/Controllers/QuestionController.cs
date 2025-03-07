using System.Data;
using System.Reflection;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using QuizApplication.Models;
using CrudOperationEntityFrameWork.Constants;

namespace QuizApplication.Controllers
{
    public class QuestionController : Controller
    {
        private IConfiguration configuration;
        public QuestionController(IConfiguration _configuration)
        {
            configuration = _configuration;
        }

        public IActionResult QuestionList()
        {
            FillQuestionLevelDropDown();
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

        public IActionResult QuestionDelete(int QuestionID)
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

                TempData["SuccessMessage"] = "Deleted Succesfully";
                return RedirectToAction("QuestionList");
            }
            catch (Exception ex)
            {
                TempData["ErrorMessage"] = "Can't be deleted";
                Console.WriteLine(ex.ToString());
            }
            return RedirectToAction("QuestionList");
        }

        public IActionResult QuestionForm(int QuestionID)
        {
            if (QuestionID == 0)
            {
                TempData["PageTitle"] = "Add Question";
            }
            else
            {
                TempData["PageTitle"] = "Edit Question";
            }

            //------------Question Level Drop Down Model
            string questionLevelConnectionString = this.configuration.GetConnectionString("ConnectionString");

            FillQuestionLevelDropDown();

            //------------User Drop Down Model

            string userConnectionString = this.configuration.GetConnectionString("ConnectionString");
            SqlConnection userSqlConnection = new SqlConnection(userConnectionString);
            userSqlConnection.Open();
            SqlCommand userSqlCommand = userSqlConnection.CreateCommand();
            userSqlCommand.CommandType = CommandType.StoredProcedure;
            userSqlCommand.CommandText = "PR_MST_User_SelectAll";
            SqlDataReader userReader = userSqlCommand.ExecuteReader();
            DataTable userDataTable = new DataTable();
            userDataTable.Load(userReader);
            List<UserDropDownModel> userList = new List<UserDropDownModel>();
            foreach (DataRow data in userDataTable.Rows)
            {
                UserDropDownModel userDropDownModel = new UserDropDownModel();
                userDropDownModel.UserID = Convert.ToInt32(data["UserID"]);
                userDropDownModel.UserName = data["UserName"].ToString();
                userList.Add(userDropDownModel);
            }
            ViewBag.UserList = userList;

            //---------------------------Question Backend Code 

            ViewBag.QuestionID = QuestionID;
            SqlConnection QuestionSqlConnection = new SqlConnection(questionLevelConnectionString);
            QuestionSqlConnection.Open();
            SqlCommand questionSqlCommand = QuestionSqlConnection.CreateCommand();
            questionSqlCommand.CommandType = CommandType.StoredProcedure;
            questionSqlCommand.CommandText = "PR_MST_Question_SelectByPK";
            questionSqlCommand.Parameters.AddWithValue("@QuestionID", QuestionID);
            SqlDataReader questionReader = questionSqlCommand.ExecuteReader();
            DataTable questionTable = new DataTable();
            questionTable.Load(questionReader);
            QuestionModel questionModel = new QuestionModel();

            foreach (DataRow dataRow in questionTable.Rows)
            {
                questionModel.QuestionID = Convert.ToInt32(@dataRow["QuestionID"]);
                questionModel.QuestionText = @dataRow["QuestionText"].ToString();
                questionModel.QuestionLevelID = Convert.ToInt32(@dataRow["QuestionLevelID"]);
                questionModel.OptionA = @dataRow["OptionA"].ToString();
                questionModel.OptionB = @dataRow["OptionB"].ToString();
                questionModel.OptionC = @dataRow["OptionC"].ToString();
                questionModel.OptionD = @dataRow["OptionD"].ToString();
                questionModel.CorrectOption = @dataRow["CorrectOption"].ToString();
                questionModel.QuestionMarks = Convert.ToInt32(@dataRow["QuestionMarks"]);
                questionModel.UserID = Convert.ToInt32(@dataRow["UserID"]);
            }
            Console.WriteLine(questionModel);
            return View("QuestionForm", questionModel);
        }

        private void FillQuestionLevelDropDown()
        {
            string questionLevelConnectionString = this.configuration.GetConnectionString("ConnectionString");
            SqlConnection questionLevelSqlConnection = new SqlConnection(questionLevelConnectionString);
            questionLevelSqlConnection.Open();
            SqlCommand questionLevelSqlCommand = questionLevelSqlConnection.CreateCommand();
            questionLevelSqlCommand.CommandType = CommandType.StoredProcedure;
            questionLevelSqlCommand.CommandText = "PR_MST_QuestionLevel_SelectAll";
            questionLevelSqlCommand.Parameters.AddWithValue("@UserID", HttpContext.Session.GetString(Constants.USERID_SESSION_KEY));

            SqlDataReader questionLevelReader = questionLevelSqlCommand.ExecuteReader();
            DataTable questionLevelDataTable = new DataTable();
            questionLevelDataTable.Load(questionLevelReader);
            List<QuestionLevelDropDown> questionLevelList = new List<QuestionLevelDropDown>();
            foreach (DataRow data in questionLevelDataTable.Rows)
            {
                QuestionLevelDropDown questionLevelDropDownModel = new QuestionLevelDropDown();
                questionLevelDropDownModel.QuestionLevelID = Convert.ToInt32(data["QuestionLevelID"]);
                questionLevelDropDownModel.QuestionLevel = data["QuestionLevel"].ToString();
                questionLevelList.Add(questionLevelDropDownModel);
            }
            ViewBag.QuestionLevelList = questionLevelList;
        }

        public IActionResult QuestionSave(QuestionModel model)
        {
            if (ModelState.IsValid)
            {
                string connectionString = this.configuration.GetConnectionString("ConnectionString");
                SqlConnection connection = new SqlConnection(connectionString);
                connection.Open();
                SqlCommand command = connection.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                if (model.QuestionID == 0)
                {
                    command.CommandText = "PR_MST_Question_Insert";
                    command.Parameters.Add("@Created", SqlDbType.DateTime).Value = DateTime.Now;
                }
                else
                {
                    command.CommandText = "PR_MST_Question_UpdateByPk";
                    command.Parameters.Add("@QuestionID", SqlDbType.Int).Value = model.QuestionID;
                }
                command.Parameters.Add("@QuestionText", SqlDbType.VarChar).Value = model.QuestionText;
                command.Parameters.Add("@QuestionLevelID", SqlDbType.Int).Value = model.QuestionLevelID;
                command.Parameters.Add("@OptionA", SqlDbType.VarChar).Value = model.OptionA;
                command.Parameters.Add("@OptionB", SqlDbType.VarChar).Value = model.OptionB;
                command.Parameters.Add("@OptionC", SqlDbType.VarChar).Value = model.OptionC;
                command.Parameters.Add("@OptionD", SqlDbType.VarChar).Value = model.OptionD;
                command.Parameters.Add("@CorrectOption", SqlDbType.VarChar).Value = model.CorrectOption;
                command.Parameters.Add("@QuestionMarks",SqlDbType.Int).Value = model.QuestionMarks;
                command.Parameters.Add("@UserID", SqlDbType.Int).Value = HttpContext.Session.GetString(Constants.USERID_SESSION_KEY);
                command.Parameters.Add("@Modified", SqlDbType.DateTime).Value = DateTime.Now;
                command.ExecuteNonQuery();
                return RedirectToAction("QuestionList");
            }
            return View("QuestionForm", model);
        }

        //[HttpPost]
        //public IActionResult QuestionSearch(int? questionLevel, string questionText, int? questionMarks)
        //{
        //    string connectionString = configuration.GetConnectionString("ConnectionString");
        //    using (SqlConnection connection = new SqlConnection(connectionString))
        //    {
        //        connection.Open();
        //        SqlCommand command = new SqlCommand("PR_MST_Question_Search", connection)
        //        {
        //            CommandType = CommandType.StoredProcedure
        //        };

        //        command.Parameters.AddWithValue("@QuestionLevel", (object)questionLevel ?? DBNull.Value);
        //        command.Parameters.AddWithValue("@QuestionText", (object)questionText ?? DBNull.Value);
        //        command.Parameters.AddWithValue("@QuestionMarks", (object)questionMarks ?? DBNull.Value);

        //        SqlDataReader reader = command.ExecuteReader();
        //        DataTable table = new DataTable();
        //        table.Load(reader);

        //        //  Debug columns
        //        foreach (DataColumn col in table.Columns)
        //            Console.WriteLine(col.ColumnName);

        //        return View("QuestionList", table);
        //    }
        //}

        [HttpPost]
        public IActionResult QuestionSearch(int? questionLevel, string questionText, int? questionMarks)
        {
            string connectionString = configuration.GetConnectionString("ConnectionString");
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand("PR_MST_Question_Search", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.AddWithValue("@QuestionLevel", (object)questionLevel ?? DBNull.Value);
                    command.Parameters.AddWithValue("@QuestionText", string.IsNullOrEmpty(questionText) ? DBNull.Value : (object)questionText);
                    command.Parameters.AddWithValue("@QuestionMarks", (object)questionMarks ?? DBNull.Value);

                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    DataTable table = new DataTable();
                    adapter.Fill(table);

                    return View("QuestionList", table);
                }
            }
        }

        public void QuestionLevelDropdown()
        {
            string questionLevelConnectionString = this.configuration.GetConnectionString("ConnectionString");
            SqlConnection questionLevelSqlConnection = new SqlConnection(questionLevelConnectionString);
            questionLevelSqlConnection.Open();
            SqlCommand questionLevelSqlCommand = questionLevelSqlConnection.CreateCommand();
            questionLevelSqlCommand.CommandType = CommandType.StoredProcedure;
            questionLevelSqlCommand.CommandText = "PR_MST_QuestionLevel_SelectAll";
            SqlDataReader questionLevelReader = questionLevelSqlCommand.ExecuteReader();
            DataTable questionLevelDataTable = new DataTable();
            questionLevelDataTable.Load(questionLevelReader);
            List<QuestionLevelDropDown> questionLevelList = new List<QuestionLevelDropDown>();
            foreach (DataRow data in questionLevelDataTable.Rows)
            {
                QuestionLevelDropDown questionLevelDropDownModel = new QuestionLevelDropDown();
                questionLevelDropDownModel.QuestionLevelID = Convert.ToInt32(data["QuestionLevelID"]);
                questionLevelDropDownModel.QuestionLevel = data["QuestionLevel"].ToString();
                questionLevelList.Add(questionLevelDropDownModel);
            }
            ViewBag.QuestionLevels = questionLevelList;
        }
    }
}
