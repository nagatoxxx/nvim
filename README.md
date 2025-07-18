# nvim
simple nvim configuration written in Lua

to restore default catppuccin colors:
remove `color_overrides` section in `lua/plugins/configs/catppuccin.lua`

```
    color_overrides = {
        mocha = {
            surface0 = "#313131",
            surface1 = "#454545",

            base = "#222222",
            mantle = "#191919",
            crust = "#111111",
        },
    }
```
