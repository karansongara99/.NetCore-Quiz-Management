using System.Data;
using CrudOperationEntityFrameWork.Constants;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using QuizApplication.Models;

namespace QuizApplication.Controllers
{
    public class UserController : Controller
    {
        private IConfiguration configuration;
        public UserController(IConfiguration _configuration)
        {
            configuration = _configuration;
        }

        public IActionResult UserDelete(int UserID)
        {
            try
            {
                string connectionString = this.configuration.GetConnectionString("ConnectionString");
                SqlConnection sqlConnection = new SqlConnection(connectionString);
                sqlConnection.Open();
                SqlCommand sqlCommand = sqlConnection.CreateCommand();
                sqlCommand.CommandType = CommandType.StoredProcedure;
                sqlCommand.CommandText = "PR_MST_User_DeleteByPk";
                sqlCommand.Parameters.Add("@UserID", SqlDbType.Int).Value = UserID;
                sqlCommand.ExecuteNonQuery();

            }
            catch (Exception ex)
            {
                TempData["ErrorMessage"] = "Can't be deleted";
                Console.WriteLine(ex.ToString());
            }
            return RedirectToAction("UserList");
        }

        public IActionResult UserList()
        {
            string connectionString = this.configuration.GetConnectionString("ConnectionString");
            SqlConnection connection = new(connectionString);
            connection.Open();
            SqlCommand command = connection.CreateCommand();
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "PR_MST_User_SelectAll";
            SqlDataReader reader = command.ExecuteReader();
            DataTable table = new();
            table.Load(reader);
            return View(table);
        }

        public IActionResult AddEditForm()
        {
            return View();
        }

        public IActionResult SaveUser()
        {
            return View();
        }

        public IActionResult Login()
        {
            return View();
        }

        public IActionResult Registration()
        {
            return View();
        }

        [HttpPost]
        public IActionResult UserRegister(UserModel userRegisterModel)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    string connectionString = this.configuration.GetConnectionString("ConnectionString");
                    SqlConnection sqlConnection = new SqlConnection(connectionString);
                    sqlConnection.Open();
                    SqlCommand sqlCommand = sqlConnection.CreateCommand();
                    sqlCommand.CommandType = System.Data.CommandType.StoredProcedure;
                    sqlCommand.CommandText = "PR_MST_User_Insert";
                    sqlCommand.Parameters.Add("@UserName", SqlDbType.VarChar).Value = userRegisterModel.UserName;
                    sqlCommand.Parameters.Add("@Password", SqlDbType.VarChar).Value = userRegisterModel.Password;
                    sqlCommand.Parameters.Add("@Email", SqlDbType.VarChar).Value = userRegisterModel.Email;
                    sqlCommand.Parameters.Add("@Mobile", SqlDbType.VarChar).Value = userRegisterModel.Mobile;
                    sqlCommand.Parameters.Add("@IsActive", SqlDbType.VarChar).Value = 1;
                    sqlCommand.Parameters.Add("@IsAdmin", SqlDbType.VarChar).Value = 1;
                    sqlCommand.Parameters.Add("@Created", SqlDbType.DateTime).Value = userRegisterModel.Created;
                    sqlCommand.Parameters.Add("@Modified", SqlDbType.DateTime).Value = userRegisterModel.Modified;
                    sqlCommand.ExecuteNonQuery();
                    return RedirectToAction("Login");
                }
            }
            catch (Exception e)
            {
                TempData["ErrorMessage"] = e.Message;
                return RedirectToAction("Registration");
            }
            return RedirectToAction("Registration");
        }

        public IActionResult UserLogin(UserLoginModel userLoginModel)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    string connectionString = this.configuration.GetConnectionString("ConnectionString");
                    SqlConnection sqlConnection = new SqlConnection(connectionString);
                    sqlConnection.Open();
                    SqlCommand sqlCommand = sqlConnection.CreateCommand();
                    sqlCommand.CommandType = System.Data.CommandType.StoredProcedure;
                    sqlCommand.CommandText = "PR_MST_User_Login";
                    sqlCommand.Parameters.Add("@UserName", SqlDbType.VarChar).Value = userLoginModel.UserName;
                    sqlCommand.Parameters.Add("@Password", SqlDbType.VarChar).Value = userLoginModel.Password;
                    SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
                    DataTable dataTable = new DataTable();
                    dataTable.Load(sqlDataReader);
                    if (dataTable.Rows.Count > 0)
                    {
                        foreach (DataRow dr in dataTable.Rows)
                        {
                            HttpContext.Session.SetString(Constants.USERID_SESSION_KEY, dr["UserID"].ToString());
                            HttpContext.Session.SetString(Constants.USERNAME_SESSION_KEY, dr["UserName"].ToString());
                        }

                        return RedirectToAction("Index", "Home");
                    }
                    else
                    {
                        return RedirectToAction("Login");
                    }
                }
            }
            catch (Exception e)
            {
                TempData["ErrorMessage"] = e.Message;
            }
            return RedirectToAction("Login");
        }

        public IActionResult Logout()
        {
            HttpContext.Session.Clear();
            return RedirectToAction("Login");
        }
    }
}
