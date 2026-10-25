if (room == Pedidos && global.faseAtual == 3) {
    var larguraGUI = display_get_gui_width();
    var alturaGUI = display_get_gui_height();

    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);

    draw_set_color(c_black);
    draw_text_transformed(
        larguraGUI * 0.6 - 12,
        alturaGUI * 0.5 - 10,
        pedidos[pedidoAtual],
        0.5,
        0.5,
        0
    );

    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_color(c_white);
}
