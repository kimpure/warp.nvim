# warp.nvim
warp.nvim was created to wrap characters


https://github.com/user-attachments/assets/445da3d5-7040-40e1-8196-975786c6b52c

https://github.com/user-attachments/assets/705efc32-e34b-49c6-b7eb-d3a31ed0c6eb

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
### [setup](https://github.com/kimpure/nvim/blob/main/lua/plugins/nvim-warp.lua)
### [mapping](https://github.com/kimpure/nvim/blob/main/lua/config/keymaps/plugins/nvim-warp.lua)



