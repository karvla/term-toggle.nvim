# term-toggle.nvim

A simple Neovim plugin to toggle between an editor and terminal buffer.

## Installation

**Using [packer.nvim](https://github.com/wbthomason/packer.nvim):**

```lua
use {
  'term-toggle.nvim',
  config = function()
    require('term-toggle').setup({
      toggle_terminal = '<C-t>' -- Customize keybinding
    })
  end
}
```

**Using [lazy.nvim](https://github.com/folke/lazy.nvim):**

```lua
lazy.setup {
  {'karvla/term-toggle.nvim', config = function()
    require('term-toggle').setup({
      toggle_terminal = '<C-t>' -- Customize keybinding
    })
  end}
}
```

## Usage

Toggle between your editor and terminal buffer using the configured keybinding.
