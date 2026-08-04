//menu na tela
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
var _x_inicial = room_width / 2;
var _y_inicial = room_height / 2;
var _espacamento=40;
for(var _i = 0; _i < array_length(opcoes); _i++){
	if(_i == index_selecionado){
		draw_set_color(c_fuchsia);
	}else{
		draw_set_color(c_purple);
	}
	draw_text(_x_inicial, _y_inicial + (_i * _espacamento), opcoes[_i]);
	draw_set_color(c_purple);
}
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);