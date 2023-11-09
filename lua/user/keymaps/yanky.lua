local ks = vim.keymap.set

ks({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
ks({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
ks({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
ks({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")


ks("n", "<c-n>", "<Plug>(YankyCycleForward)")
ks("n", "<c-p>", "<Plug>(YankyCycleBackward)")
