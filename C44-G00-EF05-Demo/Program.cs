using C44_G00_EF05_Demo.Data;
using C44_G00_EF05_Demo.Models;

namespace C44_G00_EF05_Demo
{
    internal class Program
    {
        static void Main(string[] args)
        {
            //using EmpDbContext dbContext = new EmpDbContext();
            //FTEmployee ftEmployee = new FTEmployee()
            //{
            //    Name = "Tarek",
            //    Age = 21,
            //    Address = "Qena",
            //    Salary = 3000,
            //    StartDate = DateTime.Now
            //};
            //PTEmployee ptEmployee = new PTEmployee()
            //{
            //    Name = "Abdo",
            //    Age = 20,
            //    Address = "Aswan",
            //    HourRate = 125,
            //    CountOfHours = 20,
            //};

            #region Add (Creation)
            //dbContext.FTEmployees.Add(ftEmployee);
            //dbContext.PTEmployees.Add(ptEmployee);
            //dbContext.SaveChanges();
            //------------------------------------------
            //dbContext.Employees.Add(ftEmployee);
            //dbContext.Add(ptEmployee);
            //dbContext.SaveChanges();

            //------------------------------------------
            //dbContext.Employees.Add(ftEmployee);
            //dbContext.Add(ptEmployee);
            //dbContext.SaveChanges();
            #endregion

            #region TPC
            //var FTEmp = (from FT in dbContext.FTEmployees
            //             where FT.Id == 1
            //             select FT).FirstOrDefault();
            //Console.WriteLine(FTEmp?.Name + $" Is Salary {FTEmp?.Salary} " ?? "Not Exsist");

            //var PTEmp = (from PT in dbContext.PTEmployees
            //             where PT.Id == 1
            //             select PT).FirstOrDefault();
            //Console.WriteLine(PTEmp?.Name + $" Is HourRate {PTEmp?.HourRate} " ?? "Not Exsist"); 
            #endregion

            #region TPH
            //var Emps=(from E in dbContext.Employees
            //          select E);
            //if(Emps is not null)
            //{
            //    foreach(var E in Emps.OfType<FTEmployee>())
            //    {
            //        Console.WriteLine($"Name: {E.Name}, Age: {E.Age}, Salary: {E.Salary}.");
            //    }

            //    foreach (var E in Emps.OfType<PTEmployee>())
            //    {
            //        Console.WriteLine($"Name: {E.Name}, Age: {E.Age}, HourRate: {E.HourRate}.");
            //    }

            //}
            #endregion
        }
    }
}
