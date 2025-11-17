# warp.nvim
warp.nvim was created to wrap characters

https://github.com/user-attachments/assets/9e02ff9c-ccc0-417a-be20-09050192ff45


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

