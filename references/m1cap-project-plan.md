# M1 Capstone · MiniTorch 项目方案

> 落盘日期：2026-08-01。M1 的总结升华收尾项目。
> 用 NumPy 从零实现一个微型深度学习框架，用它训练 CNN 在 CIFAR-10 达标。

## 项目定位

- **意图**：把 M1 学的（张量/前向/反向/训练循环/CNN）用一个**具体的应用**总结升华收尾
- **核心思想**：M1 用 150 行**标量**引擎理解了反向传播原理；MiniTorch 升级为**张量级向量化框架**，能真实训练 CNN——这是"从原理到框架"的跨越，正是收尾的升华
- **类型**：作品集级教学项目（同 dl-hands-on 规范）
- **环境**：WSL `/root/projects/minitorch`，conda `dl` 环境，复用 CIFAR-10 数据

## 为什么选这个方向（对比其他候选）

| 候选 | 为什么没选 |
|---|---|
| 手写 ViT | 新知识，不是 M1 收尾；超纲 |
| mini-GPT | 偏语言侧，与 VLA 视觉主线弱 |
| 生成模型 | 偏创作，复杂度高但价值不够"衔接" |
| **MiniTorch** | **把 M1 能力升华 + 卷积反向是 YOLO/VLA 直接基础 + 完整框架设计** |

## 项目结构

```
minitorch/
├── minitorch/
│   ├── tensor_ops.py   张量级算子（forward + backward，向量化）
│   ├── layers.py       框架层 API（像 nn.Module）
│   ├── optim.py        SGD / Adam
│   ├── data.py         数据管线
│   ├── model.py        搭 MLP + CNN
│   └── train.py        训练/评估/可视化
├── tests/              PyTorch 对照测试
├── docs/               教学文档
└── demo/               可视化（预测/混淆矩阵/权重）
```

## 核心算子（每个都要 forward + backward）

- `conv2d`（**核心难点**：im2col 或朴素卷积 + 反向传播）
- `maxpool` / `relu` / `linear` / `batchnorm` / `softmax` / `cross_entropy`
- 全用 NumPy 向量化实现

## 里程碑验收

1. 框架能训练 CNN 在 CIFAR-10 达到 **≥55%**（NumPy 纯手写，这个数字证明向量化正确）
2. 每个算子梯度通过 **PyTorch 对照测试**（ground truth）
3. 完整教学文档（框架设计 + 卷积反向传播推导）
4. demo 可视化（真实预测/混淆矩阵/训练曲线）

## 借鉴（M1 调研精华）

- CS231n Assignment 2：手写 conv/relu/pool/bn 的 forward+backward
- micrograd：用 PyTorch 当 ground truth 验证梯度
- d2l：scratch 先行 + 教学文档规范
