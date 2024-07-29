rem @ECHO OFF
setlocal EnableDelayedExpansion

REM ***********************************************************************************
REM �V�X�e�����t�i�[
REM ***********************************************************************************

      SET YYYYMMDD=%date:~0,4%%date:~5,2%%date:~8,2%
      SET year=%date:~0,4%
      SET month=%date:~5,2%
      SET day=%date:~8,2%
      SET /a month=1%month% - 100
      SET /a day=1%day% - 100
      SET  /a day-=1


REM ***********************************************************************************
rem      �e�X�g���t�擾
rem      SET YYYYMMDDa=2024/03/01
rem      SET year=%YYYYMMDDa:~0,4%
rem      SET month=%YYYYMMDDa:~5,2%
rem      SET day=%YYYYMMDDa:~8,2%
rem      SET YYYYMMDD=%YYYYMMDDa:~0,4%%YYYYMMDDa:~5,2%%YYYYMMDDa:~8,2%
rem      �e�X�g���Ԏ擾
rem      SET    /a hh=4
REM ***********************************************************************************


REM ***********************************************************************************
REM �V�X�e�����Ԋi�[
REM ***********************************************************************************

      SET     hour=%time%
      SET    /a hh=%hour:~0,2%


REM ***********************************************************************************
REM �R�s�[���f�B���N�g��,FILE�ݒ�    file�ɕύX�\��
REM ***********************************************************************************

      SET tgt01="�w��t�@�C���@"
      SET tgt02="�w��t�@�C���A"

REM ***********************************************************************************
REM ~23:59�܂łɋN�������ꍇ
REM �������t�̃t�H���_���쐬��Atgt���w��t�H���_�֊i�[
REM ***********************************************************************************

if !hh! lss 5 ( 
   	call:yesterday
) else (
   	md "�i�[��t�H���_"\%YYYYMMDD%
		
	if exist %tgt01% (
		echo %tgt01%	���R�s�[���܂��B
		copy %tgt01%  "�i�[��t�H���_"\%YYYYMMDD%
	) else (
		echo %tgt01%	�͑��݂��܂���B
		)

	if exist %tgt02% (
		echo %tgt02%	���R�s�[���܂��B
		copy %tgt02%  "�i�[��t�H���_"\%YYYYMMDD%

	) else (
		echo %tgt02%	�͑��݂��܂���B
		)
	)

echo �����I��
exit 

REM ***********************************************************************************
REM 0:00~4:59�܂łɋN�������ꍇ�A�T�u���[�`���iyesterday�j�̎��s
REM �O�����t�̃t�H���_���쐬��Atgt���w��t�H���_�֊i�[
REM ***********************************************************************************

:yesterday
if !day! equ 0 ( set /a month-=1
    if !month! equ 0 ( 
	set /a year-=1, month=12 ,day=31
    	)
)

rem �P���ɋN������ꍇ�͑O���̌��������w��
if !day!== 0 if !month!==1 set day=31
if !day!== 0 if !month!==3 set day=31
if !day!== 0 if !month!==4 set day=30
if !day!== 0 if !month!==5 set day=31
if !day!== 0 if !month!==6 set day=30
if !day!== 0 if !month!==7 set day=31
if !day!== 0 if !month!==8 set day=31
if !day!== 0 if !month!==9 set day=30
if !day!== 0 if !month!==10 set day=31
if !day!== 0 if !month!==11 set day=30
if !day!==0 if !month!==2 (
    call :Leap %year%	
    if errorlevel 1 (
        set day=28
    ) else (
        set day=29
    )
)


if !month! lss 10 (
    set month2=0%month%
)	else (
	set month2=%month%
	) 

	

if !day! lss 10 (
    set day2=0%day%
)	else (
	set day2=%day%
	)


set prev_day=%year%%month2%%day2%


md "�i�[��t�H���_"\%prev_day%

if exist %tgt01% (
	echo %tgt01%	���R�s�[���܂��B
	copy %tgt01%  "�i�[��t�H���_"\%YYYYMMDD%\%prev_day%

) else (
	echo %tgt01%	�͑��݂��܂���B
	)

if exist %tgt02% (
	echo %tgt02%	���R�s�[���܂��B
	copy %tgt02%  "�i�[��t�H���_"\%YYYYMMDD%\%prev_day%

) else (
	echo %tgt02%	�͑��݂��܂���B
	)


echo �����I��
rem exit /b 
pause
exit  


REM ***********************************************************************************
REM �[�N�i2��29���j���擾
REM ***********************************************************************************

:Leap
rem �N��400�Ŋ���؂��Ɖ[�N
set /a rest = %1 %% 400
if !rest!==0 exit /b 0

rem �N��100�Ŋ���؂��Ɖ[�N�ł͂Ȃ�
set /a rest = %1 %% 100
if !rest!==0 exit /b 1

rem �N��4�Ŋ��肫���Ɖ[�N
set /a rest = %1 %% 4
if !rest!==0 exit /b 0

exit /b 1

REM ***********************************************************************************

endlocal



