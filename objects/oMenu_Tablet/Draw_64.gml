if (Tablet_Aberto == true){
	
	draw_sprite(sTablet_Fundo, 0, Pos_Fundo_X, Pos_Fundo_Y);
	
	if (Tela_Atual == "home"){
	
		draw_sprite(sApp_Pedidos, 0, Pos_Fundo_X + 10, Pos_Y_Apps1);
		draw_sprite(sApp_Inventario, 0, Pos_Fundo_X + 80, Pos_Y_Apps1);
		draw_sprite(sApp_Oficina, 0, Pos_Fundo_X + 150, Pos_Y_Apps1);
		draw_sprite(sApp_Conquista, 0, Pos_Fundo_X + 220, Pos_Y_Apps1);
		draw_sprite(sApp_Opcoes, 0, Pos_Fundo_X + 10, Pos_Y_Apps2);
		draw_sprite(sApp_Stats, 0, Pos_Fundo_X + 80, Pos_Y_Apps2);
		draw_sprite(sApp_Ajuda, 0, Pos_Fundo_X + 150, Pos_Y_Apps2);
		draw_sprite(sApp_Sair, 0, Pos_Fundo_X + 220, Pos_Y_Apps2);
		
		draw_set_colour(c_white);
		draw_set_font(Font1);
		draw_set_halign(fa_center);
		draw_text_transformed(Pos_Fundo_X + 35,Pos_Y_Apps1 + 55, "Pedidos", 0.4, 0.4, 0);
		draw_text_transformed(Pos_Fundo_X + 105, Pos_Y_Apps1 + 55, "Inventário", 0.4, 0.4, 0);
		draw_text_transformed(Pos_Fundo_X + 175, Pos_Y_Apps1 + 55, "Oficina", 0.4, 0.4, 0);
		draw_text_transformed(Pos_Fundo_X + 245, Pos_Y_Apps1 + 55, "Conquistas", 0.4, 0.4, 0);
		draw_text_transformed(Pos_Fundo_X + 35, Pos_Y_Apps2 + 55, "Opções", 0.4, 0.4, 0);
		draw_text_transformed(Pos_Fundo_X + 105, Pos_Y_Apps2 + 55, "Estatísticas", 0.4, 0.4, 0);
		draw_text_transformed(Pos_Fundo_X + 175, Pos_Y_Apps2 + 55, "Ajuda", 0.4, 0.4, 0);
		draw_text_transformed(Pos_Fundo_X + 245, Pos_Y_Apps2 + 55, "Sair", 0.4, 0.4, 0);

		draw_set_halign(fa_left);
	}
	
	else {
		
		draw_sprite(sBtn_Home, 0, Pos_Fundo_X + 261, Pos_Y_Apps1);
		
		if (Tela_Atual == "oficina"){
		
			draw_sprite(sTp_Oficina, 0, Pos_Fundo_X + 115, Pos_Y_Apps1 + 45);
	}
}
}