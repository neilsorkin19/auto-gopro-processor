@echo off
REM default drive letter is w
set drive=w
set folder_suffix=:\DCIM\100GOPRO\
REM loop through potential drive letters that could contain the GoPro card
for %%a in ( C D E F G H I J K L ) do (
    if exist %%a%folder_suffix% (set drive=%%a)
)

if %drive% NEQ w (goto :continue)
echo Make sure that the GoPro or SD card is plugged in.
pause
exit

:continue
set src_path=%drive%%folder_suffix%
echo GoPro videos are in %src_path%

set /P title="Name of output video file: "

REM generate file list containing all videos
(for %%i in (%src_path%*.mp4) do @echo file '%%i') > videolist.txt
REM concatenate the videos from the GoPro or SD card
ffmpeg -f concat -safe 0 -i videolist.txt -c copy raw_concat.mp4
REM reduce the quality to make a smaller file size
ffmpeg -i raw_concat.mp4 -c:v h264_nvenc -preset fast -crf 18 -c:a copy %title%.mp4

echo Deleting temporary files...
REM cleanup
REM delete text file
del videolist.txt
REM delete original quality file
del raw_concat.mp4

echo Complete.
pause