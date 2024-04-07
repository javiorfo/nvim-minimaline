# nvim-minimaline
### Neovim minimal statusline written in Lua
*nvim-minimaline is a Neovim statusline centered on icons and minimal configuration.*

## Caveats
- Integration with `git` and `LSP`
- This plugin has been developed on and for Linux following open source philosophies.

## Installation
`Packer`
```lua
use {
    'javiorfo/nvim-minimaline',

    -- Optional (only if you want file icons in the statusline)
    requires = 'nvim-tree/nvim-web-devicons'
}
```
`Lazy`
```lua
{
     "javiorfo/nvim-minimaline",
     lazy = false,

     -- Optional (only if you want file icons in the statusline)
     dependencies = { "nvim-tree/nvim-web-devicons" },

     config = function()
         -- Default init. For further configuration read below
         require'minimaline'.setup {}
     end
}
```

### Configuration
- Set up in *init.lua* if Packer is used. If Lazy is used, put this in the *config* function.
```lua
require'minimaline'.setup {
    -- Disable minimaline in the following filetypes (default is empty table)
    disabled_filetypes = { "NvimTree*" },

    -- Enable or disable colors on LSP diagnostics (default is false)
    lsp_colors_enabled = true,

    -- Set minimaline colors
    -- Use 256 Xterm colors
    -- foreground is "fg", background is "bg" and additionally "gui" could contain "bold", "italic" or combination "bold,italic"
    -- Set only one option is possible (only fg or only bg, etc)
    style = { fg = 15, bg = 0 }
}
```

# Format
| MODE | GIT BRANCH | LSP DIAGNOSTICS | BUF_NAME BUF_NR -> STATE | LINE_NR/TOTAL_LINES COL_NR | ENCODING |
| ---- | ---- | ---- | ---- | ---- | ---- |

<img src="https://github.com/javiorfo/img/blob/master/nvim-minimaline/minimaline-modes.png?raw=true" alt="modes" />
<img src="https://github.com/javiorfo/img/blob/master/nvim-minimaline/minimaline-buffers.png?raw=true" alt="buffers" />

## Screenshots
<img src="https://github.com/javiorfo/img/blob/master/nvim-minimaline/minimaline1.png?raw=true" alt="minimaline1" />

<img src="https://github.com/javiorfo/img/blob/master/nvim-minimaline/minimaline2.png?raw=true" alt="minimaline2" />

<img src="https://github.com/javiorfo/img/blob/master/nvim-minimaline/minimaline3.png?raw=true" alt="minimaline3" />

<img src="https://github.com/javiorfo/img/blob/master/nvim-minimaline/minimaline4.png?raw=true" alt="minimaline4" />

---

### Donate
- **Bitcoin** [(QR)](https://raw.githubusercontent.com/javiorfo/img/master/crypto/bitcoin.png)  `1GqdJ63RDPE4eJKujHi166FAyigvHu5R7v`
- [Paypal](https://www.paypal.com/donate/?hosted_button_id=FA7SGLSCT2H8G)
