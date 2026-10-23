draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);

draw_text_transformed(
    display_get_gui_width() / 2,
    display_get_gui_height() - 40,
    "Parabens! Voce desbloqueou a segunda fase!",
    0.5,
    0.5,
    0
);

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);