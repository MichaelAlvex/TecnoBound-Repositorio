
if (room == Pedidos && global.faseAtual == 1) {
    draw_set_color(c_black);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);

    draw_text(
        790,
        350,
        pedidos[pedidoAtual]
    );

    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}
