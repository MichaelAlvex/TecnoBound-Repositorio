if (Timer_No_Ar > 0){
	Timer_No_Ar--;
	
	if (place_meeting(x + VelH, y, oParede_Invisivel)){
		while (!place_meeting(x + sign(VelH), y, oParede_Invisivel)){
			x += sign(VelH);
		}
		VelH = 0;
	}
	x += VelH

	if (place_meeting(x, y + VelV, oParede_Invisivel)){
		while (!place_meeting(x, y + sign(VelV), oParede_Invisivel)){
			y += sign(VelV);
		}
		VelV = 0;
	}
	y += VelV;
} else {
	
	VelH = 0;
	VelV = 0;
	Timer_Pulo++;
	
	if (Timer_Pulo >= Tempo_Entre_Pulos){
		Timer_Pulo = 0;
		
		if (instance_exists(oPlayer)){
			
			var _Direcao = point_direction(x, y, oPlayer.x, oPlayer.y);
			VelH = lengthdir_x(Velocidade, _Direcao);
			VelV = lengthdir_y(Velocidade, _Direcao);
			
			Timer_No_Ar = Duracao_Pulo;
		}
	}
}

if (Monstro_Tremer_Timer > 0) {
    Monstro_Tremer_Timer--;
}



		
