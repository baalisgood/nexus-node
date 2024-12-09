#!/bin/bash

# 创建screen会话nexus
screen -dmS nexus

# 进入screen会话
screen -S nexus -X stuff $'echo "Starting dependencies installation..."\n'

# 更新系统并安装依赖
screen -S nexus -X stuff $'sudo apt update -y\n'
screen -S nexus -X stuff $'sudo apt upgrade -y\n'
screen -S nexus -X stuff $'sudo apt install -y build-essential\n'
screen -S nexus -X stuff $'sudo apt install -y pkg-config\n'
screen -S nexus -X stuff $'sudo apt install -y libssl-dev\n'
screen -S nexus -X stuff $'sudo apt install -y protobuf-compiler\n'

# 设置环境变量
screen -S nexus -X stuff $'export OPENSSL_DIR=/usr/lib/ssl\n'
screen -S nexus -X stuff $'export PKG_CONFIG_PATH=/usr/lib/pkgconfig\n'
screen -S nexus -X stuff $'export OPENSSL_DIR=/usr\n'
screen -S nexus -X stuff $'export OPENSSL_INCLUDE_DIR=/usr/include\n'
screen -S nexus -X stuff $'export OPENSSL_LIB_DIR=/usr/lib\n'

# 执行curl命令，安装Nexus CLI
screen -S nexus -X stuff $'curl https://cli.nexus.xyz/ | sh\n'

# 等待命令执行完成，假设该命令是非阻塞的
sleep 5

# 启动Nexus并传递Prover ID
PROVER_ID=$(cat /home/ubuntu/Prover-ID)
screen -S nexus -X stuff $'echo "Starting Nexus with Prover ID..."\n'
screen -S nexus -X stuff $"nexus start --prover-id $PROVER_ID\n"

echo "脚本已完成。请检查screen会话 'nexus' 中的日志。"
