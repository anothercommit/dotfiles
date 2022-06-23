import os
import subprocess
from libqtile import hook
from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, KeyChord, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

# My files
from unicodes import *
from colors import *

music_service = "spotify-launcher"
browser = "librewolf"
file_explorer = "lf"
terminal = "kitty"
mod = "mod4"

keys = [

    Key([mod], "Return",
        lazy.spawn(terminal), 
        desc="Launch terminal"),


    # Switch between windows
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
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),
    

    # Run
     Key([mod], "b",
         lazy.spawn(browser)),

     Key([mod], "s", 
         lazy.spawn(music_service)),

     Key([mod], "e", 
         lazy.spawn(terminal+ " -e " + file_explorer)),

     KeyChord(["shift"], "space", [
         Key([], "r",
             lazy.spawn("rofi -show drun")
         ),
         Key([], "e",
             lazy.spawn("rofi -show emoji")
         ),
         Key([], "c",
             lazy.spawn("rofi -show calc")
         ),
         ]),


    # Media 
    Key([], "XF86AudioMute",
        lazy.spawn("amixer sset Master toggle")),
   
    Key(["shift"], "XF86AudioRaiseVolume",
        lazy.spawn("amixer sset Master 15%+")),

    Key(["shift"], "XF86AudioLowerVolume",
        lazy.spawn("amixer sset Master 15%-")),

    Key([], "XF86AudioRaiseVolume",
        lazy.spawn("amixer sset Master 1%+")),

    Key([], "XF86AudioLowerVolume",
        lazy.spawn("amixer sset Master 1%-")),

    Key([], "XF86MonBrightnessUp",
        lazy.spawn("brillo -q -A 5")),

    Key([], "XF86MonBrightnessDown",
        lazy.spawn("brillo -q -U 5")),

    Key(["shift"], "XF86MonBrightnessUp",
             lazy.spawn("brillo -q -A 15")),

    Key(["shift"], "XF86MonBrightnessDown",
            lazy.spawn("brillo -q -U 15")),

    # Key([], "print", 
    #         lazy.spawn("maim -s | xclip -selection clipboard -t image/png")),
    # 
    # Key(["shift"], "print",
    #         lazy.spawn("maim -s screenshot.jpg")),


    # Change Keyboard Layout 
    Key(["control"], "space", lazy.widget["keyboardlayout"].next_keyboard(), desc="Next keyboard layout."),


    # Windows
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
        )
]

groups = [Group("web", layout='max'),
          Group("dev", layout='monadtall'),
          Group("ref", layout='monadtall'),
          Group("chat", layout='max'),
          Group("music", layout='max'),
          Group("space", layout='monadtall')]


keys.extend([
    Key([mod], "1", lazy.group["web"].toscreen()),
    Key([mod], "2", lazy.group["dev"].toscreen()),
    Key([mod], "3", lazy.group["ref"].toscreen()),
    Key([mod], "4", lazy.group["chat"].toscreen()),
    Key([mod], "5", lazy.group["music"].toscreen()),
    Key([mod], "6", lazy.group["space"].toscreen())
    ])

layouts = [
    layout.MonadTall(),
    layout.Max(),
]

mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]


widget_defaults = dict(
    font="JetBrainsMono Nerd Font Bold",
    fontsize=14,
    padding=6,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            [
              widget.CurrentLayoutIcon(
                       custom_icon_paths = [os.path.expanduser("~/.config/qtile/icons")],
                       padding = 0,
                       scale = 0.7
                       ),

                widget.GroupBox(
                    highlight_method='block'
                    # this_current_screen_border=neon_mclaren[1][0]
                    ),

                widget.Prompt(),

                widget.WindowName(
                    foreground=neon_mclaren[1][2]
                    ),

                # left_triangle(neon_mclaren[0][0], neon_mclaren[0][5]),
                widget.TextBox(text="", foreground=neon_mclaren[1][1]),

                widget.Battery(format='{percent:2.0%}', full_char="", foreground=neon_mclaren[0][2]),

                # left_triangle(neon_mclaren[0][5], neon_mclaren[0][2]),

                widget.TextBox(text="墳", fontsize="16"),

                widget.Volume(font="Hack", fontsize="13", foreground=neon_mclaren[0][0]),

                # lower_left_triangle(neon_mclaren[0][0], neon_mclaren[0][2]),

                widget.CheckUpdates(
                    no_update_string="",
                    update_interval = 1800,
                    display_format = "Updates {updates} ",
                    mouse_callbacks = {'Button1': lazy.spawn(terminal + ' -e paru')},
                    padding = 5,
                    foreground=neon_mclaren[1][5]
                    ),

                # TODO arreglar esto
                #widget.GmailChecker(username="Joaquín", passowrd="Joaquin2007", email_path="jdomenech@escuelasproa.edu.ar"),

                widget.Systray(),

                # upper_right_triangle(neon_mclaren[0][0], neon_mclaren[0][6]),

                widget.Clock(format="%H:%M %A %d/%m", 
                    padding=8, 
                    foreground=neon_mclaren[1][1]),

                widget.KeyboardLayout(configured_keyboards=['us', 'es'], 
                        foreground=neon_mclaren[1][2],
                        font="JetBrainsMono Nerd Font Extra Bold",
                        padding=8)
            ],
            24,
            background=neon_mclaren[0][1]
        ),
    )
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

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"

# def my_func(text) for string in [" - Chromium", " - LibreWolf"]: 
#     text = text.replace(string, "") 
#     return textthen set option parse_text=my_func
