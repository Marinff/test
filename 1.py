# test
import os

# 获取用户的主目录
home = os.path.expanduser("~")

# 拼接桌面路径
desktop = os.path.join(home, "Desktop")

print("用户桌面路径:", desktop)

import subprocess

# 启动系统计算器
subprocess.run("calc.exe")

