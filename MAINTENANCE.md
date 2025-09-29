# Neovim Configuration Maintenance Guide

This guide helps you maintain and update your Neovim configuration.

## 🔄 Regular Maintenance Tasks

### Weekly
- [ ] Check for plugin updates: `:Lazy update`
- [ ] Review startup time: `:StartupTime`
- [ ] Test key mappings for conflicts

### Monthly
- [ ] Update Neovim: `brew upgrade neovim` (macOS)
- [ ] Clean unused plugins: `:Lazy clean`
- [ ] Review and update LSP servers: `:Mason`
- [ ] Check for configuration drift

### Quarterly
- [ ] Audit plugin usage and remove unused ones
- [ ] Update documentation
- [ ] Review and optimize performance
- [ ] Test with new Neovim versions

## 🧹 Cleaning Up

### Remove Unused Plugins
1. Identify unused plugins:
   ```bash
   # Check which plugins are actually loaded
   :Lazy
   ```

2. Remove from configuration:
   ```bash
   # Delete the plugin file
   rm lua/custom/plugins/unused-plugin.lua
   ```

3. Clean up:
   ```bash
   :Lazy clean
   ```

### Reset Configuration
If you need to start fresh:
```bash
# Backup current config
mv ~/.config/nvim ~/.config/nvim-backup

# Reinstall from scratch
git clone <your-repo> ~/.config/nvim
```

## 🔧 Common Fixes

### Plugin Issues
```bash
# Reset all plugins
:Lazy reset

# Update specific plugin
:Lazy update <plugin-name>

# Check plugin status
:Lazy health
```

### LSP Issues
```bash
# Reinstall LSP servers
:Mason
# Select and reinstall problematic servers

# Check LSP status
:LspInfo
```

### Performance Issues
```bash
# Check startup time
:StartupTime

# Profile specific functions
:profile start profile.log
:profile func *
:profile file *
# ... use Neovim ...
:profile pause
:noautocmd qall!
```

## 📊 Monitoring

### Startup Performance
```bash
# Check startup time
:StartupTime

# Check which plugins are slow
:Lazy profile
```

### Memory Usage
```bash
# Check memory usage
:lua print(vim.inspect(vim.loop.get_memory()))
```

### Plugin Health
```bash
# Check all plugins
:Lazy health

# Check specific plugin
:Lazy health <plugin-name>
```

## 🚨 Troubleshooting

### Configuration Not Loading
1. Check syntax: `nvim --check-config`
2. Check for errors: `:messages`
3. Reset to defaults: `nvim -u NONE`

### Plugin Conflicts
1. Disable plugins one by one
2. Check keymap conflicts: `:map <key>`
3. Use `:verbose map <key>` to see where mappings come from

### LSP Not Working
1. Check LSP status: `:LspInfo`
2. Check Mason: `:Mason`
3. Check logs: `:LspLog`

## 📝 Configuration Management

### Version Control
```bash
# Commit changes
git add .
git commit -m "Update configuration"

# Push changes
git push origin main
```

### Backup Strategy
```bash
# Create backup
cp -r ~/.config/nvim ~/.config/nvim-backup-$(date +%Y%m%d)

# Restore from backup
rm -rf ~/.config/nvim
mv ~/.config/nvim-backup-20240101 ~/.config/nvim
```

### Environment-Specific Configs
```lua
-- In init.lua, add environment detection
local is_windows = vim.loop.os_uname().sysname == "Windows_NT"
local is_mac = vim.loop.os_uname().sysname == "Darwin"

if is_windows then
  -- Windows-specific config
elseif is_mac then
  -- macOS-specific config
end
```

## 🔍 Debugging

### Enable Debug Mode
```lua
-- Add to init.lua for debugging
vim.lsp.set_log_level("debug")
vim.g.lsp_log_verbose = true
```

### Log Files
- LSP logs: `~/.local/state/nvim/lsp.log`
- Neovim logs: `~/.local/state/nvim/log/`
- Plugin logs: Check individual plugin documentation

### Common Debug Commands
```bash
# Check Neovim version
:version

# Check Lua version
:lua print(_VERSION)

# Check plugin versions
:Lazy

# Check LSP capabilities
:LspInfo
```

## 📈 Optimization

### Startup Optimization
1. Use lazy loading for plugins
2. Disable unused built-in plugins
3. Minimize autocmds
4. Use `impatient.nvim` for faster startup

### Runtime Optimization
1. Use `vim.schedule()` for heavy operations
2. Avoid blocking operations
3. Use proper event triggers
4. Cache expensive computations

### Memory Optimization
1. Unload unused buffers
2. Use `vim.g` sparingly
3. Clean up autocmds
4. Use proper plugin lazy loading

## 🆘 Emergency Recovery

### Configuration Corrupted
```bash
# Reset to working state
git checkout HEAD -- ~/.config/nvim/

# Or restore from backup
cp -r ~/.config/nvim-backup/* ~/.config/nvim/
```

### Plugins Broken
```bash
# Reset all plugins
:Lazy reset

# Or remove and reinstall
rm -rf ~/.local/share/nvim/lazy
:Lazy sync
```

### Neovim Won't Start
```bash
# Start with minimal config
nvim -u NONE

# Start with specific config
nvim -u ~/.config/nvim/init.lua

# Check for syntax errors
nvim --check-config
```

## 📚 Resources

- [Neovim Documentation](https://neovim.io/doc/)
- [Lazy.nvim Documentation](https://github.com/folke/lazy.nvim)
- [LSP Configuration](https://github.com/neovim/nvim-lspconfig)
- [Telescope Documentation](https://github.com/nvim-telescope/telescope.nvim)

---

**Remember**: Always test changes in a separate Neovim instance before applying to your main configuration!
