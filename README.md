# VLA × 自主移动机器人 · 全流程学习路径 🚀

> **目标**：成为"从感知到执行"全流程动手能力的机器人工程师。
> **主线**：移动机器人（履带车/无人机）+ VLA 作为高层决策大脑。
> **理念**：每个项目 = **知识概念** + **全流程闭环落地能力** + **精选高设计度复杂项目**。

---

## 🎯 核心叙事：从感知到执行

```
深度学习(M1) → 检测(M2) → 规划(M5) → 控制(micro-ROS) → 硬件落地(PCB/实机)
  看懂         找目标      会导航      会执行          真实机器人
```

**完整机器人能力链**——每个项目是链上的一环，实机小车是集大成者。

## 📂 项目总览（从感知到执行）

| 环节 | 项目 | 核心成果 | 状态 |
|---|---|---|---|
| **感知-学习** | [dl-hands-on](https://github.com/Qxy661/dl-hands-on) | 手写引擎→CIFAR-10 **80.5%** | ✅ |
| 感知-框架 | [minitorch](https://github.com/Qxy661/minitorch) | 纯NumPy框架 **78.1%**（对标PyTorch 80.5%）| ✅ |
| 感知-分类 | [binary-classifier](https://github.com/Qxy661/binary-classifier) | 迁移学习 **100%** | ✅ |
| **感知-检测** | [yolo-applications](https://github.com/Qxy661/yolo-applications) | VisDrone 0.38 + 钢珠 0.93 | ✅ |
| **规划-路径** | [path-planning](https://github.com/Qxy661/path-planning) | 手写A*/RRT*/DWA + Nav2 | 🔄 |
| **决策-VLA** | [vla-starvla-study](https://github.com/Qxy661/vla-starvla-study) | Qwen3-VL + starVLA | ⏳ |
| **硬件-PCB** | [pcb-design](https://github.com/Qxy661/pcb-design) | 从零到控制板/飞控板 | ⏳ |
| **🤖 实机核心** | [robot-real](https://github.com/Qxy661/robot-real) | LEAP小车：建图/导航/视觉/三任务 | 🔄 |

## 🏆 精选复杂项目（高设计度）

| 项目 | 技术亮点 | 复杂度 |
|---|---|---|
| **实机小车**（robot-real）| LEAP ROS2 + micro-ROS + 建图导航 + 三任务 | ★★★★★ |
| **MiniTorch 框架**（M1C）| 700行纯NumPy + 全参CNN 78.1%（对标PyTorch）+ ResNet残差 | ★★★★★ |
| **钢珠检测分支**（M2）| 检测+测量+反光特征+WebUI | ★★★ |
| **路径规划算法库**（M5）| A*/RRT*/DWA + MATLAB 对比 | ★★★ |

## 📚 文档导航

| 文件 | 内容 |
|---|---|
| [作品集结构](references/portfolio-structure.md) | 作品集整体方案 |
| [路径规划知识图谱](references/m5-路径规划知识图谱.md) | 知识框架 |
| [学习资源](references/learning-resources-links.md) | 各模块学习链接 |

## 🎯 里程碑

- [x] **M1 深度学习核心**（手写引擎 + CNN 80.5%）
- [x] **M2 YOLO 全流程闭环**（数据→部署，钢珠 0.93）
- [ ] **M5 路径规划**（算法库完成，导航闭环推进中）
- [ ] **实机小车**（建图导航 → 三任务）
- [ ] **M8 端到端**（语言指令 → 全自动执行）

## 🔧 环境

- 硬件：NVIDIA GPU（8GB）+ 32GB RAM
- 软件：Ubuntu + ROS2 Humble + PyTorch + MATLAB
- 实机：LEAP ROS2 小车（ESP32-S3 + 激光雷达）

---

*从感知到执行，从软件到硬件——完整的机器人工程师能力体系。*
