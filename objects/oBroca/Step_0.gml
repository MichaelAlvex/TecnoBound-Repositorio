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
		
	x += random_range(-0.75, 0.75);
	y += random_range(-0.75, 0.75);
	
	if (mouse_check_button(mb_left)){
		
		image_speed = 1;
		var _Pedra = instance_position(mouse_x, mouse_y, oPedra_Mae);
		
		if (_Pedra != noone && point_distance(x, y, _Pedra.x + 16, _Pedra.y + 16) <= 48){
			
			_Pedra.Tempo_Quebra--;
				
				_Pedra.x = _Pedra.X_Inicial + random_range(-1, 1);
				_Pedra.y = _Pedra.Y_Inicial + random_range(-1, 1);
			
			if(_Pedra.Tempo_Quebra <= 0){
				with(_Pedra){
					
					var _Parede = instance_place(x, y, oParede_Invisivel);
					
					if (_Parede != noone){
						instance_destroy(_Parede)
					}
					
					instance_destroy()
				}
			}
		}
	} else {
		image_speed = 0;
		image_index = 0;
	}

	if (mouse_check_button(mb_left)){
		
		image_speed = 1;
		var _Pedra = instance_position(mouse_x, mouse_y, oPedra_Mae);
		
		if (_Pedra != noone && point_distance(x, y, _Pedra.x + 16, _Pedra.y + 16) <= 48){
			
			_Pedra.Tempo_Quebra--;
				
				_Pedra.x = _Pedra.X_Inicial + random_range(-1, 1);
				_Pedra.y = _Pedra.Y_Inicial + random_range(-1, 1);
			
			if(_Pedra.Tempo_Quebra <= 0){
				with(_Pedra){
					
					var _Parede = instance_place(x, y, oParede_Invisivel);
					
					if (_Parede != noone){
						instance_destroy(_Parede)
					}
					
					instance_destroy()
				}
			}
		}
	} else {
		image_speed = 0;
		image_index = 0;
	}image_speed = 1
}	