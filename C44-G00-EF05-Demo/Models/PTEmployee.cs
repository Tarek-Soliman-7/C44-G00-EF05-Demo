using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace C44_G00_EF05_Demo.Models
{
    internal class PTEmployee : Employee
    {
        public decimal HourRate {  get; set; }
        public int CountOfHours { get; set; }
    }
}
