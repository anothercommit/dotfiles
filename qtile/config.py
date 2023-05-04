# import subprocess
# from libqtile import hook
# from libqtile import bar, layout, widget
# from libqtile.config import Click, Drag, Group, Key, KeyChord, Match, Screen
# from libqtile.lazy import lazy

import os
from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy

# My files
from colors import *

browser = "chromium --chromium --force-dark-mode --enable-features=WebUIDarkMode"
terminal = "kitty"
calculadora = "qalculate-gtk"
mod = "mod4"
alt_L = "mod1"
alt_R = "mod5"

# keybindings {{{
keys = [

    # Basic keybindings {{{
    Key([mod], "Return",
        lazy.spawn(terminal),
        desc="Launch terminal"),

    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(),
        desc="Move window focus to other window"),

    Key([mod, "shift"], "h", lazy.layout.shuffle_left(),
        desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(),
        desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(),
        desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(),
        desc="Move window up"),

    Key([mod, "control"], "h", lazy.layout.grow_left(),
        desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(),
        desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(),
        desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(),
        desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(),
        desc="Reset all window sizes"),

    Key([mod, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
        ),

    Key([mod], "Tab", lazy.next_layout(),
        desc="Toggle between layouts"),
    Key([mod, "shift"], "Tab", lazy.prev_layout(),
        desc="Toggle between layouts"),
    Key([mod], "w", lazy.window.kill(),
        desc="Kill focused window"),
    Key([mod, "control"], "r", lazy.reload_config(),
        desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(),
        desc="Shutdown Qtile"),
    Key([mod], "r", lazy.spawncmd(),
        desc="Spawn a command using a prompt widget"),
    Key([mod, "control", "shift"], "r",
        lazy.spawn(["sh", "-c", "sudo reboot now"])),

    Key([mod], "m",
        lazy.layout.maximize(),
        desc='toggle window between minimum and maximum sizes'
        ),

    Key([mod, "shift"], "f",
        lazy.window.toggle_floating(),
        desc='toggle floating'
        ),

    Key([mod], "f",
        lazy.window.toggle_fullscreen(),
        desc='toggle fullscreen'
        ),

    Key([alt_L], "space", lazy.widget["keyboardlayout"].next_keyboard(),
        desc="Next keyboard layout."),

    Key([alt_R], "space", lazy.widget["keyboardlayout"].next_keyboard(),
        desc="Next keyboard layout."),

    # }}}

    # Run / Launch {{{

    Key(["control"], "space",
        lazy.spawn("rofi -show drun")
        ),

    Key([alt_L, mod], "c",
        lazy.spawn(terminal + " -e qalc")
        ),

    Key([alt_L, "shift"], "c",
        lazy.spawn(calculadora)
        ),

    Key([alt_L, "shift"], "b",
        lazy.spawn(browser),
        desc="Abre an internet browser"
        ),

    Key([alt_L, "shift"], "o",
        lazy.spawn("obsidian"),
        desc="Abre obsidian"
        ),

    Key([alt_L, "shift"], "e",
        lazy.spawn("nautilus"),
        desc="Abre nautilus"
        ),

    Key([alt_L, "shift"], "w",
        lazy.spawn("whatsdesk"),
        desc="Abre whatsapp"
        ),

    Key([mod], "v",
        lazy.spawn("copyq menu")
        ),

    Key([mod, "shift"], "v",
        lazy.spawn("copyq toggle")
        ),

    Key([mod], "p",
        lazy.spawn(terminal+" -e btm -bT"),
        desc="Abre el system monitor (btm)"
        ),

    Key([alt_L, "control"], "q",
        lazy.spawn(terminal+" -e nvim /home/joaco/.config/qtile/config.py"),
        desc="Abre the Qtile config file"
        ),

    Key([mod], "x",
        lazy.spawn("betterlockscreen -l"),
        desc="Abre the Qtile config file"
        ),
    # }}}

    # Audio {{{
    Key([], "XF86AudioMute",
        lazy.spawn("amixer sset Master toggle")),

    Key([], "XF86AudioRaiseVolume",
        lazy.spawn("amixer sset Master 1%+")),

    Key(["shift"], "XF86AudioRaiseVolume",
        lazy.spawn("amixer sset Master 15%+")),

    Key([], "XF86AudioLowerVolume",
        lazy.spawn("amixer sset Master 1%-")),

    Key(["shift"], "XF86AudioLowerVolume",
        lazy.spawn("amixer sset Master 15%-")),

    Key([], "XF86AudioPlay",
        lazy.spawn("playerctl play-pause")),

    Key([], "XF86AudioPrev",
        lazy.spawn("playerctl previous")),

    Key([], "XF86AudioNext",
        lazy.spawn("playerctl next")),
    # }}}

    # Brightness {{{
    Key(["shift"], "F12",
        lazy.spawn("brillo -q -A 5")),

    Key(["shift"], "F11",
        lazy.spawn("brillo -q -U 5")),

    Key([mod, "shift"], "F12",
        lazy.spawn("brillo -q -A 15")),

    Key([mod, "shift"], "F11",
        lazy.spawn("brillo -q -U 15")),

    Key([], "XF86MonBrightnessUp",
        lazy.spawn("brillo -q -A 5")),

    Key([], "XF86MonBrightnessDown",
        lazy.spawn("brillo -q -U 5")),

    Key(["shift"], "XF86MonBrightnessUp",
        lazy.spawn("brillo -q -A 15")),

    Key(["shift"], "XF86MonBrightnessDown",
        lazy.spawn("brillo -q -U 15")),
    # }}}

    # Screenshot {{{
    Key([], "Print",
            lazy.spawn(["sh", "-c", "maim | xclip -selection clipboard -t image/png"])),

    Key(["shift"], "Print",
        lazy.spawn(["sh", "-c", "maim -s | xclip -selection clipboard -t image/png"])),

    Key([mod], "Print",
        lazy.spawn(["sh", "-c", "maim /home/joaco/Media/Imagenes/Capturas/$(date +%s).jpg"])),

    Key([mod, "shift"], "Print",
 j      lazy.spawn(["sh", "-c", "maim -s /home/joaco/Media/Imagenes/Capturas/$(date +%s).jpg"])),
    # }}}
]
# }}}

