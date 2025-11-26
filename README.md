# Batch File Rename Assistant

强大的批量文件重命名工具，支持 AI 驱动的智能重命名功能。

## 项目简介

这是一个基于 Flutter 开发的 Web 应用，提供批量文件重命名功能。

## 本地开发

### 环境要求

- Flutter SDK 3.10.0 或更高版本
- Dart SDK

### 运行项目

```bash
# 获取依赖
flutter pub get

# 运行 Web 应用
flutter run -d chrome
```

## 构建静态网站

### 使用构建脚本

项目提供了便捷的构建脚本：

```bash
./build.sh
```

构建完成后，静态文件将输出到 `build/web` 目录。

### 手动构建

你也可以手动执行构建命令：

```bash
# 清理旧的构建文件
flutter clean

# 获取依赖
flutter pub get

# 构建 Web 应用（发布模式）
flutter build web --release
```

### 本地测试构建结果

构建完成后，可以使用以下命令在本地测试：

```bash
cd build/web
python3 -m http.server 8000
```

然后在浏览器中访问 `http://localhost:8000`。

## 部署到 GitHub Pages

### 自动部署

项目已配置 GitHub Actions 工作流，当你推送代码到 `main` 分支时，会自动构建并部署到 GitHub Pages。

**配置步骤：**

1. 在 GitHub 仓库中，进入 **Settings** > **Pages**
2. 在 **Source** 部分，选择 **GitHub Actions**
3. 确保工作流文件 `.github/workflows/deploy.yml` 已提交到仓库
4. 推送代码到 `main` 分支，工作流会自动触发

### 手动触发部署

你也可以在 GitHub Actions 页面手动触发部署工作流。

### 部署地址

部署成功后，你的应用将可以通过以下地址访问：

- 项目页面：`https://<username>.github.io/<repository-name>/`
- 用户/组织页面：`https://<username>.github.io/`（如果仓库名为 `username.github.io`）

### 注意事项

- GitHub Pages 需要从 `gh-pages` 分支或通过 GitHub Actions 部署
- 如果仓库名不是 `username.github.io`，应用会自动设置正确的 base-href
- 首次部署可能需要几分钟时间
- 确保仓库的 Pages 设置中已启用 GitHub Actions 作为部署源

## 相关资源

- [Flutter 官方文档](https://docs.flutter.dev/)
- [GitHub Pages 文档](https://docs.github.com/pages)
- [GitHub Actions 文档](https://docs.github.com/actions)
