# warp.nvim
warp.nvim was created to wrap characters

https://github.com/user-attachments/assets/9e02ff9c-ccc0-417a-be20-09050192ff45



## Installation
lazy.nvim
```lua
{
    "kimpure/warp.nvim",
    opts = {
        default = { "" },
    }
}
```

setup
```lua
require"warp".setup {
    default = { "" },
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
}
```

## examples
[kimpure/nvim](https://github.com/kimpure/nvim)
### [setup](https://github.com/kimpure/nvim/blob/before/lua/plugins/nvim-warp.lua)
### [mapping](https://github.com/kimpure/nvim/blob/before/lua/config/keymaps/plugins/nvim-warp.lua)
