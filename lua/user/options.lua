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
    shell = "zsh",

    statusline = "%M %r %f %= [%{getcwd()}] [%n] %p%%",

    winminwidth = 0,
    winminheight = 0,
}

M.custom_options = {
    main_win_size = 80,
}


return M
