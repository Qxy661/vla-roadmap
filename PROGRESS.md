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
| M2 | YOLO 全流程闭环 | ⬜ 未开始 | | | `yolo-pipeline` |
| M3 | VLA 核心动手 | ⬜ 未开始 | | | `vla-starvla-study` |
| M4 | ROS2 + 仿真小车 | ⬜ 未开始 | | | `robot-sim-stack` |
| M5 | SLAM + 路径规划 | ⬜ 未开始 | | | `path-planning` |
| M6 | 控制层对接 | ⬜ 未开始 | | | `control-deploy` |
| M7 | 无人机（支线） | ⬜ 未开始 | | | `px4-sim` |
| M8 | 端到端集成 | ⬜ 未开始 | | | `e2e-demo` |

## 里程碑

- [ ] **M2 结束**：能独立复现一个 YOLO 全流程（数据→部署）
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

## 验收记录

（每模块验收时在此记录：口述自检是否通过、演示是否跑通、回炉点是什么）
