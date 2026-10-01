if (Tablet_Aberto == false || Tela_Atual == "home"){
	if (keyboard_check_pressed(ord("E"))){
		Tablet_Aberto = !Tablet_Aberto;
	
		if (Tablet_Aberto == true){
			Tela_Atual = "home";
		}
	}
}

if (Tablet_Aberto == true){
	
	var _home_btn_x = Pos_Fundo_X + 261;
	var _home_btn_y = Pos_Y_Apps1;
	var _tam_btn = 16;
	
	if (Tela_Atual != "home" && keyboard_check_pressed(ord("E"))){
		
		Tela_Atual = "home"
		
	}
	
	var _Mouse_Gui_X = device_mouse_x_to_gui(0);
	var _Mouse_Gui_Y = device_mouse_y_to_gui(0);
	
	if (Tela_Atual == "home"){
		
		var _App1_x = Pos_Fundo_X + 10;
		var _App1_y = Pos_Y_Apps1;
		var _Tam_App = 50;
		
		if (point_in_rectangle(_Mouse_Gui_X, _Mouse_Gui_Y, _App1_x, _App1_y, _App1_x + _Tam_App, _App1_y + _Tam_App)){
			if (mouse_check_button_pressed(mb_left)){
				
				Tela_Atual = "pedidos"
			}
		}
		
		var _App2_x = Pos_Fundo_X + 80;
		var _App2_y = Pos_Y_Apps1;
		
		if (point_in_rectangle(_Mouse_Gui_X, _Mouse_Gui_Y, _App2_x, _App2_y, _App2_x + _Tam_App, _App2_y + _Tam_App)){
			if (mouse_check_button_pressed(mb_left)){
				
				Tela_Atual = "inventario"
			}
		}
	
		var _App3_x = Pos_Fundo_X + 150;
		var _App3_y = Pos_Y_Apps1;
		
		if (point_in_rectangle(_Mouse_Gui_X, _Mouse_Gui_Y, _App3_x, _App3_y, _App3_x + _Tam_App, _App3_y + _Tam_App)){
			if (mouse_check_button_pressed(mb_left)){
				
				Tela_Atual = "oficina"
			}
		}
		
		var _App4_x = Pos_Fundo_X + 220;
		var _App4_y = Pos_Y_Apps1;
		
		if (point_in_rectangle(_Mouse_Gui_X, _Mouse_Gui_Y, _App4_x, _App4_y, _App4_x + _Tam_App, _App4_y + _Tam_App)){
			if (mouse_check_button_pressed(mb_left)){
				
				Tela_Atual = "conquista"
			}
		}
		
		var _App5_x = Pos_Fundo_X + 10;
		var _App5_y = Pos_Y_Apps2;
		
		if (point_in_rectangle(_Mouse_Gui_X, _Mouse_Gui_Y, _App5_x, _App5_y, _App5_x + _Tam_App, _App5_y + _Tam_App)){
			if (mouse_check_button_pressed(mb_left)){
				
				Tela_Atual = "opcoes"
			}
		}
		
		var _App6_x = Pos_Fundo_X + 80;
		var _App6_y = Pos_Y_Apps2;
		
		if (point_in_rectangle(_Mouse_Gui_X, _Mouse_Gui_Y, _App6_x, _App6_y, _App6_x + _Tam_App, _App6_y + _Tam_App)){
			if (mouse_check_button_pressed(mb_left)){
				
				Tela_Atual = "stats"
			}
		}
		
		var _App7_x = Pos_Fundo_X + 150;
		var _App7_y = Pos_Y_Apps2;
		
		if (point_in_rectangle(_Mouse_Gui_X, _Mouse_Gui_Y, _App7_x, _App7_y, _App7_x + _Tam_App, _App7_y + _Tam_App)){
			if (mouse_check_button_pressed(mb_left)){
				
				Tela_Atual = "ajuda"
			}
		}
		
		var _App8_x = Pos_Fundo_X + 220;
		var _App8_y = Pos_Y_Apps2;
		
		if (point_in_rectangle(_Mouse_Gui_X, _Mouse_Gui_Y, _App8_x, _App8_y, _App8_x + _Tam_App, _App8_y + _Tam_App)){
			if (mouse_check_button_pressed(mb_left)){
				
				Tela_Atual = "sair"
			}
		}
	}
	
	else{
		
		if (point_in_rectangle(_Mouse_Gui_X, _Mouse_Gui_Y, _home_btn_x, _home_btn_y, _home_btn_x + _tam_btn, _home_btn_y + _tam_btn)){
			if (mouse_check_button_pressed(mb_left)){
				
				Tela_Atual = "home";
			}
		}
		
		if (Tela_Atual == "oficina"){
		
		var _tp_btn_tam = 50;
		
		if (point_in_rectangle(_Mouse_Gui_X, _Mouse_Gui_Y, Pos_Fundo_X + 115, Pos_Y_Apps1 + 45, Pos_Fundo_X + 115 + _tp_btn_tam, Pos_Y_Apps1 + 45 + _tp_btn_tam)){
			if (mouse_check_button_pressed(mb_left)){
				
				room_goto(rOficina);
			}
		}
	}
	}
}
		
