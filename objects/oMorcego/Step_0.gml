if (instance_exists(oPlayer)){
	var _Dir_Alvo = point_direction(x, y, oPlayer.x, oPlayer.y);
	
	Angulo_Onda += Frequencia_Onda;
	
	var _Dir_Com_Onda = _Dir_Alvo + (sin(Angulo_Onda) * Amplitude_Onda);
	
	x += lengthdir_x(Velocidade, _Dir_Com_Onda);
	y += lengthdir_y(Velocidade, _Dir_Com_Onda);
	
	if (oPlayer.x > x) {
		image_xscale = -1;
	} else if (oPlayer.x < x){
		image_xscale = 1;
	}
}

image_yscale = 1;
			
if (Monstro_Tremer_Timer > 0) {
    Monstro_Tremer_Timer--;
}
