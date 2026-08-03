# 作品集优化报告（完整深度调研版）

> 调研：2026-08-03，8 轮系统深度调研。
> 覆盖：SLAM从零实现 / VLA SOTA与微调 / 小目标检测 / 学习式路径规划 / MPC控制 / 飞控PCB / 作品集展示。
> 目的：为作品集提供**有深度、有创新点、可执行**的优化方向。

---

## 第一部分：深度技术发现（每个方向）

### 1.1 SLAM 从零实现（最高价值项目方向）

**GO-SLAM 案例**（2个月 C++17 + ROS2，不用 Ceres/g2o/GTSAM）：
```
三循环架构：
  Front-end：GICP 扫描匹配（~10Hz）
  Keyframe/闭环检测（~1Hz）
  Back-end：位姿图优化（闭环时）
```

**核心技术细节**：
- **GICP**（广义ICP）：每个点当高斯分布，比 point-to-plane 漂移减半（2.3%→1.1%）
- **自写 Levenberg-Marquardt 求解器**：`(JᵀWJ + λ·diag(JᵀWJ))·δ = -JᵀW·r`
- **李代数参数化**（se(3) 而非欧拉角）
- **KITTI 基准**：RTE ~1.1%，RRE ~0.4°/100m（SOTA 的 2 倍内）

**关键教训**：
- SLAM 难点是"账本管理"（keyframe/边/闭环）非算法——70%代码+90%bug
- 位姿图优化主要错在 Jacobian 符号/坐标系约定
- 从零实现是"调试机器"——理解比用库深

**对作品集的创新点**：手写一个"从零 2D 激光 SLAM"（GICP + 位姿图 + LM），KITTI/公开数据集基准——这是**"生产级"最高信号项目**。

### 1.2 VLA（M3）深度发现

**VLM4VLA（ICLR 2026）关键结论**：
- **小模型可胜大模型**：Qwen3VL-2B 赢 30B（CALVIN ABC-D）
- **视觉编码器是瓶颈**：冻结视觉编码器灾难性（-42分）；微调视觉编码器 +18.1分
- 通用 VLM 基准分 ≠ 操作性能（相关性近 0）

**Qwen3-VL 微调最佳实践**：
```
8GB 现实：Qwen3-VL-8B 微调需 24GB（LoRA+量化也要 18-22GB）
8GB 方案：用 0.8B/2B，或 AndesVL 0.6-4B
关键配置：LoRA(r=16) + 4bit量化 + gradient_checkpointing + paged_adamw_8bit
分层策略：Projector(1e-5) > Vision(1e-6) > LLM(1e-6~2e-7) 差异化学习率
数据：500-1000 条领域样本即可
```

**对 M3 的创新点**：
1. **视觉编码器微调实验**（VLM4VLA 证明的关键杠杆）
2. **小模型对比**（Qwen3VL-2B vs 0.8B，验证"小胜大"）
3. **轻量化 VLA**（量化/LoRA/Token 优化）

### 1.3 小目标检测（M2）深度发现

**2023-2025 演进**：
- **P2 头**：小目标 +7.6%（船舶）+10.5%
- **MSFE**（2025 新，无需训练）：自适应切片+上采样+级联，YOLO11 +26.5% AP，**优于 SAHI**（更快更准）
- **边缘部署**：FP16 + Jetson AGX Orin（精度/效率平衡）

**对 M2 的创新点**：
1. **P2 头实验**（本项目已训过 P2+CBAM，可对比新 P2）
2. **MSFE 对比 SAHI**（2025 新方法，优于现有）
3. **轻量化部署**（本项目已 95fps，可加 Jetson/边缘验证）

### 1.4 学习式路径规划（M5）深度发现

**2025 前沿**：
- **ERRT**（Episodic RRT）：DRL 学多步探索，98%成功率（vs RRT 19%），107×快，99.6% 少碰撞
- **RRT*former**：Transformer 提取环境特征引导采样
- **MPN**：编码器(Enet) + 规划网络(Pnet)，<1秒，2D-7D 泛化
- **DQN-A***：DQN 加速 A*，动态环境（开源全套）

**对 M5 的创新点**：
1. **学习式采样 RRT***（ERRT 思路）：手写 RRT* + 学习采样引导
2. **动态障碍**：DRL 预测 + RRT* 全局（2025 主流）
3. **对比基准**：手写 RRT* vs 学习式（节点/时间/成功率）

### 1.5 MPC 控制（M6）深度发现

**MPC vs PID 量化**（TurtleBot3）：
| 指标 | MPC | PID |
|---|---|---|
| 跟踪误差 | 0.04m | 0.12m（3× 差）|
| 速度稳定 | ~0.22m/s 稳 | 波动 -0.1~0.25 |
| 导航时间 | 42s | 58s |
| 动态障碍 | 可重规划 | 卡住 |

**结论**：MPC 精度 3× 优，但算力高；混合 MPC-PID 是折中。
**2025 趋势**：ANN-MPC / NMPC-MPPI（GPU加速）混合方案。

**对 M6 的创新点**：**MPC vs PID 对比实验**（TurtleBot3），体现控制深度——和 M5 路径规划形成闭环。

### 1.6 飞控板 PCB（硬件）深度发现

**完整 BOM**（开源 STM32F405 飞控）：
- MCU：STM32F405RGT6 + ICM-42688-P IMU + IST8310 磁力计 + MS5611 气压计
- 电源：LiPo(3-6S) → DC-DC(TPS54560) → LDO(TPS62175) → 分域
- 布局：IMU 板中心、L2 整面地、磁珠分域、4层板
- **4层板是甜点**（6层可降到4层）

