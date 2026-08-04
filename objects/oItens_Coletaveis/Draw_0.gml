draw_set_colour(c_black);
draw_set_alpha(0.3);
draw_ellipse(x - 5, y, x + 5, y + 5, false);
draw_set_alpha(1);
draw_set_colour(c_white);
var _flutuacao = (z == 0) ? sin(timer_flutuacao) * amplitude_flutuacao: 0;
draw_sprite(sprite_index, image_index, x, y + z + _flutuacao);