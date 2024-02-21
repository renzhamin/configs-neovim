local function toggle_compile_onsave()
    local off, _ = pcall(vim.api.nvim_del_augroup_by_name, "CompileTexOnSave")
    if not off then
        local group = vim.api.nvim_create_augroup("CompileTexOnSave", {})
        vim.api.nvim_create_autocmd("BufWritePost", {
            pattern = { "*.tex", "*.latex" },
            command = "TexlabBuild",
            group = group
        })
    end
end

vim.api.nvim_create_user_command("TexCompileOnSaveToggle", toggle_compile_onsave, {})
