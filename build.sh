#!/bin/bash

# 程序中有任何异常时返回非零异常错误
set -e

export PATH=/usr/local/n/versions/node/6.2.1/bin:$PATH
#export PATH=/usr/local/n/versions/node/7.10.0/bin:$PATH
#export PATH=/usr/local/n/versions/node/8.9.1/bin:$PATH

help()
{
  echo "\nUsage: build.sh <type>"
  echo "Packing前端工程的编译命令"
  echo "type参数:"
  echo "  dev\t开发环境"
  echo "  beta\t测试环境"
  echo "  prod\t线上环境"
}

if [ ! -n "$1" ]; then
  echo "[build.sh][Error]缺少参数type"
  help
elif [[ "dev" != "$1" && "beta" != "$1" && "prod" != "$1" ]]; then
  echo "[build.sh][Error]参数type错误"
  help
else
  echo type: $1

  # 选择 node 编译类型时，jenkins 会自动安装依赖
  # 为了确保依赖包成功安装，此处再检查一下 packing 依赖包是否安装
  if [ ! -d node_modules/packing ]; then
    t1=$(date +%s)
    npm install --production --registry https://registry.npm.taobao.org
    t2=$(date +%s)
    t=$((t2 - t1))
    echo "npm install 耗时 $t 秒"
  fi

  # 开始编译工程
  t1=$(date +%s)
  npm run build:$1
  t2=$(date +%s)
  t=$((t2 - t1))
  echo "npm build:$1 耗时 $t 秒"

  # 调整编译产物的目录结构
  mv prd/templates .

fi
