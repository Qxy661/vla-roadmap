# M0-5 starVLA 环境准备笔记

> 2026-08-01。基于 starVLA 稳定分支 (`starVLA`) 实际克隆 + 官方 Quick Start 指南整理。

## 已确认事实

- **仓库**：`github.com/starVLA/starVLA`（组织归属 starVLA）
- **默认分支**：`starVLA_dev`（活跃开发，可能不稳定）；README 明确建议**稳定分支 `starVLA`** 用于验证结果
- **我们的克隆**：`/root/projects/starVLA`，分支 `starVLA`，`--depth 1` 浅克隆
- **稳定分支结构**（与 dev 不同，无 `examples/simBenchmarks/` 层级）：
  ```
  examples/
    LIBERO/            ← 训练/评估入口（README, data_preparation.sh, eval_files, train_files）
    SimplarEnv/ Robocasa_tabletop/ Robotwin/ Behavior/ DOMINO/ ...（多基准）
    Franka/  RoboChallenge_table30v2/  （真机示例）
  docs/starVLA_guideline.md   ← Quick Start 指南
  starVLA/  model/ dataloader/ training/ config/
  requirements.txt
  ```

## Quick Start 环境要求（指南原文要点）

```bash
conda create -n starVLA python=3.10 -y
pip install -r requirements.txt
pip install flash-attn --no-build-isolation   # ⚠️ 难点
pip install -e .
```

- Python **3.10**（跟主 `dl` 环境一致）
- **flash-attn**：必须匹配 CUDA toolkit (nvcc) 和 torch 版本；指南验证 `flash-attn==2.7.4.post1` 配 nvcc 12.0/12.4 ✅
- 单卡 A100 可跑；小 VLM（Florence-2）也行

## requirements.txt 关键版本（稳定分支实测）

```
transformers==4.57.0
accelerate==1.5.2
torchvision==0.21.0        # 配套 torch 2.6
numpy==1.26.4
deepspeed==0.16.9
qwen-vl-utils
pyarrow==14.0.1
# 注释提示：torch==2.6.0+cu124, triton==3.2.0, flash-attn==2.7.4.post1
```

## M0-5 范围（我们定的）

- 目标：**装好 starVLA 环境 + 跑通推理冒烟测试**（用 checkpoint 做 forward pass），达成"先导激励"
- **不做**：训练（留给 M3 云端）、LIBERO 完整评估（需大显存）
- 环境：**单独建 `starVLA` conda 环境**，与主 `dl` 环境隔离（避免版本冲突）

## 待办坑预警

1. flash-attn 编译需要 nvcc → 需装 CUDA toolkit（WSL2 内），编译 10-30 分钟
2. Qwen3-VL-4B 模型 ~8GB → 本地可下（磁盘 941G 够），推理 forward pass 本地可行
3. torch 版本要对齐：requirements 注释明确 torch==2.6.0+cu124
