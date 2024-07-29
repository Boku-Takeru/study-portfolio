@echo off

rem ********************************************
rem *  フォルダからファイル名を取得し  
rem *  テキストファイルに吐き出すBAT        
rem ********************************************

setlocal

pause

rem ********************************************
rem *                                          *
rem *  フォルダ①からファイルを取得します      *
rem *        (対象：xlsx / pdf / docx )        *
rem *                                          *
rem ********************************************

set target=フォルダ①
set trigger=フォルダ②

echo.フォルダ① >>TEST.txt

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
rem *  フォルダ②からファイルを取得します      *
rem *        (対象：xlsx / pdf / docx )        *
rem *                                          *
rem ********************************************

echo.フォルダ② >>TEST.txt

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
rem                 現在の日付と時刻を取得
rem         日付と時刻を新しいファイルに出力します
rem *******************************************************

rem 出力結果
rem hogehogehoge_YYYYMMDD-hhmm

set "time=%time:~0,2%%time:~3,2%%"
set "today=%date:~0,4%%date:~5,2%%date:~8,2%"

rem 新しいファイル名を作成
set "new_filename=hogehogehoge_%today%-%time%.txt"

rem テキストの内容を新しいファイルにコピー
copy TEST.txt %new_filename%

rem 既存のTEST.txtを削除
del TEST.txt

exit


endlocal