rem @ECHO OFF
setlocal EnableDelayedExpansion

REM ***********************************************************************************
REM システム日付格納
REM ***********************************************************************************

      SET YYYYMMDD=%date:~0,4%%date:~5,2%%date:~8,2%
      SET year=%date:~0,4%
      SET month=%date:~5,2%
      SET day=%date:~8,2%
      SET /a month=1%month% - 100
      SET /a day=1%day% - 100
      SET  /a day-=1


REM ***********************************************************************************
rem      テスト日付取得
rem      SET YYYYMMDDa=2024/03/01
rem      SET year=%YYYYMMDDa:~0,4%
rem      SET month=%YYYYMMDDa:~5,2%
rem      SET day=%YYYYMMDDa:~8,2%
rem      SET YYYYMMDD=%YYYYMMDDa:~0,4%%YYYYMMDDa:~5,2%%YYYYMMDDa:~8,2%
rem      テスト時間取得
rem      SET    /a hh=4
REM ***********************************************************************************


REM ***********************************************************************************
REM システム時間格納
REM ***********************************************************************************

      SET     hour=%time%
      SET    /a hh=%hour:~0,2%


REM ***********************************************************************************
REM コピー元ディレクトリ,FILE設定    fileに変更予定
REM ***********************************************************************************

      SET tgt01="指定ファイル①"
      SET tgt02="指定ファイル②"

REM ***********************************************************************************
REM ~23:59までに起動した場合
REM 今日日付のフォルダを作成後、tgtを指定フォルダへ格納
REM ***********************************************************************************

if !hh! lss 5 ( 
   	call:yesterday
) else (
   	md "格納先フォルダ"\%YYYYMMDD%
		
	if exist %tgt01% (
		echo %tgt01%	をコピーします。
		copy %tgt01%  "格納先フォルダ"\%YYYYMMDD%
	) else (
		echo %tgt01%	は存在しません。
		)

	if exist %tgt02% (
		echo %tgt02%	をコピーします。
		copy %tgt02%  "格納先フォルダ"\%YYYYMMDD%

	) else (
		echo %tgt02%	は存在しません。
		)
	)

echo 処理終了
exit 

REM ***********************************************************************************
REM 0:00~4:59までに起動した場合、サブルーチン（yesterday）の実行
REM 前日日付のフォルダを作成後、tgtを指定フォルダへ格納
REM ***********************************************************************************

:yesterday
if !day! equ 0 ( set /a month-=1
    if !month! equ 0 ( 
	set /a year-=1, month=12 ,day=31
    	)
)

rem １日に起動する場合は前月の月末日を指定
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


md "格納先フォルダ"\%prev_day%

if exist %tgt01% (
	echo %tgt01%	をコピーします。
	copy %tgt01%  "格納先フォルダ"\%YYYYMMDD%\%prev_day%

) else (
	echo %tgt01%	は存在しません。
	)

if exist %tgt02% (
	echo %tgt02%	をコピーします。
	copy %tgt02%  "格納先フォルダ"\%YYYYMMDD%\%prev_day%

) else (
	echo %tgt02%	は存在しません。
	)


echo 処理終了
rem exit /b 
pause
exit  


REM ***********************************************************************************
REM 閏年（2月29日）を取得
REM ***********************************************************************************

:Leap
rem 年が400で割り切れると閏年
set /a rest = %1 %% 400
if !rest!==0 exit /b 0

rem 年が100で割り切れると閏年ではない
set /a rest = %1 %% 100
if !rest!==0 exit /b 1

rem 年が4で割りきれると閏年
set /a rest = %1 %% 4
if !rest!==0 exit /b 0

exit /b 1

REM ***********************************************************************************

endlocal



