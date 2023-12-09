# 此脚本 easytools 正在开发中...

### 临时笔记 记性不好   `:(`
#### 要将本地 项目 中的文件上传到 GitHub 的 项目 仓库中，您可以按照以下步骤进行操作：

#### 确保已安装Git：
#### 克隆GitHub仓库：

#### 如果您还没有克隆 项目 仓库到您的本地计算机，请在终端（命令提示符）中运行以下命令：

```bash
git clone https://github.com/您的用户名/项目.git
```

#### 将要上传的文件复制到本地仓库：项目 目录中。

#### 将更改添加到暂存区：

#### 在终端中导航到 项目 目录，然后运行以下命令：

```bash
cd 项目
git add .
```

#### 设置用户名和邮箱地址：
```bash
git config --global user.email "your_email@example.com"
git config --global user.name "Your Name"
```



#### 提交更改：
```bash
git commit -m "添加了新文件"
```

#### 推送到GitHub：
```bash
git push origin main
```

#### 查看哪些文件没有被添加到 Git 跟踪列表
```bash
git status
```
