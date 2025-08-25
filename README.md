# warp.nvim
warp.nvim was created to wrap characters

![](./assets/preview.gif)

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

