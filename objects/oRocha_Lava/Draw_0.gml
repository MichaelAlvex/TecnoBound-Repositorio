var _prog = caindo ? 1 : clamp(timer / espera, 0, 1);
var _pulso = 0.5 + 0.5 * sin(timer * (0.3 + 0.5 * _prog));

draw_set_color(c_red);
draw_set_alpha(0.15 + 0.2 * _pulso);
draw_circle(x, y, raio_impacto, false);
draw_set_alpha(0.35);
draw_circle(x, y, raio_impacto * _prog, false);
draw_set_alpha(0.6 + 0.4 * _pulso);
draw_circle(x, y, raio_impacto, true);
draw_set_alpha(1);
draw_set_color(c_white);

if (caindo) draw_sprite(sRocha_Lava, 0, x, y - altura);