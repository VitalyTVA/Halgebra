rem @cd /d c:\GitHub\Real\
rem @del dist\build\Real\Real.exe 
	
@call cabal build
@IF ERRORLEVEL 1 GOTO exit

@echo --------------BUILD SUCCESSFUL--------------------
@call dist\build\Halgebra\Halgebra.exe
@pause
exit

:exit
@echo --------------BUILD FAILED--------------------
@pause
