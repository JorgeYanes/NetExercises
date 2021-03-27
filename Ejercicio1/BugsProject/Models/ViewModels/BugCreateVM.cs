using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace BugsProject.Models.ViewModels
{
    public class BugCreateVM
    {
   
        [Required]
        public int UserId { get; set; }
        [Required]
        public int ProjectId { get; set; }
        [Required]
        public string Description { get; set; }
        
    }
}