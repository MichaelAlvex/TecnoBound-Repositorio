var _gw = display_get_gui_width();
var _restante = oPlayer.queimadura_ate - current_time;

var _alpha = (_restante > 1000 || (current_time div 100) mod 2 == 0) ? 1 : 0.3;

var _dx = _gw - margem - sprite_get_width(sFogo_Queimadura) + sprite_get_xoffset(sFogo_Queimadura);
var _dy = margem + sprite_get_yoffset(sFogo_Queimadura);

draw_sprite_ext(sFogo_Queimadura, frame, _dx, _dy, 1, 1, 0, c_white, _alpha);