# warp.nvim
warp.nvim was created to wrap characters

https://github.com/user-attachments/assets/71383593-91cf-4925-bc9d-cb944ea46c3a

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