**对 PCB 的创新点**：
1. **飞控板做精选项目**（有完整开源参考 + BOM）
2. **模块化板分离**（主控/电源/传感器三板）——2025 趋势
3. **IMU 布局/EMC 规范**（调研有完整细节）

### 1.7 作品集展示（方法论）深度发现

**最佳实践**：
- **3-5 个精选项目**（质量>数量）
- **每个项目完整故事**：问题→方案→技术细节→测试→结果→教训
- **视频演示必备**（30-60秒，MP4/H.264，"工作demo>静态图"）
- **架构图 + 硬件照片 + 基准对比**
- **MESGRO 模板**（机器人作品集专用：3D模型/原理图/交互数据）

---

## 第二部分：作品集创新点建议（可执行）

### 创新项目 1：从零 2D 激光 SLAM（最高价值）
```
手写 GICP + 位姿图优化 + LM 求解器（不靠库）
KITTI 序列基准（RTE/RRE/ATE）
+ ROS2 集成 + 对比 Cartographer
设计度：★★★★★
```

### 创新项目 2：P2 头 + MSFE 小目标检测（M2 强化）
```
已有 YOLO26s 基线（mAP 0.38）
加 P2 头对比 + MSFE（新方法）对比 SAHI
量化前后 mAP/FPS 对比
设计度：★★★★
```

### 创新项目 3：学习式 RRT* 路径规划（M5 强化）
```
手写 RRT*（已有）+ 学习式采样（ERRT 思路）
动态障碍场景 + 成功率/时间基准
对比手写 vs 学习式
设计度：★★★★★
```

### 创新项目 4：视觉编码器微调 VLA（M3 强化）
```
Qwen3-VL-0.8B + LoRA
对比：冻结 vs 微调视觉编码器（VLM4VLA 思路）
微调前后成功率/推理对比
设计度：★★★★★
```

### 创新项目 5：飞控板 PCB（硬件精选）
```
STM32F405 + IMU + 4层板（参考开源 BOM）
模块化板分离 + EMC 规范
实物 + 调试记录
设计度：★★★★
```

---

## 第三部分：作品集展示升级建议

1. **GitHub Pages 作品集网站**（MESGRO 模板）
   - 交互 3D 模型 / 原理图 / 视频 / 数据可视化
2. **每个项目视频**（30-60秒 MP4）
3. **系统架构图**（每个项目）
4. **统一指标呈现**（表格：精度/速度/成功率）

---

## 第四部分：优先级路线图

| 阶段 | 动作 | 价值 |
|---|---|---|
| **P0（最高）** | 从零 2D SLAM 项目 | 生产级信号最强 |
| P1 | P2头+MSFE 检测 / 学习式RRT* | M2/M5 强化 |
| P1 | 视觉编码器微调 VLA | M3 前沿 |
| P2 | 飞控板 PCB | 硬件精选 |
| P2 | GitHub Pages 作品集 | 展示升级 |

## 第五部分：资源清单（深度）

### SLAM 从零
- [GO-SLAM 从零实现](https://panav.gitbook.io/robotics-handbook/authors-projects/go-slam)
- [2D激光SLAM从零](https://deepwiki.com/xiangli0608/Creating-2D-laser-slam-from-scratch/7.3.2-gtsam-and-alternative-solvers)
- [SLAM算法实现集合](https://github.com/anmolagarwal999/Implementation-of-robotic-vision-and-SLAM-algorithms)

### VLA
- [VLM4VLA（ICLR 2026）](https://arxiv.org/abs/2601.03309)
- [Qwen3-VL 微调指南](https://deepwiki.com/QwenLM/Qwen3-VL/7-fine-tuning)
- [Efficient-VLAs-Survey](https://github.com/YuZhaoshu/Efficient-VLAs-Survey)

### 小目标检测
- [2023-2025 SOD综述](https://www.scilit.com/publications/6b9cccef84158a42ac0a2f84c80cb368)
- [P2头+SAHI海上检测](https://scite.ai/reports/enhanced-object-detection-in-maritime-4LAKxyN3)

### 路径规划
- [MPNet（原始论文）](https://ar5iv.labs.arxiv.org/html/1907.06013)
- [ERRT学习式RRT](https://xinyuwuu.github.io/Episodic_RRT/)
- [Path-Planning开源全套](https://github.com/DadaNanjesha/Path-Planning-for-Intelligent-Mobile-Robots)

### MPC控制
- [MPC vs PID TurtleBot3研究](https://www.deanfrancis.press/ojs/index.php/te/article/view/1564)
- [svplan ICRA 2025 MPC](https://github.com/ccwss-maker/svplan)

### 飞控PCB
- [STM32F405飞控（oshwhub）](https://oshwhub.com/zcshanlin/lin-hai-fei-kong)
- [STM32F407飞控V3.0](https://oshwhub.com/hfy_hfy_hfy/407_-fei-kong-_v2-0)

### 作品集展示
- [MESGRO 机器人作品集模板](https://github.com/aojedao/MESGRO)
- [lizuju 机器人作品集](https://github.com/lizuju/lizuju.github.io)

---

## 结论

作品集已具备坚实基础，**深度优化方向明确**：
1. **P0：从零 SLAM**（最高生产级信号）
2. **各模块前沿强化**：P2头/MSFE、学习式RRT*、视觉编码器微调、飞控板
3. **展示升级**：GitHub Pages + 视频 + 架构图
4. **每个项目指标化**（前后对比、基准）

**核心创新点**：把"从零实现"（SLAM/算法）+ "前沿方法"（学习式/视觉微调）+ "硬件落地"（飞控板）结合，形成"原理→前沿→落地"的完整能力证明。

---
*完整深度调研报告。供审核后选择实施方向。*
