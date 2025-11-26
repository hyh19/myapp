#!/bin/bash

# Flutter Web 构建脚本
# 用于本地构建和测试

set -e

echo "🚀 开始构建 Flutter Web 应用..."

# 清理旧的构建文件
echo "🧹 清理旧的构建文件..."
flutter clean

# 获取依赖
echo "📦 获取依赖..."
flutter pub get

# 构建 Web 应用
echo "🔨 构建 Web 应用..."
flutter build web --release

echo "✅ 构建完成！"
echo "📁 构建输出目录: build/web"
echo ""
echo "💡 提示: 可以使用以下命令本地测试："
echo "   cd build/web && python3 -m http.server 8000"
echo "   然后在浏览器中访问 http://localhost:8000"

