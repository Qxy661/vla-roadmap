# Path-Planning 作品集完善规划（Ubuntu 执行）

> 目标：完善 path-planning 到作品集完整状态（Ubuntu 做，回来推送）。

## 一、现状（已有）

```
algorithms/astar.py, rrt_star.py, dwa.py（手写算法）
algorithms/demo_all.py（三算法演示）
docs/01-06（知识体系）
matlab/astar_matlab.m + astar_comparison.png
robot/start_slam.sh, auto_explore.py, save_map.py
results/algorithms_demo.png
```

## 二、待完善（4 项）

### 1. 算法测试（体现可靠性）
创建 `tests/`：
```
tests/test_astar.py    # A* 正确性（找路径/最优性）
tests/test_rrt.py      # RRT* 正确性（找到路径）
tests/test_dwa.py      # DWA 正确性（避障到目标）
```

**验证**：`pytest tests/` 全通过

### 2. 算法对比基准（量化指标）
创建 `results/comparison.md`：
```
| 算法 | 场景 | 节点/迭代 | 时间 | 成功率 | 路径长度 |
| A*   | 栅格20x20 | 42节点 | Xms | 100% | 28步 |
| RRT* | 障碍场景 | X节点 | Xms | X% | X |
| DWA  | 避障 | X步 | Xms | X% | 到达 |
```

**验证**：跑 demo_all.py + 扩展计时

### 3. 探索应用（高设计度）
创建 `exploration/`：
```
exploration/rrt_dynamic.py    # RRT* + 动态障碍（学习式思路）
exploration/compare_benchmark.py  # 算法性能基准
```

**验证**：跑通 + 可视化

### 4. 可复现（环境）
创建 `requirements.txt`：
```
numpy
matplotlib
```

## 三、Ubuntu 执行步骤

```bash
# 1. 环境
cd path-planning
pip install -r requirements.txt

# 2. 跑算法演示
python algorithms/demo_all.py

# 3. 写测试
mkdir tests
# (写 test_astar/test_rrt/test_dwa)
pytest tests/

# 4. 算法对比
python algorithms/demo_all.py  # 记录指标到 results/comparison.md

# 5. 探索应用
python exploration/rrt_dynamic.py
python exploration/compare_benchmark.py

# 6. 更新 README（加测试/对比/探索）
```

## 四、完成标准（推送前）

- [ ] tests/ 全通过
- [ ] results/comparison.md 有量化对比
- [ ] exploration/ 跑通
- [ ] requirements.txt 有
- [ ] README 完整
- [ ] git commit + push

## 五、推送后回来确认

- [ ] GitHub 显示完整
- [ ] 我审查质量

---
*Ubuntu 完善规划。做完推送回来。*
