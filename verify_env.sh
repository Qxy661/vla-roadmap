#!/bin/bash
# vla-workspace 环境健康检查脚本
# 用法: bash scripts/verify_env.sh
# 检查: 系统/GPU/Python/conda环境/torch/ROS2

PASS=0; FAIL=0
ok()   { echo "  [OK] $1"; PASS=$((PASS+1)); }
fail() { echo "  [XX] $1"; FAIL=$((FAIL+1)); }

echo "========== 环境健康检查 =========="

echo "[1/6] 系统"
if command -v lsb_release >/dev/null 2>&1; then
  ok "Ubuntu: $(lsb_release -ds 2>/dev/null)"
else
  ok "Ubuntu: $(grep PRETTY /etc/os-release | cut -d= -f2 | tr -d '"')"
fi

echo "[2/6] GPU"
if nvidia-smi >/dev/null 2>&1; then
  gpu=$(nvidia-smi --query-gpu=name,memory.total --format=csv,noheader 2>/dev/null)
  ok "GPU: $gpu"
else
  fail "GPU 不可用"
fi

echo "[3/6] conda"
if command -v conda >/dev/null 2>&1; then
  ok "conda: $(conda --version 2>/dev/null | awk '{print $2}')"
else
  source /root/miniconda3/etc/profile.d/conda.sh 2>/dev/null
  if conda --version >/dev/null 2>&1; then
    ok "conda (miniconda3): $(conda --version 2>/dev/null | awk '{print $2}')"
  else
    fail "conda"
  fi
fi

echo "[4/6] torch + CUDA (dl 环境)"
source /root/miniconda3/etc/profile.d/conda.sh 2>/dev/null
conda activate dl 2>/dev/null
if python3 -c "import torch" 2>/dev/null; then
  ver=$(python3 -c "import torch; print(torch.__version__)")
  if python3 -c "import torch; assert torch.cuda.is_available()" 2>/dev/null; then
    dev=$(python3 -c "import torch; print(torch.cuda.get_device_name(0))")
    ok "torch: $ver, CUDA 可用 ($dev)"
  else
    fail "torch: $ver, 但 CUDA 不可用"
  fi
else
  fail "dl 环境无 torch"
fi

echo "[5/6] ROS2"
if [ -d /opt/ros/humble ]; then
  source /opt/ros/humble/setup.bash 2>/dev/null
  rv=$(ros2 --help >/dev/null 2>&1 && echo "可用")
  [ -n "$rv" ] && ok "ROS2 命令可用" || fail "ROS2 环境变量"
  [ -x /opt/ros/humble/bin/rviz2 ] && ok "rviz2" || fail "rviz2"
  command -v gzserver >/dev/null && ok "gazebo (gzserver)" || fail "gazebo"
else
  fail "ROS2 humble 未安装"
fi

echo "[6/6] 项目目录"
[ -d /root/projects/starVLA ] && ok "starVLA 已克隆" || fail "starVLA 未克隆"
[ -d /root/projects/vla-workspace ] && ok "vla-workspace" || fail "vla-workspace"

echo ""
echo "========== 结果: $PASS 通过 / $FAIL 失败 =========="
if [ $FAIL -eq 0 ]; then
  echo "环境健康 ✅"
else
  echo "有 $FAIL 项需处理 ❌"
fi
