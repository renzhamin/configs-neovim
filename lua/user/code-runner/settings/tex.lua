local M = {}

M.get_run_command = function()
    local build_dir = vim.fn.expand("%:p:h") .. "/build/"
    local filename = vim.fn.expand("%:t:r")
    local pdf_file_path = build_dir .. filename .. ".pdf"
    return "xdg-open " .. pdf_file_path .. " &"
end


return M
