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
GO
INSERT INTO dbo.ApplicationSetting( SettingKey ,Value ,Description ,Status)
SELECT N'SMTP-Host',N'',N'�ʼ������ַ���� smtp.qq.com',1 UNION ALL
SELECT N'SMTP-Port',N'25',N'�ʼ��������˿ں�',1 UNION ALL
SELECT N'SMTP-Email',N'',N'���ڷ����ʼ�������',1 UNION ALL
SELECT N'SMTP-PassWord',N'',N'���ڷ����ʼ�����������',1 UNION ALL
SELECT N'SMTP-UseSSL',N'false',N'�Ƿ�����SSL',1

GO

ALTER TABLE dbo.Users ADD [ResetToken] NVARCHAR(50) NULL
ALTER TABLE dbo.Users ADD [ResetTokenDate] DATETIME NULL