if (place_meeting(x, y, oPlayer)) {
	oPlayer.Lentidao = true;
	oPlayer.Tempo_Lentidao = 300;
	
	instance_destroy();
}