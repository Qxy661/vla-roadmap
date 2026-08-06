# Path-Planning 仿真部分 · Ubuntu 规划

> 目标：在 Ubuntu 完成仿真环境（Gazebo 建图 → Nav2 导航），验证算法在 ROS 的可用性。

## 一、仿真要做什么

```
纯算法（已完成）→ 仿真验证（Gazebo + Nav2）→ 实机（LEAP小车）
               ↑ 本规划
```

**验证**：手写算法库的理解 → 在 ROS2 仿真环境实际跑通导航。

## 二、环境准备（Ubuntu 22.04）

```bash
# 1. 确认 ROS2
source /opt/ros/humble/setup.bash

# 2. 装仿真依赖
sudo apt install ros-humble-turtlebot3 ros-humble-turtlebot3-simulations
sudo apt install ros-humble-nav2-bringup ros-humble-navigation2
sudo apt install ros-humble-gazebo-ros-pkgs

# 3. 设 TurtleBot3 型号
echo "export TURTLEBOT3_MODEL=burger" >> ~/.bashrc
source ~/.bashrc
```

## 三、仿真流程

### 1. 启动仿真世界（Gazebo）
```bash
ros2 launch turtlebot3_gazebo turtlebot3_world.launch.py
# 应看到 Gazebo 窗口 + 小车
```

### 2. 建图（SLAM）
```bash
# 终端2：启动 Cartographer 建图
ros2 launch turtlebot3_cartographer cartographer.launch.py use_sim_time:=True

# 终端3：遥控小车走一圈（键盘）
ros2 run turtlebot3_teleop turtlebot3_teleop_key
# 按 WASD 控制小车遍历场景

# 终端4：观察建图
ros2 run rviz2 rviz2 -d $(ros2 pkg prefix turtlebot3_cartographer)/share/turtlebot3_cartographer/config/turtlebot3_cartographer.rviz
```

### 3. 保存地图
```bash
# 建图完成后，保存
mkdir -p ~/map
ros2 run nav2_map_server map_saver_cli -f ~/map/room
# 生成 room.pgm + room.yaml
```

### 4. 导航（Nav2）
```bash
# 终端2：启动 Nav2（加载地图）
export TURTLEBOT3_MODEL=burger
ros2 launch turtlebot3_navigation2 navigation2.launch.py map:=~/map/room.yaml

# 终端3：RViz 设置初始位姿 + 目标点
ros2 run rviz2 rviz2 -d $(ros2 pkg prefix turtlebot3_navigation2)/share/turtlebot3_navigation2/rviz/turtlebot3_navigation2.rviz
# RViz 里：2D Pose Estimate 设初始位姿
#        2D Goal Pose 设目标 → 小车自主导航
```

## 四、验证内容（作品集素材）

1. **建图结果**：保存的地图（room.pgm 截图）
2. **导航效果**：小车到达目标（视频/截图）
3. **对比**：手写算法 vs Nav2（可在 README 记录）

## 五、完成标准（推送前）

- [ ] Gazebo 仿真世界启动成功
- [ ] Cartographer 建图完成（地图可见）
- [ ] 地图保存（room.yaml）
- [ ] Nav2 导航到达目标
- [ ] 截图/视频记录
- [ ] 更新 README（仿真部分）
- [ ] git push

## 六、常见问题

| 问题 | 解决 |
|---|---|
| Gazebo 打不开 | 确认已装 gazebo-ros-pkgs |
| 雷达不转 | 确认 TURTLEBOT3_MODEL |
| Nav2 无话题 | 确认地图路径正确 |
| 小车不动 | 确认 cmd_vel 话题 |

## 七、资源

- TurtleBot3 教程：emanual.robotis.com
- Nav2 文档：docs.nav2.org
- Cartographer：github.com/cartographer-project

---
*Ubuntu 仿真规划。做完推送回来。*
