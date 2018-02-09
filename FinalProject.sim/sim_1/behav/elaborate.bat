@echo off
set xv_path=D:\\Vivado\\Vivado\\2016.4\\bin
call %xv_path%/xelab  -wto 3de734f5f9e64bef8b883fbfb390af39 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -L xpm --snapshot testBench_behav xil_defaultlib.testBench xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
