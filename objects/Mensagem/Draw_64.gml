draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);

var textoMensagem;

if (faseDesbloqueada == 2) {
    textoMensagem = "Parabens! Voce desbloqueou a segunda fase!";
}
else if (faseDesbloqueada == 3) {
    textoMensagem = "Parabens! Voce desbloqueou a terceira fase!";
}

draw_text_transformed(
    display_get_gui_width() / 2,
    display_get_gui_height() - 40,
    textoMensagem,
    0.5,
    0.5,
    0
);

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
