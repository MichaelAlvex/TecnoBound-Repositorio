var _gw = display_get_gui_width();

var _larg = 300;
var _alt = 8;
var _bx = (_gw - _larg) / 2;
var _by = 34;

var _pct_real = clamp(HP_Monstro / HP_Max, 0, 1);
var _pct_visual = clamp(hp_visual / HP_Max, 0, 1);

draw_set_color(c_black);
draw_set_alpha(0.7);
draw_rectangle(_bx - 3, _by - 3, _bx + _larg + 3, _by + _alt + 3, false);
draw_set_alpha(1);

draw_set_color(c_white);
draw_rectangle(_bx, _by, _bx + _larg * _pct_visual, _by + _alt, false);

draw_set_color(make_color_rgb(255, 110, 20));
draw_rectangle(_bx, _by, _bx + _larg * _pct_real, _by + _alt, false);

draw_set_color(c_black);
draw_line(_bx + _larg * 0.5, _by, _bx + _larg * 0.5, _by + _alt);

draw_set_color(c_white);
draw_rectangle(_bx - 3, _by - 3, _bx + _larg + 3, _by + _alt + 3, true);

draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_text(_gw / 2, _by - 6, nome_boss);

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);