local wezterm = require('wezterm');

return {
    default_prog = {"/bin/zsh", "-l", "-c", "tmux attach || tmux"},
    font = wezterm.font("JetBrains Mono"),
    color_scheme = "Overnight Slumber",

    cursor_blink_rate = 800,
    text_blink_rate = 800,
    text_blink_rate_rapid = 250,
    audible_bell = "Disabled",
    swallow_mouse_click_on_pane_focus = true,

    enable_tab_bar = false,
    tab_and_split_indices_are_zero_based = true,

    window_padding = {
        left = 8,
        right = 8,
        top = 8,
        bottom = 8,
    },
}
