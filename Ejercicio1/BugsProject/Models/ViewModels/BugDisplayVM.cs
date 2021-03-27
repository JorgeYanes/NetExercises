using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BugsProject.Models.ViewModels
{
    public class BugDisplayVM
    {
        public int Id { get; set; }
        public string Project { get; set; }
        public string User { get; set; }
        public string Description { get; set; }
    }
}