return {
    settings = {
        texlab = {
            bibtexFormatter = "texlab",
            build = {
                args = {
                    "-X", "compile", "%f",
                    "--outdir", "build",
                    "--synctex",
                    "--keep-logs",
                    "--keep-intermediates",
                    "-Z", "shell-escape" },
                executable = "tectonic",
                forwardSearchAfter = false,
                onSave = false
            },
            chktex = {
                onEdit = false,
                onOpenAndSave = false
            },
            diagnosticsDelay = 300,
            formatterLineLength = 80,
            forwardSearch = {
                args = {}
            },
            latexFormatter = "latexindent",
            latexindent = {
                modifyLineBreaks = false
            }
        }
    }
}
