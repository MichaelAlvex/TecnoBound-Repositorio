if (room != Menu && room != Conclusao && room != Pedidos && room != rMontagemMonitor && room != rMontagemMouse && room != rMontagemTeclado && room != rOficina){

	x = room_width / 2;
	y = room_height / 2;


if (room != rOficina){
	view_enabled = true;
	view_visible[0] = true;

	if (!variable_instance_exists(id, "Camera_Jogo")){
		var _Largura_Camera = 400;
		var _Altura_Camera = 200;

		Camera_Jogo = camera_create_view(0, 0, _Largura_Camera, _Altura_Camera, 0, id, -1, -1, _Largura_Camera / 2, _Altura_Camera / 2);
	}

	view_camera[0] = Camera_Jogo;
}
}
