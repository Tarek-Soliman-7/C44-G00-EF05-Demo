using C44_G00_EF05_Demo.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
namespace C44_G00_EF05_Demo.Data
{
    internal class EmpDbContext:DbContext
    {
        protected override void OnConfiguring(DbContextOptionsBuilder Emp)
        {
            Emp.UseSqlServer("Server = .; Database= FT_PT_Emp; Trusted_Connection=true; trustservercertificate=true ");
        }

        protected override void OnModelCreating(ModelBuilder Emp)
        {
            #region TPH
            ////Emp.Entity<FTEmployee>()
            ////    .HasBaseType<Employee>();
            ////Emp.Entity<PTEmployee>()
            ////    .HasBaseType<Employee>();

            //Emp.Entity<Employee>()
            //    .HasDiscriminator<string>("EmployeeType")
            //    .HasValue<FTEmployee>("FTEmp")
            //    .HasValue<PTEmployee>("PTEmp");
            #endregion

            #region TPT
            Emp.Entity<FTEmployee>()
                .ToTable("FTEmployees");
            Emp.Entity<PTEmployee>()
                .ToTable("PTEmployees");

            #endregion
        }

        #region TPC
        //public DbSet<FTEmployee> FTEmployees { get; set; }
        //public DbSet<PTEmployee> PTEmployees { get; set; }
        #endregion

        #region TPH
        //public DbSet<Employee> Employees { get; set; }
        //public DbSet<FTEmployee> FTEmployees { get; set; }
        //public DbSet<PTEmployee> PTEmployees { get; set; }
        #endregion

        #region TPT
        public DbSet<Employee> Employees { get; set; }
        public DbSet<FTEmployee> FTEmployees { get; set; }
        public DbSet<PTEmployee> PTEmployees { get; set; }
        #endregion


    }
}
