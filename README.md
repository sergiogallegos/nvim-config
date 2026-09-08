# Neovim configuration

A compact Rust-first setup with Python and TypeScript support. Requires Neovim
0.12+ (tested on 0.12.5), Git, a C compiler and make for native plugins/parsers,
tree-sitter CLI 0.26.1+ (`brew install tree-sitter-cli` on macOS),
Node.js/npm for TypeScript and Prettier, and ripgrep for searching file contents.
Use a Nerd Font if you want file icons.

## Languages and formatting

| Language | Language server | Formatting |
| --- | --- | --- |
| Rust | rustaceanvim / rust-analyzer with Clippy checks | rustfmt from your Rust toolchain |
| Python | Pyright for types; Ruff for linting | Ruff import sorting, then formatting |
| TypeScript / JavaScript / TSX | ts_ls | Prettier (project-local installation preferred) |
| Lua | lua_ls | StyLua |
| TOML | taplo | Taplo |

Mason installs the language servers. mason-tool-installer installs missing
Prettier, StyLua, and CodeLLDB executables without automatically upgrading existing versions.
Run `:MasonToolsInstall` to retry formatter installation, and `:Mason` to inspect
language servers. Rust tools are managed by rustup:

```sh
rustup component add rust-src rustfmt clippy
```

Formatting runs on save; `Space =` formats manually, including visual selections.
`:ConformInfo` shows which executable is selected. Project-local Prettier takes
precedence over the Mason fallback; keep Prettier in each TypeScript project's
devDependencies to match its team's version and configuration. ESLint is not
configured globally. C/C++ formatting on save remains disabled.

Launch Neovim from the project directory. Activate your Python virtual environment
before launching, or use `:LspPyrightSetPythonPath /path/to/.venv/bin/python`.
Project `pyproject.toml`, Ruff configuration, and TypeScript `tsconfig.json` remain
the source of project-specific rules. TypeScript workspace detection uses the
nearest package-manager lockfile or Git root, falling back to the working directory.

## Navigation

The leader key is Space. These shortcuts work in normal mode:

| Shortcut | Action |
| --- | --- |
| `Space f` / `Ctrl-p` | Find project files |
| `Space /` | Search text in the current project |
| `Space O` | Recent files in the current project |
| `Space F` / `Space G` | Find files / search text in the working directory |
| `Space b` | Pick an open buffer |
| `-` / `Space e` | Browse the current file's directory with Oil |
| `Shift-h` / `Shift-l` | Previous / next open buffer |
| `[b` / `]b` | Previous / next open buffer |
| `Space Space` | Switch to the last buffer |
| `Space B` | Close buffer; refuse if it contains unsaved changes |
| `Space ma` | Add current file to Harpoon |
| `Space mm` | Show Harpoon's saved files |
| `Space m1`–`Space m4` | Jump to a saved file |
| `Ctrl-h/j/k/l` | Move between split windows |
| `Space wv` / `Space ws` | Vertical / horizontal split |
| `gd` / `gr` / `gi` | Definition / references / implementation |
| `Space s` / `Space S` | Document / workspace symbols |

In Telescope, type to filter, press Enter to open, or Ctrl-v / Ctrl-x to open in
a vertical / horizontal split. In Oil, Enter opens a file or directory, `-` goes
up a directory, and `g.` toggles hidden files. Oil keeps `Ctrl-p` and `Ctrl-h/j/k/l` available for file and window navigation.
Use `gV` / `gS` to open vertical / horizontal splits, `gp` for preview, and `gR` to refresh.
Project search uses the current file or Oil directory: nearest Git/Hg repository,
then nearest language project marker, then that directory. This includes sibling
crates in a repository without changing cwd. Working-directory searches remain
available with `Space F` / `Space G`.

## Editing

- `K` / `Space k`: hover documentation; `Space ls`: signature help.
- `Space r`: rename a symbol; `Space a`: code actions.
- `[d` / `]d`: previous / next diagnostic with its message.
- `Space xx` / `Space xd`: workspace / document diagnostics in Trouble.
- `gcc` / `gc`: built-in line / selection commenting.
- `sa`, `sd`, `sr`: add, delete, replace surrounding delimiters.
- `Space W`: save; `Space q`: quit; `Space u`: undo tree.
- `Space gs`: Git status; `Space z`: Zen Mode.
- `Space on`, `Space or`, `Space ow`: toggle numbers, relative numbers, wrapping.

Bufferline appears when multiple buffers are open. Its close buttons refuse to
discard unsaved edits. Saving does not blindly strip trailing whitespace from
strings, Markdown hard breaks, or files without a formatter.

## Appearance

Dark mode uses **Gruvbox**; light mode uses the custom `emacs-default` palette.
macOS appearance is checked on startup, focus, and every two seconds.
`:AppearanceSync` refreshes it manually. To force dark mode:

```sh
NVIM_APPEARANCE=dark nvim
```

The background is opaque by default; `Space ct` toggles transparency.

## Maintenance

`:Lazy` manages plugins, `:Mason` manages external tools, and `:checkhealth`
provides diagnostics. Keep `lazy-lock.json` for reproducible plugin versions.
Treesitter uses the current `main` API and installs matching parsers and queries
under Neovim’s data directory. Run `:TSUpdate` after updating it. Syntax highlighting
and indentation attach by filetype. `Ctrl-Space` starts Flash syntax selection;
repeat `Ctrl-Space` to expand, Backspace to shrink. Normal find/search motions
remain unchanged. No legacy Treesitter configuration is used.

The selected parsers cover Rust, Python, TypeScript/TSX, JavaScript, Lua, Vim,
Markdown, JSON, YAML, TOML, and Bash. Additional servers/parsers can be added when
needed; previously installed tools are not uninstalled by this cleanup.

## Rust tools and editing improvements

rustaceanvim is the sole Rust LSP owner. Mason installs rust-analyzer but does not
start a second client. Default Clippy checks remain enabled; feature selection
is left to project settings (`rust-analyzer.json`).

| Shortcut | Action |
| --- | --- |
| `Space Rr` | Select a runnable target |
| `Space Rt` | Select and run tests |
| `Space Rm` | Expand the macro under the cursor |
| `Space Re` | Explain a Rust error |
| `Space Ra` | Rust-specific grouped code actions |
| `Space Rd` | Select a debug target |
| `F9` | Toggle breakpoint |
| `F5` | Continue debugging |
| `F10` / `F11` / `F12` | Step over / into / out |
| `Space oh` | Toggle inlay hints for the current buffer |
| `gy` | Go to type definition |
| `[q` / `]q` | Previous / next quickfix item |

CodeLLDB and nvim-dap provide debugging without a permanent debug sidebar.
`:DapTerminate` ends a session; `:lua require('dap').repl.open()` opens its console.
Cargo.toml loads crates.nvim for dependency versions, completion, and actions.
`:lua require('crates').show_popup()` shows details for the dependency under the
cursor; `:lua require('crates').update_crate()` applies a compatible version update
on request. Dependency files are not automatically upgraded.

Undo history persists across restarts, and reopening a file restores the last
cursor position (except commit messages). The diagnostic column stays reserved.
Completion loads on the first insert **or command-line** entry and uses Neovim's
native snippets: Tab / Shift-Tab navigate snippet fields or completion entries.
LuaSnip and its build step are no longer required. Pause after a shortcut prefix
such as `Space R` to see which-key's available actions.
