@echo off

echo: ================================================================
rem curl http://localhost:8080/api/user/1
echo:
echo: ================================================================
rem curl -X DELETE http://localhost:8080/api/user/65
echo:
echo: ================================================================
rem curl -X POST http://localhost:8080/api/user -d "{\"name\":\"Curl1\", \"surname\":\"CurlCurl22\"}" -H "Content-Type: application/json"
echo:
echo: ================================================================
curl http://localhost:8080/api/user
echo: 
echo: ================================================================

pause