# M1 深度学习核心 · 教学文档式项目方案

> 落盘日期：2026-08-01。基于用户需求 + 高质量开源项目调研。

## 项目定位

- **类型**：教学文档式开源项目（先本地做成品，验收后考虑推 GitHub Qxy661）
- **定位**：作品集驱动 + 探究式教学 + 全深度
- **语言**：中文教学文档 + 英文代码注释/变量
- **环境**：WSL `/root/projects/dl-hands-on`，conda `dl` 环境，本地 RTX 4060

## 借鉴的高质量开源项目（调研结论）

| 项目 | 借鉴点 |
|---|---|
| karpathy/micrograd | 最小引擎(150行) + 每算子局部`_backward` + 梯度`+=`累加 + PyTorch当ground-truth做对照测试 |
| CS231n | notebook引导 + 骨架TODO填空 + 数值梯度自检 + naive/vectorized对照 |
| d2l-zh | "scratch/concise成对"结构 + 严格写作规范 + 术语表 |
| 从零CIFAR-10项目 | 里程碑递进 + 每步准确率基线 |
| pytorch/tutorials | 教程/示例分离 + CI验证代码 |

## 核心设计：四阶段闭环

```
阶段1  理论+记号         docs/00-01章
阶段2  手写反向传播引擎   handwritten/engine.py (micrograd式,150行) + tests对照
阶段3  手写MLP→CIFAR     handwritten/mlp.py (CS231n式TODO骨架)
阶段4  PyTorch CNN闭环   pytorch/cnn.py + train_cnn_cifar.py
```

每阶段以"同一个 CIFAR-10"贯穿，形成闭环。里程碑准确率基线：
- 手写 MLP ≈ 50%
- PyTorch CNN ≈ 60-86%（可调参）
- 如实展示难度落差，管理预期

## 目录结构

```
dl-hands-on/
├── README.md            # 项目定位 + 学习路线图
├── pyproject.toml       # 规范打包
├── STYLE_GUIDE.md       # 写作/代码规范
├── docs/                # 教学章节（00-05）
├── handwritten/         # 从零实现（engine/nn/mlp）
├── pytorch/             # 框架版对照（cnn）
├── notebooks/           # 教学引导 notebook
├── exercises/           # TODO 练习（gradient_check）
└── tests/               # ground-truth 对照测试
```

## 验收标准（M1 最终）

1. 能口述"图片从像素到类别概率"全过程
2. 能闭眼写训练循环骨架
3. 手写引擎通过 PyTorch 对照测试（梯度一致）
4. 手写 MLP 在 CIFAR-10 达到 ~50%
5. PyTorch CNN 在 CIFAR-10 达到 60%+
6. 教学文档完整，项目结构规范可发布
