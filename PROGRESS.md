# 进度追踪清单

> 每完成一个模块：勾选 + 填完成日期 + 写技术笔记到 `references/`。
> 验收没过，不算完成。宁回炉，不积债。

## 模块状态总表

| 模块 | 内容 | 状态 | 完成日期 | 笔记 | 仓库 |
|---|---|---|---|---|---|
| M0 | 环境与基建 | ✅ 完成 2026-08-01 | | `references/m0-验收记录.md` | `vla-workspace` |
| M1 | 深度学习核心 | ✅ 完成 2026-08-01 | | `references/m1-project-plan.md` | `dl-hands-on` |
| M1C | Capstone: MiniTorch 框架 | ✅ 完成 2026-08-01 | | `references/m1cap-验收记录.md` | `minitorch` |
| M1C2 | 二分类趣味项目（猫狗→奶龙塔菲）| ✅ 完成 2026-08-01 | | `references/binary-class-验收记录.md` | `binary-classifier` |
| M1C3 | 奶龙vs塔菲趣味应用 | ✅ 完成 2026-08-02 | | README 结果段 | `binary-classifier` |
| M2 | YOLO 全流程闭环 | ✅ 完成 2026-08-03 | | `references/m2-验收记录.md` | `yolo-visdrone` |
| M3 | VLA 核心动手 | ⬜ 未开始 | | | `vla-starvla-study` |
| M4 | ROS2 + 仿真小车 | ⬜ 未开始 | | | `robot-sim-stack` |
| M5 | SLAM + 路径规划 | 🔄 进行中 2026-08-03 | | `references/m5-作品集方案.md` | `path-planning` |
| M6 | 控制层对接 | ⬜ 未开始 | | | `control-deploy` |
| M7 | 无人机（支线） | ⬜ 未开始 | | | `px4-sim` |
| M8 | 端到端集成 | ⬜ 未开始 | | | `e2e-demo` |

## 里程碑

- [x] **M2 结束**：能独立复现一个 YOLO 全流程（数据→部署）✅ 2026-08-03
- [ ] **M3 结束**：亲手微调过一个 VLA 并在 LIBERO 跑通 ← **计划题眼**
- [ ] **M5 结束**：仿真小车自主导航避障到达目标点
- [ ] **M8 结束**：一个语言指令 → 全自动执行 → 端到端 demo

## 每周日志

| 周 | 日期 | 做了什么 | 卡点/心得 |
|---|---|---|---|
| 0 | 2026-08-01 | 定案主线 + 落盘计划 + 硬件摸底 | GPU=RTX4060 8GB；VLA微调需云端 |
| 0 | 2026-08-01 | 补充确认：WSL 已在 D 盘（`D:\wsl\Ubuntu-22.04`）、有 Ubuntu 双系统 100G | C盘爆盘风险解除；未来真机用双系统 |
| 0 | 2026-08-01 | M0-1~4 盘点完成（WSL2/miniconda/ROS2 本已齐全） | 只需补 conda+torch |
| 0 | 2026-08-01 | M0-3 完成：torch 2.6.0+cu124 + CUDA 库，GPU 全链路打通 | PyPI精简版+补nvidia库=cudnn/cublas 等效cu124，避开2.5G下载 |
| 1 | 2026-08-01 | M1 完成：手写反向传播引擎+MLP+PyTorch CNN，CIFAR-10 80.5% | 教学文档项目 `dl-hands-on`，5 commit，双验证（PyTorch对照+数值梯度） |
| 1C | 2026-08-01 | M1 Capstone 完成：MiniTorch 纯NumPy框架，CIFAR-10 48.8% | `minitorch` 框架500行，算子5/5对照测试，im2col优化，教学文档4篇 |
| 2 | 2026-08-03 | M2 完成：VisDrone YOLO26s (mAP50 0.382) + SAHI +27% + 钢珠(mAP50 0.93) + 部署(ONNX/WebUI/95fps) | `yolo-visdrone` 51提交推送GitHub；知识体系9篇；评估方法论落盘 |
| 2 | 2026-08-03 | M1+M2 规范化：技术文档+成果图+git初始化，5仓库公开推送 | 方案B（导航+独立仓库）；ViT衔接文档补全规划缺口 |
| 2 | 2026-08-03 | M5 启动：调研确认方案（LaValle/2024综述/Nav2/MATLAB角色）| 手写A*/RRT*/DWA + MATLAB对比 + 知识体系6篇 |
| 2 | 2026-08-03 | M5 巡检导航：TurtleBot3+Nav2装好，SLAM建图流程跑通 | WSL的Gazebo/DDS问题待Ubuntu原生环境解决 |

## M0 验收记录

- [x] M0-3 深度学习环境：torch 2.6.0+cu124，CUDA 可用，GPU 冒烟测试通过（矩阵乘+反向+CNN 前向）
- [x] 环境健康检查脚本 verify_env.sh：9/9 全绿
- [x] M0-5 starVLA：依赖 + 推理冒烟测试（框架可加载即验收，8GB大模型留 M3）

## M1 验收记录（2026-08-01）

- [x] 手写反向传播引擎 7/7 PyTorch 对照测试通过
- [x] 数值梯度自检通过（引擎+MLP 双验证）
- [x] 手写 MLP 在 moons 训练收敛 100%
- [x] PyTorch CNN 在 CIFAR-10 达 80.5%（>60% 里程碑）
- [x] 教学文档 6 章完整（00-05）+ 项目规范（LICENSE/STYLE_GUIDE/pyproject）
- [x] 项目 `dl-hands-on` 5 个清晰 commit，WSL `/root/projects/dl-hands-on`

## M2 验收记录（2026-08-03）

- [x] VisDrone 小目标检测：YOLO26s 训练 50 epochs，mAP50 0.382 / mAP50-95 0.219
- [x] 完整评估：P/R/按类别/混淆矩阵诊断（bicycle 最难 AP 0.13，car 最好 0.79）
- [x] SAHI 优化：同阈值对比 mAP50 +27%（0.300→0.381），小目标提升
- [x] 钢珠检测独立分支：1943 张数据，mAP50 0.93，测量+高光校验验证（8/8）
- [x] 部署闭环：ONNX 导出 + 推理验证（30ms）+ WebUI 交互页 + 实时性能 95 FPS
- [x] 知识体系 9 篇（含 ViT 视觉编码器桥）+ 评估方法论 + 部署能力分析
- [x] 项目 `yolo-visdrone` 51 提交，GitHub 公开推送完成

## 验收记录

（每模块验收时在此记录：口述自检是否通过、演示是否跑通、回炉点是什么）
