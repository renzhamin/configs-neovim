local opt = vim.opt


local options = {
    tabstop = 4,
    shiftwidth = 4,
    expandtab = true,
    smartindent = true,

    wildmenu = true,
    hidden = true,
    scrolloff=8,
    mouse="a",
    nu = true,
    rnu = true,
    guicursor = "",
    termguicolors = true,
    ignorecase = true,
    smartcase = true,

    splitbelow = true,
    splitright = true,

    equalalways = false,
    shell = "zsh",

    statusline = "%M %r %f %= [%{getcwd()}] [%n] %p%%"
}


for k,v in pairs(options) do
    opt[k] = v
end
