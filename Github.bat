@echo off
REM 获取当前日期和时间
for /f "tokens=1-5 delims=.:/ " %%d in ("%date% %time%") do (
    set year=%%d
    set month=%%e
    set day=%%f
    set hour=%%g
    set minute=%%h
)

REM 格式化日期和时间作为提交信息
set commitMessage=%year%-%month%-%day% %hour%:%minute%

REM 添加所有更改
echo Adding changes to the staging area...
git add .

REM 提交所有更改，并使用日期和时间作为提交信息
echo Committing changes with message: %commitMessage%
git commit -a -m "%commitMessage%"

REM 推送更改到远程仓库
echo Pushing changes to the remote repository...
git push origin main

echo GitHub repository updated successfully!
pause
