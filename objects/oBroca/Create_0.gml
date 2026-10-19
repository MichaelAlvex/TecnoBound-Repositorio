if (instance_exists(oPlayer)){
	var _px = oPlayer.x;
	var _py = oPlayer.y;
	
	if (oPlayer.sprite_index == sPlayer_Direita){
		x = _px + 18;
		y = _py + 26;
		sprite_index = sBroca_Direita;
		depth = oPlayer.depth - 1;
	} else if (oPlayer.sprite_index == sPlayer_Esquerda){
		x = _px + 12;
		y = _py + 26;
		sprite_index = sBroca_Esquerda;
		depth = oPlayer.depth - 1;
	} else if (oPlayer.sprite_index == sPlayer_Frente){
		x = _px + 18;
		y = _py + 31;
		sprite_index = sBroca_Baixo;
		depth = oPlayer.depth - 1;
	} else if (oPlayer.sprite_index == sPlayer_Tras){
		x = _px + 18;
		y = _py + 15;
		sprite_index = sBroca_Cima;
		depth = oPlayer.depth + 1;
	}
}