@echo off
REM 获取当前日期和时间
for /f "tokens=1-4 delims=/- " %%a in ("%date%") do (
    set year=%%a
    set month=%%b
    set day=%%c
)

for /f "tokens=1-2 delims=: " %%a in ("%time%") do (
    set hour=%%a
    set minute=%%b
)

REM 确保小时和分钟是两位数格式
if %hour% LSS 10 (set hour=0%hour%)
if %minute% LSS 10 (set minute=0%minute%)

REM 获取当前星期几
for /f "tokens=1" %%i in ('powershell -command "(Get-Date).DayOfWeek"') do set dayOfWeek=%%i

REM 格式化日期和时间作为提交信息
set commitMessage=%year%-%month%-%day% %dayOfWeek% %hour%:%minute%

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
