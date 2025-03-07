using CrudOperationEntityFrameWork.Services;

var builder = WebApplication.CreateBuilder(args);

//Login 
builder.Services.AddDistributedMemoryCache();

builder.Services.AddSession();

// Access session in service classes...
builder.Services.AddHttpContextAccessor();

// Add service to access to controller
builder.Services.AddScoped<SessionService>();

// Add services to the container.
builder.Services.AddControllersWithViews();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}


// Enable session middleware
app.UseSession();

app.UseHttpsRedirection();
app.UseStaticFiles();

// enables the authentication middleware in ASP.NET Core to handle user authentication for securing endpoints.?
app.UseAuthentication();

app.UseRouting();

app.UseAuthorization();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=User}/{action=Login}/{id?}");

app.Run();
