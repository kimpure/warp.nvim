> [!IMPORTANT]
> **This repository is archived.**
> Please use upgraded version for [defend.nvim](https://github.com/yaeju1205/defend.nvim)

# warp.nvim
warp.nvim was created to wrap characters

https://github.com/user-attachments/assets/33ea1107-3dad-470a-b46c-e52ca7a8de2c

## Installation
lazy.nvim
```lua
{
    "kimpure/warp.nvim",
    opts = {
        default = { "(", ")" },
        use_default_keymap = true, 
    }
}
```

setup
```lua
require"warp".setup {
    default = { "(", ")" },
    use_default_keymap = true, 
}
```

## Configuratiom
```luau
{
    --// ex. { "{", "}" }
    --// a, b, c -> {a, b, c}
    
    --// ex. { '"' }
    --// a, b, c -> "a, b, c"

    default: { string, string? }

    --//vim.keymap.set("v", "'", "<CMD>WarpVisual '<CR>")
    --//vim.keymap.set("v", '"', '<CMD>WarpVisual "<CR>')
    --//vim.keymap.set("v", "(", "<CMD>WarpVisual ( )<CR>")
    --//vim.keymap.set("v", "{", "<CMD>WarpVisual { }<CR>")
    --//vim.keymap.set("v", "[", "<CMD>WarpVisual [ ]<CR>")
    use_default_keymap = true, 
}
```

