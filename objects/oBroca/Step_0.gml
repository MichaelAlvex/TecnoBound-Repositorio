if (instance_exists(oPlayer)){
	var _Ombro_y = oPlayer.y + 27;
	image_angle = point_direction(oPlayer.x, _Ombro_y, mouse_x, mouse_y);
	var _Distancia_Mao = 1;
	var _Tremor_y = random_range(-0.5, 0.5);
	var _Tremor_x = random_range(-0.5, 0.5);
	x = oPlayer.x + lengthdir_x(_Distancia_Mao, image_angle) + _Tremor_x + 19;
	y = oPlayer.y + lengthdir_y(_Distancia_Mao, image_angle) + _Tremor_y + 24;
	
	if (image_angle > 45 && image_angle < 135){
		depth = oPlayer.depth + 1;
	} else {
		depth = oPlayer.depth - 1;
	}
	
	image_yscale = (mouse_x < oPlayer.x) ? -1 : 1;
	image_speed = 1;
	
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
}