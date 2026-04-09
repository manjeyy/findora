@echo off
javac -cp "C:\Program Files\apache-tomcat-11.0.21\lib\servlet-api.jar" -d WEB-INF/classes src/Main.java
echo Build complete.
pause