# test

import subprocess
import os

# 获取用户的主目录
home = os.path.expanduser("~")

# 拼接桌面路径
desktop = os.path.join(home, "Desktop")

print("用户桌面路径:", desktop)

with open(f"{desktop}/test.txt", "w") as f:
    f.write("hello world")
    f.close()

# 启动系统计算器
subprocess.run("calc.exe")

