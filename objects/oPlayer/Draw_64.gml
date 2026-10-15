if (instance_exists(oPlayer)){
	var _Total_Vida = 5;
	var _Pos_X_Vida = 10;
	var _Pos_Y_Vida = 10;
	var _Espacamento_Vida = 15;
	
	for (var _i = 0; _i < _Total_Vida; _i++){
		
		if (HP_Player > _i){
			draw_sprite(sVida, 0, _Pos_X_Vida + (_i * _Espacamento_Vida), _Pos_Y_Vida);
		} else { 
			draw_sprite(sVida_Vazia, 0, _Pos_X_Vida + (_i * _Espacamento_Vida), _Pos_Y_Vida);
		}
	}
}