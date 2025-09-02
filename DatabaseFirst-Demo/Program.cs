using DatabaseFirst_Demo.Contexts;
using Microsoft.EntityFrameworkCore;

namespace DatabaseFirst_Demo
{
    internal class Program
    {
        static void Main(string[] args)
        {
            using MyNorthwindContext dbContext = new MyNorthwindContext();

            #region Running raw SQL queries
            #region Select Statements
            //var res = dbContext.Products.FromSqlRaw($"select * from Products Where ProductID=1");
            //int p = 2;
            // res = dbContext.Products.FromSqlInterpolated($"select * from Products Where ProductID={p}");

            //foreach (var product in res)
            //{
            //    Console.WriteLine(product.ProductName);
            //}
            #endregion
            #region Update Statements
            //dbContext.Database.ExecuteSqlRaw("Update Products Set ProductName='Tea' Where ProductID=1");
            //int id = 1;
            //dbContext.Database.ExecuteSqlInterpolated($"Update Products Set ProductName='Coffe' Where ProductID={id}");

            #endregion
            #endregion


        }
    }
}
