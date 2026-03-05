VAULT_PATH="$HOME/Documents/Obsidian"
MESSAGE="${1:-Auto sync from $(date '+%Y-%m-%d %H:%M')}"

cd "$VAULT_PATH" || exit

echo "📝 开始同步 Obsidian Vault..."

git add .
git status --porcelain

if [ $? -eq 0 ]; then
    git commit -m "$MESSAGE"
    git push origin main
    echo "✅ 同步完成！"
else
    echo "❌ 没有需要提交的更改"
fi