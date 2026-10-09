# Reimbursement Workflow Skills

Automated reimbursement materials organization tool. Organizes invoices, payment screenshots, and shopping screenshots into reimbursement format, automatically generates Word documents and reimbursement folders.

[English](#english) | [中文](#中文)

---

## English

### Features

- **Auto-renaming**: Invoices → `01-item_amount.pdf`, Payment screenshots → `支付截图-amount_company_item.jpg`, Shopping screenshots → `购物截图-amount_company_item.jpg`
- **Auto-matching**: Matches invoices + payment screenshots + shopping screenshots by amount/company/item
- **Word generation**: Creates `支付截图+购买记录.docx` with left-right layout
- **Folder structure**: Organizes PDFs into `发票/` subfolders by invoice
- **Verification**: Checks price consistency and matching accuracy

### Quick Install

**Windows (PowerShell):**
```powershell
irm https://raw.githubusercontent.com/SPARKLE-W/reimbursement-workflow-skills/main/install.ps1 | iex
```

**macOS / Linux:**
```bash
curl -fsSL https://raw.githubusercontent.com/SPARKLE-W/reimbursement-workflow-skills/main/install.sh | bash
```

Or download from [Latest Release](https://github.com/SPARKLE-W/reimbursement-workflow-skills/releases/latest) and copy `.skill` files to `~/.claude/skills/`.

### Usage

**One-shot (main workflow):**
```
/reimbursement-workflow
```
Provide: invoice folder path, payment screenshot folder path, shopping screenshot folder path, name + student ID

**Step by step:**
1. `/invoice-renaming` - Rename invoices
2. `/payment-screenshot-renaming` - Rename payment screenshots
3. `/shopping-screenshot-renaming` - Rename shopping screenshots
4. `/invoice-matching` - Match all three
5. `/docx-generation` - Generate Word doc + folders
6. `/invoice-category-summary` - Generate `报销名目.txt`
7. `/verification` - Verify materials

**Packaging (Step 8):** the final zip is named `{name}{studentID}-{n}张发票-{amount}元.zip` and contains **only** three items, directly at the archive root: `发票/`, `支付截图+购买记录.docx`, `报销名目.txt`. `支付截图/` and `购买记录/` are working folders and must **not** be packed.

**API / subscription recharges** (DeepSeek, MiniMax, iFlytek...): schools require proof that the recharged money has actually been consumed. Invoice the **consumed amount** (platforms support both "by recharge" and "by consumption" invoicing, with a self-filled amount), void the old recharge-based invoice, put the usage reports as page 1 of the Word doc, and keep only as many payment screenshots as needed to cover the invoice amount.

### Skills

| Skill | Description |
|-------|-------------|
| reimbursement-workflow | Main workflow (orchestrates all sub-skills) |
| invoice-renaming | Rename invoices to `序号-物品名称_金额.pdf` |
| payment-screenshot-renaming | Rename payment screenshots |
| shopping-screenshot-renaming | Rename shopping screenshots |
| invoice-matching | Match by amount + company + item |
| docx-generation | Generate Word doc and folders |
| invoice-category-summary | Generate classified `报销名目.txt` |
| verification | Verify prices and matching |

### Dependencies

- Node.js
- `docx` npm package

### License

MIT

---

## 中文

### 功能特点

- **自动命名**：发票 → `序号-物品名称_金额.pdf`，支付截图 → `支付截图-金额_公司_物品.jpg`，购物截图 → `购物截图-金额_公司_物品.jpg`
- **自动匹配**：通过金额+公司+物品名称关联发票、支付截图、购物截图
- **Word生成**：创建 `支付截图+购买记录.docx`，左右分栏布局
- **文件夹整理**：将发票PDF整理到 `发票/` 子文件夹
- **检查验证**：核对价格一致性和匹配准确性

### 一键安装

**Windows (PowerShell):**
```powershell
irm https://raw.githubusercontent.com/SPARKLE-W/reimbursement-workflow-skills/main/install.ps1 | iex
```

**macOS / Linux:**
```bash
curl -fsSL https://raw.githubusercontent.com/SPARKLE-W/reimbursement-workflow-skills/main/install.sh | bash
```

或从 [最新Release](https://github.com/SPARKLE-W/reimbursement-workflow-skills/releases/latest) 下载手动安装。

### 使用方式

**主流程（一键执行）：**
```
/reimbursement-workflow
```
输入：发票文件夹路径、支付截图文件夹路径、购物截图文件夹路径、姓名学号

**分步执行：**
1. `/invoice-renaming` - 发票命名
2. `/payment-screenshot-renaming` - 支付截图命名
3. `/shopping-screenshot-renaming` - 购物截图命名
4. `/invoice-matching` - 三者匹配
5. `/docx-generation` - 生成Word文档和报销文件夹
6. `/invoice-category-summary` - 生成 `报销名目.txt`
7. `/verification` - 检查验证

**打包规范（Step 8）**：最终压缩包命名 `{姓名}{学号}-{张数}张发票-{金额}元.zip`，包内**只放**三项且直接位于包根目录：`发票/`、`支付截图+购买记录.docx`、`报销名目.txt`。`支付截图/`、`购买记录/` 只是整理时的工作目录，**不要**打进压缩包。

**API / 订阅充值类**（DeepSeek、MiniMax、讯飞等）：学校要求证明充进去的钱确实花掉了。要按**已消耗金额**开票（平台支持「按充值金额」和「按消耗金额」两种口径，金额自己填），把旧的按充值开的发票作废重开；Word 第 1 页放用量记录月报，支付截图只留到合计盖住发票金额即可。

### 依赖

- Node.js
- `docx` npm包

### 许可证

MIT
