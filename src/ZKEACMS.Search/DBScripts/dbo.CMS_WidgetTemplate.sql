INSERT INTO dbo.CMS_WidgetTemplate
        ( Title ,
          GroupName ,
          PartialView ,
          AssemblyName ,
          ServiceTypeName ,
          ViewModelTypeName ,
          Thumbnail ,
          [Order]
        )
VALUES  ( N'����' ,
          N'1.ͨ��' , 
          N'Widget.Search' , 
          N'ZKEACMS.Search' , 
          N'ZKEACMS.Search.Service.SearchWidgetService' , 
          N'ZKEACMS.Search.Models.SearchWidget' ,
          N'~/Plugins/ZKEACMS.Search/Content/Image/Widget.Search.png' ,
          12
        )