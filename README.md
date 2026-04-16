# Reimbursement Workflow Skills

报销材料整理自动化工具集。将发票、支付截图、购物截图整理成报销格式，自动生成Word文档和报销文件夹。

## Skills

| Skill | 说明 |
|-------|------|
| reimbursement-workflow | 主流程，串联所有子skill |
| invoice-renaming | 发票命名 |
| payment-screenshot-renaming | 支付截图命名 |
| shopping-screenshot-renaming | 购物截图命名 |
| invoice-matching | 三者匹配 |
| docx-generation | 生成Word文档和报销文件夹 |
| verification | 检查验证 |

## 使用方式

### 主流程（一键执行）
```
/reimbursement-workflow
```
输入：发票文件夹路径、支付截图文件夹路径、购物截图文件夹路径、姓名学号

### 分步执行
1. /invoice-renaming - 发票命名
2. /payment-screenshot-renaming - 支付截图命名
3. /shopping-screenshot-renaming - 购物截图命名
4. /invoice-matching - 三者匹配
5. /docx-generation - 生成Word文档和报销文件夹
6. /verification - 检查验证

## 安装

将 .skill 文件复制到 Claude Code skills 目录：
- Windows: C:/Users/<user>/.claude/skills/
- macOS: ~/.claude/skills/

## 依赖
- Node.js
- docx npm包
