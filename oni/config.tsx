import * as React from "/Applications/Oni.app/Contents/Resources/app/node_modules/react"
import * as Oni from "/Applications/Oni.app/Contents/Resources/app/node_modules/oni-api"

export const activate = (oni: Oni.Plugin.Api) => {
    console.log("config activated")

    // Input
    //
    // Add input bindings here:
    //
    // oni.input.bind("<c-enter>", () => console.log("Control+Enter was pressed"))

    //
    // Or remove the default bindings here by uncommenting the below line:
    //
    // oni.input.unbind("<c-p>")

}

export const deactivate = (oni: Oni.Plugin.Api) => {
    console.log("config deactivated")
}

export const configuration = {
    // Vim configs
    "oni.useDefaultConfig": true,
    "oni.loadInitVim": true,

    // Appearance 
    "ui.colorscheme": "onedark",
    "editor.fontSize": "13px",
    "editor.fontFamily": "Fira Code",
    "sidebar.enabled": false,
    "ui.animations.enabled": true,
    "ui.fontSmoothing": "auto",

    // Workspace
    "oni.bookmarks": ["~/work/", "~/sseg/"],

    // Languages
    "language.go.languageServer.rootFiles": [".git"],
    "language.go.languageServer.command": ["go-langserver"],
    "language.go.languageServer.arguments": ["--gocodecompletion", "--freeosmemory", "false"],
    
    "language.python.languageServer.command": ["pyls"],
    "language.python.languageServer.arguments": ["-vv", "python"],
}
