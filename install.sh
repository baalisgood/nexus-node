#!/bin/bash
# 设置颜色变量
GREEN="\033[32m"
RED="\033[31m"
RESET="\033[0m"

echo -e "${GREEN}开始安装 Nexus 验证器...${RESET}"

# 检查是否为 Ubuntu 系统
if ! grep -q "Ubuntu" /etc/os-release; then
    echo -e "${RED}错误：此脚本仅支持 Ubuntu 系统${RESET}"
    exit 1
fi

# 安装基本依赖
echo -e "${GREEN}正在安装 git...${RESET}"
sudo apt update
sudo apt install -y git

# 克隆仓库
echo -e "${GREEN}正在克隆项目...${RESET}"
git clone https://github.com/wt195799611/nexus-node.git
cd nexus-node

# 运行主脚本
bash node.sh 