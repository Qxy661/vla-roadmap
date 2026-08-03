# 硬件配置备忘

> 实测日期：2026-08-01。来源：本机 Windows 查询 + WSL 注册表。

## 机器配置

| 项 | 值 | 备注 |
|---|---|---|
| 机型 | HP Victus Gaming Laptop 15-fa1xxx | 游戏本 |
| 显卡 | NVIDIA GeForce **RTX 4060 Laptop（8GB 显存）** | AdapterRAM 报 4GB 是 WDDM 限制，实际 8GB |
| 核显 | Intel UHD Graphics | 混合显卡 |
| 内存 | 32GB | 充裕 |
| 双系统 | **有 Ubuntu（100.8GB 分区，同盘）** | 实测确认，非独立 SSD |

## 磁盘布局（实测，1TB 物理盘）

| 分区 | 大小 | 用途 | 剩余 |
|---|---|---|---|
| C: | 152.7GB | Windows 系统盘 | 18.5GB ⚠️ 别往 C 堆大数据 |
| Ubuntu (ext4) | **100.8GB** | 双系统，ROS2 原生环境 | — |
| D: | 601.6GB | 数据盘 + **WSL2 在这** | 60GB |
| E: | 91.5GB | 数据盘 | 21GB |
| F: | 6.2GB | 小分区 | 2.1GB |

## 当前运行环境（已确认）

| 项 | 值 |
|---|---|
| WSL 版本 | 2.6.3（内核 6.6.87） |
| 发行版 | **Ubuntu-22.04**，WSL2 |
| WSL 位置 | **`D:\wsl\Ubuntu-22.04`** ✅ 已在 D 盘，无需迁移 |
| 双系统 | Ubuntu 分区 100.8GB（Type=Unknown 即 ext4），可用 |

**结论**：C 盘爆盘风险不存在（WSL 在 D 盘）；ROS2 学习阶段继续用 WSL2，双系统留给未来真机阶段。

## GPU 方案（定案）

| 任务 | 位置 | 原因 |
|---|---|---|
| 深度学习 / YOLO 训练推理 | **本地**（RTX 4060） | 8GB 足够 |
| ROS2 / Gazebo / SLAM / 规划 | **本地**（WSL2） | CPU 为主 |
| **VLA 微调**（LIBERO 等） | **AutoDL 云 GPU**（4090/A100，按小时） | 8GB 本地显存装不下微调 |
| VLA 推理/解剖 | 本地可做（FP16 小模型） | 只跑不用训 |

**AutoDL 提示**：选 RTX 4090 或 A100；`--shm-size` 拉高共享内存（Dataloader 多进程需要）；数据放云盘，退出实例前存回。

## 双系统使用策略

- **学习阶段（现在）**：用 WSL2（D 盘、空间充足、Windows 无缝、GPU 共享）。
- **未来上真机时**：接 USB 串口/电机驱动板/PX4 飞控需要 USB 直通，WSL2 有摩擦 → 切 **Ubuntu 双系统**原生跑 ROS2。
- **跨系统交换**：用 Git 仓库 / NTFS 共享分区，不要指望 Windows 直接读 ext4 分区。
- **100GB 够用吗**：ROS2 + Gazebo + PX4 SITL 原生跑足够；但别在里面堆大数据集/模型权重（放 D 盘 NTFS 或云盘）。

## 磁盘纪律（防爆盘）

- ⚠️ C 盘仅剩 18.5GB → 大型数据（数据集/模型/conda 缓存）一律放 D/E 盘，别进 C。
- conda 环境默认会占 C 盘 `C:\Users\...\miniconda3` → 考虑装到 D 盘，或改 `PKG_CACHES`。
- WSL2 里 `~/.cache`（HF 模型缓存、conda pkgs）会膨胀 → 定期清理或重定向到 D 盘挂载。

## 待办确认

- [x] WSL 已在 D 盘（实测 `D:\wsl\Ubuntu-22.04`）
- [x] 有 Ubuntu 双系统（100.8GB）
- [ ] 确认 AutoDL 账号（VLA 微调云 GPU 用）
