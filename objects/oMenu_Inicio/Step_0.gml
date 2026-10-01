//menu com opções para jogar, opções, créditos, sair

var _cima = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
var _baixo = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));
var _enter = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space);
if(_cima){
	index_selecionado--;
	if(index_selecionado < 0){
		index_selecionado = array_length(opcoes) - 1;
	}
}
if(_baixo){
	index_selecionado++;
	if(index_selecionado >= array_length(opcoes)){
		index_selecionado = 0;
	}
}
if(_enter){
	switch(index_selecionado){
		case 0:
		room_goto_next();
		break;
		case 1:
		show_message("Você Clicou Em Opções!");
		break;
		case 2:
		show_message("Você Clicou Em Créditos!");
		break;
		case 3:
		game_end();
		break;
	}
}