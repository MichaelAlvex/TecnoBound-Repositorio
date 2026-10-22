if (instance_exists(oPlayer)) {
	var _Distancia = point_distance(x, y, oPlayer.x, oPlayer.y);
	
	if (_Distancia > Distancia_Disparo || oPlayer.Lentidao) {
		var _Direcao = point_direction(x, y, oPlayer.x + 16, oPlayer.y + 29);
		VelH = lengthdir_x(Velocidade, _Direcao);
		VelV = lengthdir_y(Velocidade, _Direcao);
	}
	
	if (Cooldown_Tiro > 0) {
		Cooldown_Tiro--;
	} else {
		
		if (_Distancia <= Distancia_Disparo) {
			var _Projetil = instance_create_layer(x, y, "Instances", oProjetil_Teia);
			_Projetil.alvo_x = oPlayer.x;
			_Projetil.alvo_y = oPlayer.y;
			
			with (_Projetil) {
				move_towards_point(alvo_x, alvo_y, 4);
			}
			
			Cooldown_Tiro = Tempo_Entre_Tiros;
		}
	}
}

Colisao_Paredes(oParede_Invisivel);

Direcao_Player = point_direction(x, y, oPlayer.x, oPlayer.y);

if (Direcao_Player >= 30 && Direcao_Player <= 120){
	sprite_index = sAranha_Cima;
} else if (Direcao_Player > 120 && Direcao_Player < 240){
	sprite_index = sAranha_Esquerda;
} else if (Direcao_Player >= 240 && Direcao_Player <= 333){
	sprite_index = sAranha_Baixo;
} else {
	sprite_index = sAranha_Direita;
}

if (Monstro_Tremer_Timer > 0) {
    Monstro_Tremer_Timer--;
}