#!/bin/bash
# ============================================================
# VLA × 移动机器人 学习环境搭建脚本 (模块 0)
# 适用: WSL2 + Ubuntu 22.04 + NVIDIA GPU
# 用途: 从零复现本学习计划的基础环境
# 用法: bash setup_vla_env.sh   (在 WSL2 内以 root 运行)
# ============================================================

set -e  # 出错即停

echo "========== [1/5] 系统基础 =========="
sudo apt update -y && sudo apt upgrade -y
sudo apt install -y build-essential git curl wget cmake

echo "========== [2/5] miniconda (装到 /root/miniconda3 = WSL磁盘) =========="
if [ ! -x /root/miniconda3/bin/conda ]; then
  cd /tmp
  # 若清华源慢，改用官方源: https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
  curl -L -o miniconda.sh https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
  bash miniconda.sh -b -p /root/miniconda3
  rm -f miniconda.sh
fi
source /root/miniconda3/etc/profile.d/conda.sh
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main
conda config --set show_channel_urls yes

echo "========== [3/5] 主深度学习环境 dl (Python 3.10) =========="
conda create -n dl python=3.10 -y

echo "========== [4/5] PyTorch + CUDA 运行库 =========="
# 注意: 用 pip 装 PyPI 版 torch(766MB) + 补 nvidia CUDA 库，等效 cu124，避开 2.5GB cu124 下载
# 若官方源快可直接: pip install torch==2.6.0 torchvision==0.21.0 --index-url https://download.pytorch.org/whl/cu124
conda activate dl
pip install "torch==2.6.0" "torchvision==0.21.0" -i https://mirrors.aliyun.com/pypi/simple/
# 补 CUDA 运行库 (cudnn/cublas/runtime/nvrtc 为 cu124 组件，等效 +cu124)
pip install nvidia-cudnn-cu12 nvidia-cublas-cu12 nvidia-cuda-runtime-cu12 nvidia-cuda-nvrtc-cu12 \
  -i https://mirrors.aliyun.com/pypi/simple/

echo "========== [5/5] starVLA 核心依赖 =========="
pip install "transformers==4.57.0" "accelerate==1.5.2" qwen-vl-utils einops tensorboard pillow \
  matplotlib scipy omegaconf rich tyro tiktoken timm diffusers

# 固化 conda 激活
echo "source /root/miniconda3/etc/profile.d/conda.sh" >> ~/.bashrc
echo "conda activate dl" >> ~/.bashrc

echo ""
echo "============================================"
echo " 环境搭建完成！验证方式:"
echo "   bash scripts/verify_env.sh      # 健康检查"
echo "   python scripts/gpu_smoke_test.py # GPU 验证"
echo "============================================"
