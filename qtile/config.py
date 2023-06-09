# Imports {{{
import os
import subprocess
from libqtile import hook
from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, KeyChord, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

# My files 
from colors import *
# }}}

music_service = "spotify-launcher"
browser = "chromium --chromium --force-dark-mode --enable-features=WebUIDarkMode"
file_explorer = "lf"
terminal = "alacritty"
mod = "mod4"
alt = "mod1"

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
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),

    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),

    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),

    Key([mod, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
        ),

    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod, "shift"], "Tab", lazy.prev_layout(), desc="Toggle between layouts"),
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),
    Key([mod,"control", "shift"], "r",
            lazy.spawn(["sh", "-c", "sudo reboot now"])),

    Key(["control"], "space", lazy.widget["keyboardlayout"].next_keyboard(), desc="Next keyboard layout."),

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
# }}}

# Run / Launch {{{
    # Programs and apps
    Key([alt, "shift"], "space",
        lazy.spawn("rofi -show drun")
    ),

    Key([alt, "shift"], "e",
        lazy.spawn("rofi -show emoji")
    ),

    Key([alt, "shift"], "c",
        lazy.spawn("rofi -show calc")
    ),

    Key([alt, "shift"], "b",
        lazy.spawn(browser), 
        desc="Opens an internet browser"
    ),

    Key([alt, "shift"], "s", 
        lazy.spawn(music_service),
        desc="Opens setted music player"
    ),

    Key([alt, "shift"], "d", 
        lazy.spawn("discord"), 
        desc="Opens discord"
    ),

    Key([alt, "shift"], "w", 
        lazy.spawn("whatsdesk"), 
        desc="Opens whatsapp"
    ),

    Key([alt, "shift"], "a", 
        lazy.spawn(terminal+" -e nvim /home/joaco/Notas/Palabras\ pendientes\ anki.md"), 
        desc="Words list for anki"
    ),

    Key([alt, "shift"], "p",
        lazy.spawn(terminal + " -e nvim /home/joaco/Notas/passwords.txt")
    ),

    Key([mod], "v", 
        lazy.spawn("copyq menu")
    ),

    Key([mod, "shift"], "v", 
        lazy.spawn("copyq toggle")
    ),

    Key([mod], "p", 
        lazy.spawn(terminal+" -e htop"),
        desc="Opens a system monitor"
    ),

    KeyChord([alt, "control"], "c",
        [
            Key([], "c", 
                lazy.spawn(terminal + " -e nvim /home/joaco/.config/"),
            ),

            Key([], "q", 
                lazy.spawn(terminal + " -e nvim /home/joaco/.config/qtile/config.py"),
            ),
            
            Key([], "n", 
                lazy.spawn(terminal + " -e nvim /home/joaco/.config/nvim/"),
            ),

            Key([], "a", 
                lazy.spawn(terminal + " -e nvim /home/joaco/.config/alacritty/alacritty.yml"),
            ),

            Key([], "a", 
                lazy.spawn(terminal + " -e nvim /home/joaco/.config/kitty/kitty.conf"),
            ),
        ]
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
            lazy.spawn(["sh", "-c", "maim ~/Media/Pictures/$(date +%s).jpg"])),

    Key([mod, "shift"], "Print",
            lazy.spawn(["sh", "-c", "maim -s ~/Media/Pictures/$(date +%s).jpg"])),
# }}}
]
# }}}

# Groups and Layaouts {{{
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
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
        ]
    )

groups = [Group("1", layout='max', label=''),
          Group("2", layout='monadtall', label=''),
          Group("3", layout='monadtall', label=''), 
          Group("4", layout='max', label=''),
          Group("5", layout='max', label=''),
          Group("6", layout='floating', label='')]

layout_theme = {
        "border_width": 1, 
        "margin": 10,
        "border_focus": "C8C8C8"
        }


layouts = [
    layout.MonadTall(**layout_theme),
    layout.Max(**layout_theme),
    layout.Floating(**layout_theme),
]
# }}}

widget_defaults = dict(
    font="JetBrainsMono Nerd Font Bold",
    fontsize=12,
    padding=8,
)
extension_defaults = widget_defaults.copy()

