if (creditos) {
    var _gui_w = display_get_gui_width();
    var _x1 = (_gui_w - cred_w) / 2;  
    var _y1 = cred_y;                 
    var _x2 = _x1 + cred_w;
    var _y2 = _y1 + cred_h;

    draw_set_alpha(0.9);
    draw_set_color(c_black);
    draw_rectangle(_x1, _y1, _x2, _y2, false);
    draw_set_alpha(1);

    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_set_valign(fa_top);

    var _altura_texto = string_height_ext(cred_texto, cred_sep, cred_w / cred_escala) * cred_escala;
    var _ty = _y1 + (cred_h - _altura_texto) / 2; 

    draw_text_ext_transformed(_x1 + cred_w / 2, _ty, cred_texto,
                              cred_sep, cred_w / cred_escala,
                              cred_escala, cred_escala, 0);

    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}