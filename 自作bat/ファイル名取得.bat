@echo off

rem ********************************************
rem *  �t�H���_����t�@�C�������擾��  
rem *  �e�L�X�g�t�@�C���ɓf���o��BAT        
rem ********************************************

setlocal

pause

rem ********************************************
rem *                                          *
rem *  �t�H���_�@����t�@�C�����擾���܂�      *
rem *        (�ΏہFxlsx / pdf / docx )        *
rem *                                          *
rem ********************************************

set target=�t�H���_�@
set trigger=�t�H���_�A

echo.�t�H���_�@ >>TEST.txt

for %%f in (%target%*.xlsx) do (
    echo %%~xtznf >> TEST.txt
    )

for %%f in (%target%*.pdf) do (
    echo %%~xtznf >> TEST.txt
    )

for %%f in (%target%*.docx) do (
    echo %%~xtznf >> TEST.txt
    )

echo. >>TEST.txt

rem ********************************************
rem *                                          *
rem *  �t�H���_�A����t�@�C�����擾���܂�      *
rem *        (�ΏہFxlsx / pdf / docx )        *
rem *                                          *
rem ********************************************

echo.�t�H���_�A >>TEST.txt

for %%f in (%trigger%*.xlsx) do (
    echo %%~xtznf >> TEST.txt
    )

for %%f in (%trigger%*.pdf) do (
    echo %%~xtznf >> TEST.txt
    )

for %%f in (%trigger%*.docx) do (
    echo %%~xtznf >> TEST.txt
    )


rem *******************************************************
rem                 ���݂̓��t�Ǝ������擾
rem         ���t�Ǝ�����V�����t�@�C���ɏo�͂��܂�
rem *******************************************************

rem �o�͌���
rem hogehogehoge_YYYYMMDD-hhmm

set "time=%time:~0,2%%time:~3,2%%"
set "today=%date:~0,4%%date:~5,2%%date:~8,2%"

rem �V�����t�@�C�������쐬
set "new_filename=hogehogehoge_%today%-%time%.txt"

rem �e�L�X�g�̓��e��V�����t�@�C���ɃR�s�[
copy TEST.txt %new_filename%

rem ������TEST.txt���폜
del TEST.txt

exit


endlocal