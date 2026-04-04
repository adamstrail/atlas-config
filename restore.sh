#!/bin/bash
# Atlas Config Restore Script
# Run this on a new machine after cloning the repo

echo "🦞 Atlas Config Restore"
echo "========================"
echo ""

# Check if openclaw.json exists
if [ -f ~/.openclaw/openclaw.json ]; then
  echo "⚠️  openclaw.json already exists. Backing up..."
  cp ~/.openclaw/openclaw.json ~/.openclaw/openclaw.json.bak.$(date +%s)
fi

# Copy template
echo "📋 Copying config template..."
cp openclaw-template.json ~/.openclaw/openclaw.json

# Count replacements
count=$(grep -c '__REPLACE_ME__' ~/.openclaw/openclaw.json)
echo ""
echo "🔐 Found $count fields that need your actual secrets:"
grep '__REPLACE_ME__' ~/.openclaw/openclaw.json | head -10
echo ""
echo "📝 Edit the file and replace all __REPLACE_ME__ values:"
echo "   vim ~/.openclaw/openclaw.json"
echo ""
echo "Then restart:"
echo "   openclaw gateway restart"
