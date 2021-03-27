using BugsProject.Models;
using BugsProject.Models.ViewModels;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BugsProject.Controllers
{
    public class BugController : Controller
    {

     
        // GET: Bug
        public ActionResult Index(int? projectId, int? userId, int? page)
        {
            List<BugDisplayVM> bugs;
            using (BugsProjectEntities db = new BugsProjectEntities())
            {
                ViewBag.ListProject = new SelectList(db.Project.ToList(), "id", "name");
                ViewBag.ListUser = new SelectList(db.User.ToList(), "id", "name");
                var Allbugs = db.Bug.AsEnumerable();
                if (projectId != null)
                {
                    Allbugs = Allbugs.Where(b => b.projectId == projectId);
                }
                if (userId != null)
                {
                    Allbugs = Allbugs.Where(b => b.userId == userId);
                }

                bugs = (Allbugs.Select(b => new BugDisplayVM()
                {
                    Id = b.id,
                    Project = db.Project.FirstOrDefault(p => p.id == b.projectId).name,
                    User = db.User.FirstOrDefault(u => u.id == b.userId).name,
                    Description = b.description
                })).ToList();

            }
            return View(bugs.ToPagedList((page ?? 1), 10));
        }

        public ActionResult Create()
        {
            using (BugsProjectEntities db = new BugsProjectEntities())
            {
                ViewBag.ListProject = new SelectList(db.Project.ToList(), "id", "name");
                ViewBag.ListUser = new SelectList(db.User.ToList(), "id", "name");
            }
            return View();
        }

        [HttpPost]
        public ActionResult Create(BugCreateVM newBug)
        {
            try
            {
                if(ModelState.IsValid)
                {                       
                    using (BugsProjectEntities db = new BugsProjectEntities())
                    {
                        var bug = new Bug()
                        {
                            description = newBug.Description,
                            projectId = newBug.ProjectId,
                            userId = newBug.UserId
                        };
                        db.Bug.Add(bug);
                        db.SaveChanges();
                    }
                    return Redirect("/");
                }
                return View(newBug);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
    }
}