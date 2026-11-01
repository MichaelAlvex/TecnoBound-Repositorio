if (mostrar_aviso) {
    var _x2 = x + olhando_x * dash_dist;
    var _y2 = y + olhando_y * dash_dist;

    draw_set_color(c_red);
    draw_set_alpha(0.25 + 0.15 * sin(timer * 0.5));
    draw_rectangle(min(x, _x2) - 8, min(y, _y2) - 8, max(x, _x2) + 8, max(y, _y2) + 8, false);
    draw_set_alpha(1);
    draw_set_color(c_white);
}

draw_self();