groups = [Group(i) for i in "123456789"]

for i in groups:
    keys.extend(
        [
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(
                    i.name),
            ),
        ]
    )

# groups = [Group("1", layout='max', label='󱓻'),
#           Group("2", layout='bsp', label='󱓻'),
#           Group("3", layout='bsp', label='󱓻'),
#           Group("4", layout='bsp', label='󱓻'),
#           Group("5", layout='bsp', label='󱓻'),
#           Group("6", layout='bsp', label='󱓻')]

groups = [Group("1", layout='max', label='1'),
          Group("2", layout='bsp', label='2'),
          Group("3", layout='bsp', label='3'),
          Group("4", layout='bsp', label='4'),
          Group("5", layout='bsp', label='5'),
          Group("6", layout='bsp', label='6')]

tiling_theme = {
    "border_focus": "#66C",
    "border_width": 2,
    "border_on_single": False,
    "margin_on_single": False,
    "margin": 0,
}

normal_theme = {
        "border_width": 0,
        "margin": 0
}


layouts = [
    layout.Bsp(**tiling_theme),
    layout.Max(**normal_theme),
    layout.Floating(**tiling_theme),
]
# }}}

widget_defaults = dict(
    font="JetBrainsMono Nerd Font ExtraBold",
    fontsize=12,
    foreground="#DDD",
    padding=8,
)
extension_defaults = widget_defaults.copy()

screens = [
    # Main {{{
    Screen(
        top=bar.Bar(
            [
                widget.CurrentLayoutIcon(
                    scale=0.8
                    ),

                widget.Sep(
                    padding=20
                ),

                widget.TextBox(
                    text="",
                    fontsize=18,
                    # foreground=neon_mclaren[1][6],
                    mouse_callbacks={'Button1': lazy.spawn(
                        ["sh", "-c", "systemctl poweroff"])}
                ),

                widget.TextBox(
                    text="",
                    fontsize=18,
                    # foreground=neon_mclaren[1][6],
                    mouse_callbacks={'Button1': lazy.spawn(
                        ["sh", "-c", "systemctl reboot"])}
                ),

                widget.TextBox(
                    text="",
                    fontsize=18,
                    # foreground=neon_mclaren[1][6],
                    mouse_callbacks={'Button1': lazy.spawn(
                        ["sh", "-c", "systemctl suspend"])}
                ),
                
                widget.Sep(
                    padding=20
                    ),

                widget.TextBox(
                    text="ﮮ",
                    fontsize=22,
                    # foreground=neon_mclaren[1][6],
                    mouse_callbacks={"Button1": lazy.spawn(
                        terminal+" -e topgrade --skip-notify")}
                ),

                widget.Spacer(),

                widget.GroupBox(
                    highlight_method='block',
                    disable_drag=True,
                    borderwidth=6,
                ),


                widget.Prompt(),

                widget.Spacer(),

                widget.Systray(),

                widget.TextBox(
                    text="󰁹",
                    foreground="#66C",#neon_mclaren[0][2],
                    fontsize=18
                ),

                widget.Battery(
                    format='{char} {percent:2.0%}',
                    charge_char="",
                    discharge_char=""
                ),

                widget.TextBox(
                    text="墳",
                    fontsize=18,
                    foreground="#66C",#neon_mclaren[0][2],
                    mouse_callbacks={"Button1": lazy.spawn("pavucontrol")}
                ),

                widget.Volume(),

                widget.TextBox(
                    text="",
                    fontsize=18,
                    foreground="#66C",#neon_mclaren[0][2],
                ),

                widget.Clock(
                    format="%d/%m — %H:%M",
                ),

                widget.TextBox(
                    text="",
                    fontsize=18,
                    foreground="#66C",#neon_mclaren[0][2],
                ),

                widget.KeyboardLayout(
                    configured_keyboards=['us', 'es'],
                    foreground=neon_mclaren[1][2],
                    fontsize=16,
                ),
            ],
            30,
            opacity=1,
            background="#000000"
        ),
    ),
    # }}}
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)

auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

wmname = "LG3D"
