@echo off
echo Starting Kuaishou Report System Dev Server...
echo Make sure you have Node.js and Wrangler installed.
echo.
start http://127.0.0.1:8787
npx wrangler dev worker.js
pause
