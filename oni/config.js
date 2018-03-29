"use strict";
exports.__esModule = true;
exports.activate = function (oni) {
    console.log("config activated");
    // Input
    //
    // Add input bindings here:
    //
    // oni.input.bind("<c-enter>", () => console.log("Control+Enter was pressed"))
    //
    // Or remove the default bindings here by uncommenting the below line:
    //
    // oni.input.unbind("<c-p>")
};
exports.deactivate = function (oni) {
    console.log("config deactivated");
};
exports.configuration = {
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
    "language.go.languageServer.arguments": ["--gocodecompletion", "--freeosmemory", "false"]
};
