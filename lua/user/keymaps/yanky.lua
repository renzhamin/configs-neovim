local ks = vim.keymap.set

ks({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
ks({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
ks({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
ks({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")


ks("n", "<c-n>", "<Plug>(YankyCycleForward)")
ks("n", "<c-p>", "<Plug>(YankyCycleBackward)")

ks("n", "]p", "<Plug>(YankyPutIndentAfterLinewise)")
ks("n", "[p", "<Plug>(YankyPutIndentBeforeLinewise)")

ks("n", "=p", "<Plug>(YankyPutAfterFilter)")
ks("n", "=P", "<Plug>(YankyPutBeforeFilter)")

-- Paste from system clipboard
ks("n", "<Leader>p", '"+<Plug>(YankyPutAfterFilter)')
ks("n", "<Leader>P", '"+<Plug>(YankyPutBeforeFilter)')
