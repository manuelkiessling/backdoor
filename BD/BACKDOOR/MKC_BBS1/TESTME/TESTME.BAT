@ECHO OFF
CLS

IF "%1"=="/fast" GOTO DirektStart
IF "%1"=="/FAST" GOTO DirektStart

VIEWER MKCTITLE.PCX
CLS

ECHO.
ECHO MKC 1994
ECHO Programm wird gestartet...
ECHO (TESTme V1.0dQ)
ECHO.
ECHO DAT-Dateiliste:
ECHO.
DIR /On /B *.DAT
ECHO.
ECHO.
PAUSE

:DirektStart
QBASIC /RUN TESTME.BAS