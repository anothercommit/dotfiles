from libqtile.widget.textbox import TextBox

def left_triangle(bg_color, fg_color):
    return TextBox(
            text='\uE0B2',
            padding=0,
            fontsize=26,
            background=bg_color,
            foreground=fg_color )

def right_triangle(bg_color, fg_color):
    return TextBox(
            text='\uE0B0',
            padding=0,
            fontsize=26,
            background=bg_color,
            foreground=fg_color )

def lower_left_triangle(bg_color, fg_color):
    return TextBox(
            text='\u25E3',
            padding=0,
            fontsize=56,
            background=bg_color,
            foreground=fg_color )

def lower_right_triangle(bg_color, fg_color):
    return TextBox(
            text='\u25E2',
            padding=0,
            fontsize=56,
            background=bg_color,
            foreground=fg_color )

def upper_left_triangle(bg_color, fg_color):
    return TextBox(
            text='\u25E4',
            padding=0,
            fontsize=56,
            background=bg_color,
            foreground=fg_color )

def upper_right_triangle(bg_color, fg_color):
    return TextBox(
            text='\u25E5',
            padding=0,
            fontsize=56,
            background=bg_color,
            foreground=fg_color )
