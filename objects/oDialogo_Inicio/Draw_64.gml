var _gw = display_get_gui_width();
var _gh = display_get_gui_height();

var _cw = sprite_get_width(sCaixa_Dialogo_Inicio);
var _ch = sprite_get_height(sCaixa_Dialogo_Inicio);

var _bx = (_gw - _cw) / 2;
var _by = _gh - _ch - 10;

draw_sprite(sCaixa_Dialogo_Inicio, 0, _bx, _by);

draw_set_font(Dialogo_Inicio)
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text_ext(_bx + 14, _by + 14, string_copy(falas[indice], 1, floor(chars)), 18, _cw - 28);

if (chars >= string_length(falas[indice])) {
    var _ox = _bx + _cw - sprite_get_width(sBotao_E) - 8;
    var _oy = _by + _ch - sprite_get_height(sBotao_E) - 6;
    draw_sprite(sBotao_E, 0, _ox, _oy + sin(current_time / 200) * 2);
}

