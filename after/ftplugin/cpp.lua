local ok, config = pcall(require, "user.code-runner.settings.cpp")

if ok then
    vim.keymap.set('n', '<F60>', config.precompile_dbg, { desc = "precompile macro-dbg" }) -- A-F12
end
