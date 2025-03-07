using System.Data;
using System.Reflection;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using QuizApplication.Models;
using CrudOperationEntityFrameWork.Constants;


namespace QuizApplication.Controllers
{
    public class QuestionLevelController : Controller
    {
        private IConfiguration configuration;
        public QuestionLevelController(IConfiguration _configuration)
        {
            configuration = _configuration;
        }

        public IActionResult QuestionLevelList()
        {
            string connectionString = this.configuration.GetConnectionString("ConnectionString");
            SqlConnection connection = new(connectionString);
            connection.Open();
            SqlCommand command = connection.CreateCommand();
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "PR_MST_QuestionLevel_SelectAll";
            command.Parameters.AddWithValue("@UserID", HttpContext.Session.GetString(Constants.USERID_SESSION_KEY));
            SqlDataReader reader = command.ExecuteReader();
            DataTable table = new();
            table.Load(reader);
            return View(table);
        }

        public IActionResult QuestionLevelDelete(int QuestionLevelID)
        {
            try
            {
                string connectionString = configuration.GetConnectionString("ConnectionString");
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    SqlCommand command = connection.CreateCommand();
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "PR_MST_QuestionLevel_DeleteByPk";
                    command.Parameters.Add("@QuestionLevelID", SqlDbType.Int).Value = QuestionLevelID;
                    command.ExecuteNonQuery();
                }

                TempData["SuccessMessage"] = "QuestionLevel deleted successfully.";
                return RedirectToAction("QuestionLevelList");
            }
            catch (Exception ex)
            {
                TempData["ErrorMessage"] = "An error occurred while deleting the QuestionLevel: " + ex.Message;
                return RedirectToAction("QuestionLevelList");
            }
        }
        public IActionResult QuestionLevelForm(int QuestionLevelID)
        {
            if (QuestionLevelID == 0)
            {
                TempData["PageTitle"] = "Add QuestionLevel";
            }
            else
            {
                TempData["PageTitle"] = "Edit QuestionLevel";
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

            //---------------------------Question Level Backend Code 
            ViewBag.QuestionLevelID = QuestionLevelID;
            SqlConnection sqlConnection = new SqlConnection(connectionString);
            sqlConnection.Open();
            SqlCommand sqlCommand = sqlConnection.CreateCommand();
            sqlCommand.CommandType = CommandType.StoredProcedure;
            sqlCommand.CommandText = "PR_MST_QuestionLevel_SelectByPk";
            sqlCommand.Parameters.AddWithValue("@QuestionLevelID", QuestionLevelID);
            SqlDataReader reader = sqlCommand.ExecuteReader();
            DataTable table = new DataTable();
            table.Load(reader);
            QuestionLevelsModel questionLevelModel = new QuestionLevelsModel();

            foreach (DataRow dataRow in table.Rows)
            {
                questionLevelModel.QuestionLevelID = Convert.ToInt32(@dataRow["QuestionLevelID"]);
                questionLevelModel.QuestionLevel = dataRow["QuestionLevel"].ToString();
                questionLevelModel.UserID = Convert.ToInt32(@dataRow["UserID"]);
            }

            return View("QuestionLevelForm", questionLevelModel);
        }

        public IActionResult QuestionLevelSave(QuestionLevelsModel model)
        {
            if (ModelState.IsValid)
            {
                string connectionString = this.configuration.GetConnectionString("ConnectionString");
                SqlConnection connection = new SqlConnection(connectionString);
                connection.Open();
                SqlCommand command = connection.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                if (model.QuestionLevelID == 0)
                {
                    command.CommandText = "PR_MST_QuestionLevel_Insert";
                    command.Parameters.Add("@Created", SqlDbType.DateTime).Value = DateTime.Now;
                }
                else
                {
                    command.CommandText = "PR_MST_QuestionLevel_UpdateByPk";
                    command.Parameters.Add("@QuestionLevelID", SqlDbType.Int).Value = model.QuestionLevelID;
                }
                command.Parameters.Add("@QuestionLevel",SqlDbType.VarChar).Value = model.QuestionLevel;
                command.Parameters.Add("@UserID", SqlDbType.Int).Value = HttpContext.Session.GetString(Constants.USERID_SESSION_KEY);
                command.Parameters.Add("@Modified", SqlDbType.DateTime).Value = DateTime.Now;
                command.ExecuteNonQuery();
                return RedirectToAction("QuestionLevelList");
            }
            return View("QuestionLevelForm", model);
        }
    }
}
