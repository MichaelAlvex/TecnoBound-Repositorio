if (visible == true){

image_index = 0;
image_speed = 1;

var _Pedra = instance_position(mouse_x, mouse_y, oPedra_Mae);

if (_Pedra != noone){
	if (point_distance(x, y, _Pedra.x, _Pedra.y < 48)){

	_Pedra.hp -= 1;
	
	if (_Pedra.hp <=0){
		
		instance_destroy(_Pedra);
	}
	}
}
}
		
