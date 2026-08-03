# 作品集优化建议报告（深度调研版）

> 调研日期：2026-08-03。基于 6 轮系统调研（作品集方法论 / VLA SOTA / 小目标检测 / 路径规划 / 控制 / PCB）。
> 目的：探讨作品集可优化方向，提升成果质量与竞争力。

## 一、调研核心洞察

### 1. 作品集方法论（高质量项目的标准）
**"生产级"胜过"玩具 demo"**：
- ❌ 玩具：TurtleBot 循线、三障碍 Gazebo、预训练 YOLO 的 notebook
- ✅ 高价值：**基准测试（KITTI/排行榜）、真实指标、自研系统**

**三大高价值类别**：
1. **硬件集成**：自制 PCB + 电机控制 + 完整机器人（真实约束处理）
2. **复杂算法**：SLAM/路径规划自研（不靠库，体现原理）
3. **开源贡献**：修 ROS2 关键 bug（体现协作 + 行业标准）

**呈现要求**：3-5 个精选项目 + 完整故事（问题/方案/细节/指标/教训）+ 可视化

### 2. VLA（M3 方向）SOTA 洞察
**关键发现**：
- **小模型可胜大模型**：Qwen3VL-2B 赢 30B（CALVIN）——"越大越好"是错觉
- **视觉编码器是关键**：微调 vision encoder（+18.1 分）> 语言侧调优
- **轻量化是趋势**：SmolVLA/TinyVLA/量化/Token 优化
- **Qwen3-VL 是主流 backbone**（APT/OneVL/VLM4VLA 都用）

**对 M3 的启示**：8GB 用 Qwen3-VL-0.8B/2B 完全合理（小模型反而可能更好），重点调视觉编码器。

### 3. 小目标检测（M2）改进方向
- **P2 检测头**：小目标 +7.6% mAP50（船舶）+10.5% mAP50:95
- **MSFE**（2025 新）：无需训练，YOLO11 +26.5% AP，优于 SAHI
- **边缘部署**：FP16 Jetson + 轻量模型（精度/效率平衡）

**对 M2 的启示**：SAHI 已验证，可加 P2 头实验 / 或 MSFE 对比（更新方法）。

### 4. 路径规划（M5）前沿方向
- **RRT* + 深度强化学习**：DDPG-RRT* / ERRT（98% 成功率，107× 快）
- **学习式采样**：MPN-RRT* / RRT*former（Transformer 引导采样）
- **开源可参考**：indoor_drone_navigation / ERRT / RRT*former

**对 M5 的启示**：手写 RRT* 是基础，可加"RRT* + 学习式采样"作为探索项目（高设计度）。

### 5. 控制（M6）资源
- **ros2_control** 教程（PID/轨迹）+ MAVES 仿真（PID/LQR/MPC）
- **svplan**（ICRA 2025）：MPC 轨迹跟踪（研究级参考）
- **Indoor_navigation_bot**：完整 ROS2 小车（含控制）

### 6. PCB（硬件）最佳路径
- **SiliconWit pcb-design-kicad**：9 课 9 块板（ATmega→STM32→ESP32→4层）——**极佳学习路径**
- **平台多样性**：Arduino→ESP32→STM32 递进（就业加分）
- **推荐路线**：原理图→布局→打样→焊接→调试（每步有实物）

## 二、作品集优化方向建议

### 方向1：强化"精选复杂项目"（最重要）
**现状**：已有钢珠检测/算法库/MiniTorch（好），但可加**1-2 个更高设计度项目**

**建议新增/强化**：
| 项目 | 设计度 | 依据 |
|---|---|---|
| **P2 头实验**（M2）| ★★★★ | 小目标 +7.6%，已验证基线可加 |
| **RRT* + 学习采样**（M5）| ★★★★★ | 2025 前沿，开源可参考 |
| **视觉编码器微调**（M3）| ★★★★★ | VLM4VLA 证明是关键 |
| **小车控制板**（PCB）| ★★★★ | 硬件落地，真实约束 |

### 方向2：加强"闭环 + 指标"
**每个项目强调量化指标**（不只是功能）：
- M2：加 P2 头前后 mAP 对比
- M5：加 RRT* 变体效率对比（节点数/时间）
- M3：加微调前后成功率对比
- PCB：每块板有实物照片 + 调试记录

### 方向3：引入"学习式/前沿方法"
**体现"跟得上 2025-2026 前沿"**：
- MSFE（新 SAHI 替代）对比
- RRT*former（Transformer 采样）实验
- 轻量化 VLA（量化/LoRA）实践

### 方向4：优化作品集呈现
- **3-5 个精选项目**（质量>数量）
- 每个项目：问题→方案→细节→指标→教训
- **视频/动图**（演示 > 静态图）
- 系统架构图 + 基准对比

### 方向5：补强控制/硬件（M6+）
- 控制：ros2_control + MPC 轨迹跟踪（svplan 参考）
- PCB：SiliconWit 9 板路线（比单板更系统）

## 三、资源补充（新增链接库内容）

### VLA
- [VLM4VLA（ICLR 2026，VLM选择研究）](https://arxiv.org/abs/2601.03309)
- [Efficient-VLAs-Survey](https://github.com/YuZhaoshu/Efficient-VLAs-Survey)
- [APT（动作专家预训练）](https://github.com/xukechun/APT)
- [SmolVLA / TinyVLA / OpenVLA](https://github.com/...)

### 小目标检测
- [2023-2025 SOD 综述](https://www.scilit.com/publications/6b9cccef84158a42ac0a2f84c80cb368)
- [MSFE（无需训练增强）](https://...)
- [P2 头 + SAHI 海上检测](https://scite.ai/reports/enhanced-object-detection-in-maritime-4LAKxyN3)

### 路径规划
- [Path-Planning for Intelligent Mobile Robots（开源全套）](https://github.com/DadaNanjesha/Path-Planning-for-Intelligent-Mobile-Robots)
- [ERRT（学习式RRT）](https://xinyuwuu.github.io/Episodic_RRT/)
- [RRT*former](https://github.com/fengmingyang666/RRTformer)

### 控制
- [ros2_control 教程](https://aleksandarhaber.com/ros2-jazzy-tutorial-basics-of-ros2_control-library/)
- [svplan（ICRA 2025 MPC）](https://github.com/ccwss-maker/svplan)
- [MAVES（PID/LQR/MPC 仿真）](https://roam-lab.github.io//projects/mavs/)

### PCB
- [SiliconWit pcb-design-kicad（9板课程）](https://github.com/SiliconWit/pcb-design-kicad)
- [嵌入式 Roadmap（8.1k star）](https://www.xiaohongshu.com/discovery/item/68f76285000000000302c197)

## 四、优先级建议

| 优先级 | 方向 | 理由 |
|---|---|---|
| **高** | 强化精选项目（P2头/RRT*学习采样）| 直接提升作品集"设计度" |
| **高** | 加强指标对比（前后对比）| 体现"闭环+严谨" |
| **中** | 引入前沿方法（MSFE/RRT*former）| 跟上 2025-2026 趋势 |
| **中** | 优化呈现（视频/架构图）| 提升展示力 |
| **低** | 补强控制/硬件 | 后续模块 |

## 五、结论

作品集已有**坚实基础**（概念+闭环+项目齐全），优化方向明确：
1. **精选项目强化**：加 1-2 个高设计度项目（P2 头/RRT* 学习采样）
2. **指标化**：每个项目有量化前后对比
3. **前沿化**：引入 2025 新方法（MSFE/学习式规划）
4. **呈现优化**：视频/架构图/基准

---
*基于深度调研的优化建议。供后续迭代参考。*
