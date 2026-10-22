function Colisao_Paredes(oParede_Invisivel){
	if (place_meeting(x + VelH, y, oParede_Invisivel)){
			while (!place_meeting(x + sign(VelH), y, oParede_Invisivel)){
				x += sign(VelH);
			}
			VelH = 0;
		}
		x += VelH;

		if (place_meeting(x, y + VelV, oParede_Invisivel)){
			while (!place_meeting(x, y + sign(VelV), oParede_Invisivel)){
				y += sign(VelV);
			}
			VelV = 0;
		}
		y += VelV;
}