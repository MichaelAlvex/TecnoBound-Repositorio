if (instance_exists(oPlayer)){
	
	x = oPlayer.x + 20;
	y = oPlayer.y + 28;
	depth = oPlayer.depth - 1;
} else {
	instance_destroy();
	exit;
}

image_angle = point_direction(x, y, mouse_x, mouse_y);
image_yscale = (mouse_x < x) ? -1 : 1;

	
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