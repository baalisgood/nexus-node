#!/bin/bash
# 设置颜色变量
GREEN="\033[32m"
RED="\033[31m"
RESET="\033[0m"

# 检查是否为 Ubuntu 系统
if ! grep -q "Ubuntu" /etc/os-release; then
    echo -e "${RED}错误：此脚本仅支持 Ubuntu 系统${RESET}"
    exit 1
fi

# ... (其余代码保持不变) ... 