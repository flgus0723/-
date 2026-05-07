@echo off
chcp 65001 >nul
cd /d "%~dp0"

echo ============================
echo   둔산점 저장 + 배포 중...
echo ============================

git add .

:: 변경된 파일이 있을 때만 커밋
git diff --cached --quiet
if %errorlevel% == 0 (
    echo 변경된 내용이 없습니다.
    goto done
)

:: 현재 날짜/시간으로 커밋 메시지
for /f "tokens=1-3 delims=/" %%a in ("%date%") do set TODAY=%%c-%%b-%%a
for /f "tokens=1-2 delims=:" %%a in ("%time%") do set NOW=%%a:%%b
set NOW=%NOW: =0%

git commit -m "업데이트 %TODAY% %NOW%"
git push

:done
echo.
echo ✅ 완료! 사이트: https://flgus0723.github.io/-/
timeout /t 3 >nul
