# VLA × 自主移动机器人 · 全流程学习路径 🚀

> **目标**：成为"从感知到执行"全流程动手能力的机器人工程师。
> **主线**：移动机器人（履带车/无人机）+ VLA 作为高层决策大脑。
> **起点**：2026-08-01 定案，持续迭代中。

> 这是一个**完整的学习路径作品集**——不是零散 demo，
> 而是从深度学习原理 → YOLO 应用 → VLA 决策 → 机器人执行的系统化学习记录。
> 每个模块是独立仓库，本仓库是**导航总览**。

---

## 🗺️ 学习路径全景

```
从感知到执行：
深度学习 → 视觉检测 → 视觉-语言-动作 → 机器人执行
  M1        M2           M3            M4-M8

每个模块 = 能力目标 + 实操项目 + 验收标准
```

## 📂 模块仓库导航

| 模块 | 内容 | 状态 | 仓库 |
|---|---|---|---|
| M0 | 环境与基建（WSL2/conda/CUDA）| ✅ 完成 | — |
| **M1** | 深度学习核心 | ✅ 完成 | [dl-hands-on](https://github.com/Qxy661/dl-hands-on) |
| M1C | Capstone: MiniTorch 框架 | ✅ 完成 | [minitorch](https://github.com/Qxy661/minitorch) |
| M1C2 | 二分类趣味项目 | ✅ 完成 | [binary-classifier](https://github.com/Qxy661/binary-classifier) |
| **M2** | YOLO 全流程闭环 | 🔄 进行中 | [yolo-visdrone](https://github.com/Qxy661/yolo-visdrone) |
| M3 | VLA 核心动手 | ⏳ 规划中 | — |
| M4-M8 | ROS2 / SLAM / 控制 / 集成 | ⏳ 待做 | — |

## ✅ 已完成的成果亮点

### M1 深度学习核心（dl-hands-on）
- **手写反向传播引擎 + MLP**：从零实现自动微分
- **PyTorch CNN**：CIFAR-10 达到 **80.5%**
- 双验证：PyTorch 对照 + 数值梯度

### M1C MiniTorch（minitorch）
- **纯 NumPy 深度学习框架**（约 500 行）
- 实现 MLP/Conv2D 等算子，CIFAR-10 **48.8%**
- im2col 优化，算子 5/5 对照测试

### M1C2 二分类项目（binary-classifier）
- 迁移学习微调，猫狗分类 **89.5%**
- 趣味扩展：奶龙 vs 塔菲 **100%**

### M2 YOLO 全流程闭环（yolo-visdrone）🔄
- VisDrone 小目标检测，YOLO26 **mAP@0.5 0.50+**
- 完整闭环：数据→训练→评估→部署
- 钢珠检测独立分支（1943张数据 + 直径测量 + 反光特征）

## 📚 文档

| 文件 | 内容 |
|---|---|
| [PLAN.md](PLAN.md) | 完整模块化计划（模块 0–8 详细卡片）|
| [PROGRESS.md](PROGRESS.md) | 进度追踪（每模块完成状态）|
| [HARDWARE.md](HARDWARE.md) | 硬件配置备忘 |
| [references/](references/) | 每模块技术笔记 |
| [记忆档案.md](记忆档案.md) | 跨会话学习记忆（可靠持久版）|

## 🎯 里程碑

- [x] M1 深度学习核心（手写引擎 + CNN 80.5%）
- [x] M1C MiniTorch 框架（纯NumPy 48.8%）
- [x] M1C2 二分类（迁移学习 89.5%）
- [ ] M2 YOLO 全流程闭环（进行中）
- [ ] M3 VLA 微调跑通 LIBERO
- [ ] M5 仿真小车自主导航
- [ ] M8 语言指令 → 端到端执行

## 🔧 环境

- 硬件：RTX 4060 8GB / 32GB RAM
- 软件：WSL2 Ubuntu + conda(dl) + PyTorch 2.6 + CUDA

---

*这是一条持续生长的路径。每个模块都是一块独立的砖，最终砌成"从感知到执行"的完整能力。*
