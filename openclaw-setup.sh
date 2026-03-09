#!/bin/bash

# 1. 定义并导出环境变量
# 使用 export 确保这些变量能被子脚本 (docker-setup.sh) 读取
export OPENCLAW_DIR="/opt/1panel/docker/compose/openclaw"
export OPENCLAW_CONFIG_DIR="/opt/1panel/docker/compose/openclaw/.openclaw"
export OPENCLAW_WORKSPACE_DIR="/opt/1panel/docker/compose/openclaw/.openclaw/workspace"

# 2. 检查当前目录下是否存在 docker-setup.sh
if [ -f "./docker-setup.sh" ]; then
    echo "✅ 环境变量已设置，准备运行 docker-setup.sh..."
    
    # --- 新增：打印当前环境变量以供核对 ---
    echo "------------------------------------------"
    env | grep OPENCLAW_
    echo "------------------------------------------"    
    
    # 3. 运行脚本
    # 建议先给脚本执行权限，然后运行
    chmod +x ./docker-setup.sh
    ./docker-setup.sh

    # 4. 将 OPENCLAW_DIR 追加写入 .env
    echo "OPENCLAW_DIR=${OPENCLAW_DIR}" >> .env
    echo "✅ 已将 OPENCLAW_DIR 追加写入 .env 文件"

else
    echo "❌ 错误：在当前目录 $(pwd) 下找不到 docker-setup.sh"
    exit 1
fi
