local wezterm = require('wezterm');

return {
    default_prog = {"/bin/zsh", "-l", "-c", "tmux attach || tmux"},
    font = wezterm.font("JetBrains Mono"),
    color_scheme = "AdventureTime",
    cursor_blink_rate = 800,
    text_blink_rate = 800,
    text_blink_rate_rapid = 250,
    audible_bell = "Disabled",
    swallow_mouse_click_on_pane_focus = true,
    tab_and_split_indices_are_zero_based = true,
    --[[
    colors = {
        foreground = "#fae2cc",
        background = "#1d1d3f",
        cursor_fg = "#1c1c1c",
        --cursor_bg = "#fae2cc",
        cursor_border = "#7a6fa4",
        cursor_bg = "#fae2cc",
        selection_fg = "#fae2cc",
        selection_bg = "#7a6fa4",
        ansi = {
            "#040303", -- black
            "#cb1c17", -- red
            "#57bb1e", -- green
            "#ee8826", -- yellow
            "#0e62d1", -- blue
            "#7a6fa4", -- magenta
            "#81b3a8", -- cyan
            "#fae2cc", -- white
        },
        brights = {
            "#6090cb", -- black
            "#ff776d", -- red
            "#abfb81", -- green
            "#f3ca20", -- yellow
            "#11a7d1", -- blue
            "#ac6e65", -- magenta
            "#d1faf6", -- cyan
            "#f8f7fc", -- white
        },
    },
    --]]
}

