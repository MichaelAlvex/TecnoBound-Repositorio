if (intance_exists(obj_player)){
	var _Item_Atual = oPlayer.hotbar[oPlayer.slot_selecionado];
	
	if (_Item_Atual == "oPicareta"){
		visible = true;
		x = oPlayer.x + 22;
		y = oPlayer.y + 17;
		image_angle = point_direction(x, y, mouse_x, mouse_y);
	}
	else{
		visible = false;
	}
}
		