@echo off
@echo -----------------------------------------------------------------------------
@echo *** ��ӭʹ�� ZKEACMS ***
@echo -----------------------------------------------------------------------------
@echo �ù��߽��������������� ZKEACMS ����
@echo �ڿ�ʼ֮ǰ�����Ȳ鿴���ǵ����Э��
@echo http://www.zkea.net/licenses
@echo -----------------------------------------------------------------------------
@echo �й���.Net CoreӦ�ó���İ�װ������鿴 Microsoft Docs
@echo .NET Core Ӧ�ó�����
@echo https://docs.microsoft.com/zh-cn/dotnet/articles/core/deploying
@echo -----------------------------------------------------------------------------
@echo ע�⣺����ʱ����շ���Ŀ¼
set /P i=�Ƿ��������ʱ����?(y/n)
if not "%i%"=="y" goto start
@echo ------------------------- ��ϸ������ʱRID����� -------------------------
@echo https://docs.microsoft.com/en-us/dotnet/core/rid-catalog
@echo -------------------------  ��������ʱ RID  -------------------------
@echo win7-x64,win10-x64,ubuntu.16.04-x64,centos.7-x64,osx.10.12-x64
set /P r=��������ʱ RID:
:start
dotnet restore
cd src/ZKEACMS.WebHost
if not "%i%"=="y" (
    dotnet publish-zkeacms
)
if "%i%"=="y" (
    dotnet publish-zkeacms %r%
)

set current_path=%cd%
explorer %current_path%\bin\Release\PublishOutput