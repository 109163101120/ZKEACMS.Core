/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using Easy.Mvc.Attribute;
using Easy.Mvc.Authorize;
using Easy.Mvc.Controllers;
using Easy.ViewPort.jsTree;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Linq;
using ZKEACMS.Common.Models;
using ZKEACMS.Common.Service;

namespace ZKEACMS.Controllers
{
    [DefaultAuthorize]
    public class NavigationController : BasicController<NavigationEntity, string, INavigationService>
    {
        public NavigationController(INavigationService service)
            : base(service)
        {

        }
        [NonAction]
        public override ActionResult Create()
        {
            return base.Create();
        }

        public ActionResult Create(string ParentID)
        {
            var navication = new NavigationEntity
            {
                ParentId = ParentID,
                DisplayOrder = Service.Count(m => m.ParentId == ParentID) + 1
            };
            return View(navication);
        }
        public JsonResult GetNavTree()
        {
            var navs = Service.GetAll().OrderBy(m => m.DisplayOrder);
            var node = new Tree<NavigationEntity>().Source(navs).ToNode(m => m.ID, m => m.Title, m => m.ParentId, "#");
            return Json(node);
        }

        [HttpPost]
        public JsonResult MoveNav(string id, string parentId, int position, int oldPosition)
        {
            Service.Move(id, parentId, position, oldPosition);
            return Json(true);
        }
    }
}
