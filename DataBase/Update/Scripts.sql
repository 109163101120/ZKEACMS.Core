UPDATE dbo.DataDictionary SET Title=N'��̨����Ա' WHERE ID=11


INSERT INTO dbo.DataDictionary
        ( DicName ,
          Title ,
          DicValue ,
          [Order] ,
          Pid ,
          IsSystem 
        )
VALUES  ( N'UserEntity@UserTypeCD' , -- DicName - nvarchar(255)
          N'ǰ���û�' , -- Title - nvarchar(255)
          N'2' , -- DicValue - nvarchar(255)
          2 , -- Order - int
          0 , -- Pid - int
          1 
        )