screens = [
# Notebook {{{
    Screen(
        top=bar.Bar(
            [
              widget.CurrentLayoutIcon(
                       custom_icon_paths = [os.path.expanduser("~/.config/qtile/icons")],
                       padding = 0,
                       scale = 0.7
                       ),

                widget.GroupBox(
                    highlight_method='line'
                    ),

                widget.Prompt(),

                widget.WindowName(
                    foreground=neon_mclaren[1][2]
                    ),

                widget.TextBox(
                    text="", 
                    foreground=neon_mclaren[0][2],
                    padding=4
                    ),

                widget.Battery(
                    format='{percent:2.0%}', 
                    foreground="#ffffff"
                    ),

                widget.Sep(
                    padding=10,
                    linewidth=0
                    ),

                widget.TextBox(
                    text="墳", 
                    fontsize="16", 
                    foreground=neon_mclaren[0][2],
                    padding=4,
                    mouse_callbacks={"Button1": lazy.spawn("pavucontrol")}
                    ),

                widget.Volume(
                    foreground="#ffffff"
                    ),

                widget.TextBox(
                    text="/", 
                    fontsize=32,
                    foreground="#666666",
                    padding=4
                    ),

                widget.Systray(),

                widget.TextBox(
                    text="ﮮ", 
                    fontsize=20,
                    foreground=neon_mclaren[0][2],
                    padding=4
                    ),

                widget.CheckUpdates(
                    display_format='{updates}',
                    no_update_string='',
                    foreground=neon_mclaren[1][5],
                    fontsize=16,
                    mouse_callbacks={"Button1" : lazy.spawn(terminal+" -e topgrade")}
                    ),

                widget.Clock(
                    format="%H:%M %d/%m", 
                    foreground=neon_mclaren[1][1],
                    ),

                widget.TextBox(
                    text="", 
                    fontsize=18,
                    foreground="#888888",
                    mouse_callbacks={'Button1' : lazy.spawn(["sh", "-c", "systemctl poweroff"])}
                    ),

                widget.KeyboardLayout(
                    configured_keyboards=['us', 'es'], 
                    foreground=neon_mclaren[1][2],
                    font="JetBrainsMono ExtraBold Nerd Font",
                    fontsize=15,
                    ),

                # widget.TextBox(
                #     text="", 
                #     fontsize=18,
                #     foreground="#888888",
                #     padding=8,
                #     mouse_callbacks={'Button1' : lazy.spawn(["sh", "-c", "systemctl reboot"])}
                #     ),

                # widget.Sep(
                #     padding=3,
                #     linewidth=0
                #     )
            ],
            24,
            opacity=0.85,
            background="#000000"
        ),
    ),
    # }}}

# TV {{{
    Screen(
        top=bar.Bar(
            [
              widget.CurrentLayoutIcon(
                       custom_icon_paths = [os.path.expanduser("~/.config/qtile/icons")],
                       padding = 0,
                       scale = 0.7
                       ),

                widget.GroupBox(
                    highlight_method='line'
                    ),

                widget.Prompt(),

                widget.WindowName(
                    foreground=neon_mclaren[1][2]
                    ),

                widget.TextBox(
                    text="", 
                    foreground=neon_mclaren[0][2],
                    padding=4
                    ),

                widget.Battery(
                    format='{percent:2.0%}', 
                    foreground="#ffffff"
                    ),

                widget.Sep(
                    padding=10,
                    linewidth=0
                    ),

                widget.TextBox(
                    text="墳", 
                    fontsize="16", 
                    foreground=neon_mclaren[0][2],
                    padding=4,
                    mouse_callbacks={"Button1": lazy.spawn("pavucontrol")}
                    ),

                widget.Volume(
                    foreground="#ffffff"
                    ),

                # widget.Wlan(
                #     format='{essid} {2.0%}',
                #     disconnected_message='睊',
                #     interface='wlp2s0',
                #     mouse_callbacks={"Button1": lazy.spawn(terminal+" -e nmcli d wifi list")}
                #     ),

                widget.TextBox(
                    text="/", 
                    fontsize=32,
                    foreground="#666666",
                    padding=4
                    ),

                widget.TextBox(
                    text="ﮮ", 
                    fontsize=20,
                    foreground=neon_mclaren[0][2],
                    mouse_callbacks={"Button1" : lazy.spawn(terminal+" -e topgrade")},
                    padding=4
                    ),

                widget.CheckUpdates(
                    display_format='{updates}',
                    no_update_string='',
                    update_interval=30,
                    foreground=neon_mclaren[1][5],
                    fontsize=16,
                    mouse_callbacks={"Button1" : lazy.spawn(terminal+" -e topgrade")}
                    ),

                widget.Clock(
                    format="%H:%M %d/%m", 
                    padding=8, 
                    foreground=neon_mclaren[1][1],
                    ),

                widget.KeyboardLayout(
                    configured_keyboards=['us', 'es'], 
                    foreground=neon_mclaren[1][2],
                    font="JetBrainsMono ExtraBold Nerd Font",
                    fontsize=15,
                    padding=8
                    ),

                widget.TextBox(
                    text="", 
                    fontsize=18,
                    foreground="#888888",
                    padding=8,
                    mouse_callbacks={'Button1' : lazy.spawn(["sh", "-c", "systemctl reboot"])}
                    ),

                widget.TextBox(
                    text="", 
                    fontsize=18,
                    foreground="#888888",
                    padding=12,
                    mouse_callbacks={'Button1' : lazy.spawn(["sh", "-c", "systemctl poweroff"])}
                    ),

                widget.Sep(
                    padding=3,
                    linewidth=0
                    )
            ],
            24,
            opacity=0.85,
            background="#000000"
        ),
    )
# }}}
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
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
