//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace BugsProject.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Bug
    {
        public int id { get; set; }
        public Nullable<int> projectId { get; set; }
        public Nullable<int> userId { get; set; }
        public string description { get; set; }
    
        public virtual Project Project { get; set; }
        public virtual User User { get; set; }
    }
}