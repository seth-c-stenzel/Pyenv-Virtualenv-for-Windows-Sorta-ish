IF [%1]==[] GOTO help

FOR /F "DELIMS=" %%G IN ('pyenv shell') DO SET shellcurrent=%%G
IF [%1] == [-d] (
    ECHO Error: -d not expected here!
    ECHO.
    ECHO Usage: pyenv virtualenv 3.10-new-project -d
    ECHO Usage: pyenv virtualenv 2.7.18 legacy-app-i-hate -d
    GOTO:eof
)
IF NOT [%2] == [] (
    IF [%2] == [-d] GOTO fromEnv
    GOTO fromProvided
) ELSE (
    GOTO fromEnv
)
goto:eof

:fromEnv
    cmd /c python -m pip install virtualenv --quiet --disable-pip-version-check

    FOR /F "DELIMS=" %%G IN ('pyenv which python') DO SET envpythonpath=%%G
    FOR %%G in ("%envpythonpath%") DO SET envpythonfolder=%%~dpG
    FOR /F %%G IN ('where %envpythonfolder%:python*.dll') DO SET envpythondllfile=%%G
    FOR %%G IN ("%envpythondllfile%") DO SET envpythondllname=%%~nxG
    SET envpythonversion=%envpythondllname:~6,1%

    REM ECHO DETECTED PYTHON VERSION %envpythonversion%
    IF [%2] == [-d] (
        SET envdirectory=%cd%\
    ) else (
        set envdirectory=%PYENV_VERSIONS%
    )
    IF "%envpythonversion%" == "2" (
        cmd /c python -m virtualenv "%envdirectory%%1" -q	 
    ) ELSE (
        cmd /c python -m venv "%envdirectory%%1"
    )
    GOTO cleanUp

:fromProvided
    IF EXIST "%~dp0..\versions\%1" (
        set "PYENV_VERSION=%1"
    ) else (
        echo pyenv specific python version %1 was not found.
        echo Try install python %1 by typing: pyenv install %1
        EXIT /B
    )
    
    FOR /F "DELIMS=" %%G IN ('pyenv which python') DO SET envpythonpath=%%G
    FOR %%G in ("%envpythonpath%") DO SET envpythonfolder=%%~dpG
    FOR /F %%G IN ('where %envpythonfolder%:python*.dll') DO SET envpythondllfile=%%G
    FOR %%G IN ("%envpythondllfile%") DO SET envpythondllname=%%~nxG
    SET envpythonversion=%envpythondllname:~6,1%

    cmd /c python -m pip install virtualenv --quiet --disable-pip-version-check
    REM ECHO DETECTED PYTHON VERSION %envpythonversion%
    IF [%3] == [-d] (
        SET envdirectory=%cd%\
    ) else (
        SET envdirectory=%PYENV_VERSIONS%
    )
    IF "%envpythonversion%" == "2" (
        cmd /c python -m virtualenv "%envdirectory%%2" -q	
    ) ELSE (
        cmd /c python -m venv "%envdirectory%%2"
    )
    GOTO cleanUp

:help
SETLOCAL ENABLEDELAYEDEXPANSION
ECHO.
ECHO Usage for pyenv virtualenv:
SET "echoTempText=   virtualenv <env_name>                Creates env from current env in pyenv versions directory"
ECHO !echoTempText!

SET "echoTempText=   virtualenv <env_name> -d             Creates env from current env in current working directory"
ECHO !echoTempText!

SET "echoTempText=   virtualenv <pyenv_version> <env>     Creates env from specified version in pyenv versions directory"
ECHO !echoTempText!

SET "echoTempText=   virtualenv <pyenv_version> <env> -d  Creates env from specified version in current working directory"
ECHO !echoTempText!
ECHO.
GOTO end

:cleanUp
REM ECHO CLEANUP
IF NOT "%shellcurrent%" == "no shell-specific version configured" (
    cmd /c pyenv shell %shellcurrent%
) else (
    SET "PYENV_VERSION="
    cmd /c pyenv shell --unset
)
pyenv rehash
GOTO end

:end