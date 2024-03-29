local M = {}

M.vim_options = {
    tabstop = 4,
    shiftwidth = 4,
    expandtab = true,
    smartindent = true,

    wildmenu = true,
    hidden = true,
    scrolloff = 8,
    mouse = "a",
    nu = true,
    rnu = true,
    termguicolors = true,
    ignorecase = true,
    smartcase = true,

    splitbelow = true,
    splitright = true,

    equalalways = false,

    statusline = "%M %r %f %= [%n] %p%%",

    winminwidth = 0,
    winminheight = 0,
}

if vim.fn.has('unix') == 1 and vim.fn.executable('zsh') == 1 then
    M.vim_options.shell = "zsh"
end

M.custom_options = {
    main_win_size = 80,
}


return M
