# warp.nvim
warp.nvim was created to wrap characters

![](./assets/preview.mp4)

## Installation
lazy.nvim
```
{
    "kimpure/warp.nvim",
    opts = {
        default = { "" },
    }
}
```

setup
```
require"warp".setup {
    default = { "" },
}
```

## Configuratiom
{
    --// ex. { "{", "}" }
    --// a, b, c -> {a, b, c}
    
    --// ex. { '"' }
    --// a, b, c -> "a, b, c"

    default: { string, string? }
}

## examples
[kimpure/nvim](https://github.com/kimpure/nvim)
### [setup](https://github.com/kimpure/nvim/blob/main/lua/plugins/nvim-warp.lua)
### [mapping](https://github.com/kimpure/nvim/blob/main/lua/config/keymaps/plugins/nvim-warp.lua)

