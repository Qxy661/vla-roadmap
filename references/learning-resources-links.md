# 学习资源链接库（M1/M2/M5）

> 收录各模块学习用到和值得参考的高质量开源项目/教学文档/视频链接。
> PCB 链接见 `pcb-高质量项目链接库.md`。

## 一、M1 深度学习

### 教学（经典，必看）
| 资源 | 亮点 |
|---|---|
| [3Blue1Brown 神经网络系列](https://www.3blue1brown.com/topics/neural-networks) | 可视化理解反向传播（B站有中文）|
| [Neural Networks and Deep Learning (Michael Nielsen)](http://neuralnetworksanddeeplearning.com/) | 在线免费书，手写网络经典 |
| [深度学习 花书 (Deep Learning)](https://www.deeplearningbook.org/) | 领域权威教材 |

### 开源项目（参考）
| 项目 | 亮点 |
|---|---|
| [micrograd (karpathy)](https://github.com/karpathy/micrograd) | 100行自动微分引擎（本项目思路来源）|
| [minGPT (karpathy)](https://github.com/karpathy/minGPT) | 最小GPT实现 |
| [PyTorch 官方教程](https://pytorch.org/tutorials/) | 权威入门 |

### 视频
| 视频 | 亮点 |
|---|---|
| [karpathy 反向传播教程](https://www.youtube.com/playlist?list=PLAqhIrjkxbuWI23v9cThsA9GvCAUhRvKZ) | 从零手写神经网络系列 |
| [吴恩达深度学习](https://www.bilibili.com/video/BV1FT4y1E74V) | 系统课程 |

## 二、M2 YOLO 目标检测

### 教学
| 资源 | 亮点 |
|---|---|
| [Ultralytics YOLO 文档](https://docs.ultralytics.com/zh/) | 官方权威（本项目用）|
| [VisDrone 数据集](https://github.com/VisDrone/VisDrone-Dataset) | 官方数据 |
| [SAHI 切片推理](https://github.com/obss/sahi) | 小目标检测神器 |

### 开源项目
| 项目 | 亮点 |
|---|---|
| [YOLOv8 官方](https://github.com/ultralytics/ultralytics) | 本项目基础 |
| [yolov5](https://github.com/ultralytics/yolov5) | 经典版本 |
| [钢珠检测数据集](https://huggingface.co/datasets/daffae/steelball_detect) | 本项目钢珠数据 |

## 三、M5 路径规划

### 教学（权威）
| 资源 | 亮点 |
|---|---|
| [Planning Algorithms (LaValle)](http://www.lavalle.pl/planning/) | **领域圣经**，免费在线 |
| [2024 采样规划综述](https://www.annualreviews.org/docserver/fulltext/control/7/1/annurev-control-061623-094742.pdf) | 权威综述 |
| [ROS2 Nav2 文档](https://docs.nav2.org/) | 官方导航栈 |

### 开源项目
| 项目 | 亮点 |
|---|---|
| [PythonRobotics](https://github.com/AtsushiSakai/PythonRobotics) | **路径规划算法集合**（A*/RRT/DWA全有）|
| [Nav2](https://github.com/ros-navigation/navigation2) | ROS2 导航栈 |
| [TurtleBot3](https://github.com/ROBOTIS-GIT/turtlebot3) | 巡检机器人平台 |

### 视频/教程
| 资源 | 亮点 |
|---|---|
| [B站 路径规划入门](https://www.bilibili.com/) | 搜索"A*算法 RRT算法"有大量教程 |
| [ROS2 Nav2 官方教程](https://docs.nav2.org/tutorials/index.html) | 从入门到导航 |

## 四、MATLAB（科研）

| 资源 | 亮点 |
|---|---|
| [MATLAB Robotics Toolbox](https://www.mathworks.com/help/robotics/) | 官方（plannerAStar等）|
| [Peter Corke Robotics Toolbox](https://github.com/petercorke/robotics-toolbox-matlab) | 经典机器人工具箱 |

## 五、前沿资源（2025-2026 调研补充）

### VLA（M3）
| 资源 | 亮点 |
|---|---|
| [VLM4VLA（ICLR 2026）](https://arxiv.org/abs/2601.03309) | VLM 选择研究：小模型可胜大模型 |
| [Efficient-VLAs-Survey](https://github.com/YuZhaoshu/Efficient-VLAs-Survey) | 轻量化 VLA 综述 |
| [APT 动作专家预训练](https://github.com/xukechun/APT) | 提升指令泛化 |
| [SmolVLA / OpenVLA / TinyVLA](https://huggingface.co/) | 轻量 VLA 模型 |

### 小目标检测（M2）
| 资源 | 亮点 |
|---|---|
| [2023-2025 SOD 综述](https://www.scilit.com/publications/6b9cccef84158a42ac0a2f84c80cb368) | 全面综述 |
| [MSFE 无需训练增强](https://scite.ai/) | 优于 SAHI，YOLO11 +26.5% |
| [P2 头 + SAHI 海上检测](https://scite.ai/reports/enhanced-object-detection-in-maritime-4LAKxyN3) | P2 头小目标 +7.6% |

### 路径规划（M5）
| 资源 | 亮点 |
|---|---|
| [Path-Planning 开源全套](https://github.com/DadaNanjesha/Path-Planning-for-Intelligent-Mobile-Robots) | A*/D*/RRT*/DQN-A* |
| [ERRT 学习式RRT](https://xinyuwuu.github.io/Episodic_RRT/) | 98% 成功率，107×快 |
| [RRT*former](https://github.com/fengmingyang666/RRTformer) | Transformer 引导采样 |

### 控制（M6）
| 资源 | 亮点 |
|---|---|
| [ros2_control 教程](https://aleksandarhaber.com/ros2-jazzy-tutorial-basics-of-ros2_control-library/) | PID/轨迹控制 |
| [svplan（ICRA 2025 MPC）](https://github.com/ccwss-maker/svplan) | MPC 轨迹跟踪 |
| [MAVES 仿真](https://roam-lab.github.io//projects/mavs/) | PID/LQR/MPC |

### PCB
| 资源 | 亮点 |
|---|---|
| [SiliconWit pcb-design-kicad](https://github.com/SiliconWit/pcb-design-kicad) | 9 课 9 板（极佳路径）|
| [嵌入式 Roadmap（8.1k star）](https://www.xiaohongshu.com/discovery/item/68f76285000000000302c197) | 软硬件路线 |

## 六、学习方法建议

1. **M1**：先看 3Blue1Brown 理解概念，再对照本项目 micrograd 思路
2. **M2**：Ultralytics 文档 + 本项目闭环，看 SAHI/P2 头源码
3. **M5**：LaValle 书 + PythonRobotics 代码 + 本项目算法库对比
4. **MATLAB**：Robotics Toolbox 官方例子 + 本项目 astar_matlab.m
5. **前沿**：定期看 VLM4VLA/ERRT/RRT*former 等（跟上前沿）
