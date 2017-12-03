/* 
 * http://www.zkea.net/ 
 * Copyright 2017 ZKEASOFT 
 * http://www.zkea.net/licenses 
 */

using Easy.Mvc.Resource;
using Easy.Mvc.Route;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using ZKEACMS.Message.Service;

namespace ZKEACMS.Message
{
    public class MessagePlug : PluginBase
    {
        public override IEnumerable<RouteDescriptor> RegistRoute()
        {
            yield return new RouteDescriptor()
            {
                RouteName = "MessagePlug",
                Template = "Message-Handle/{action}",
                Defaults = new { controller = "MessageHandle" },
                Priority = 11
            };
        }

        public override IEnumerable<AdminMenu> AdminMenu()
        {
            yield return new AdminMenu
            {
                Title = "��������",
                Icon = "glyphicon-volume-up",
                Order = 7,
                Children = new List<AdminMenu>
                {
                    new AdminMenu
                    {
                        Title = "����",
                        Url = "~/Admin/Message",
                        Order = 1,
                        Icon = "glyphicon-volume-up",
                        PermissionKey = PermissionKeys.ViewMessage
                    },
                    new AdminMenu
                    {
                        Title = "����",
                        Url = "~/Admin/Comments",
                        Order = 2,
                        Icon = "glyphicon-comment",
                        PermissionKey = PermissionKeys.ViewComments
                    }
                }
            };
        }



        public override IEnumerable<PermissionDescriptor> RegistPermission()
        {
            yield return new PermissionDescriptor(PermissionKeys.ViewMessage, "��������", "�鿴����", "");
            yield return new PermissionDescriptor(PermissionKeys.ManageMessage, "��������", "��������", "");
            yield return new PermissionDescriptor(PermissionKeys.ViewComments, "��������", "�鿴����", "");
            yield return new PermissionDescriptor(PermissionKeys.ManageComments, "��������", "��������", "");
        }

        public override IEnumerable<Type> WidgetServiceTypes()
        {
            yield return typeof(MessageBoxWidgetService);
            yield return typeof(MessageWidgetService);
            yield return typeof(CommentsWidgetService);
        }

        public override void ConfigureServices(IServiceCollection serviceCollection)
        {
            serviceCollection.AddTransient<IMessageService, MessageService>();
            serviceCollection.AddDbContext<MessageDbContext>();
            serviceCollection.AddTransient<ICommentsService, CommentsService>();
        }

        protected override void InitScript(Func<string, ResourceHelper> script)
        {
            script("comments").Include("~/Plugins/ZKEACMS.Message/Scripts/comments.js", "~/Plugins/ZKEACMS.Message/Scripts/comments.min.js");
        }

        protected override void InitStyle(Func<string, ResourceHelper> style)
        {
            style("comments").Include("~/Plugins/ZKEACMS.Message/Content/comments.css", "~/Plugins/ZKEACMS.Message/Content/comments.min.css");
        }
    }
}