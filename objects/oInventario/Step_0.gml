if (keyboard_check_pressed(ord("E"))){
	Inventario_Aberto = !Inventario_Aberto;
}
	
	if Inventario_Aberto == true && mouse_check_button_pressed(mb_left){
		
		var _Mouse_X = device_mouse_x_to_gui(0);
		var _Mouse_Y = device_mouse_y_to_gui(0);
		
		for (var i = 0; i < Tamanho_Inventario; i++){
			
				var _Coluna = i mod Colunas;
			var _Linha = i div Colunas;
			var _xx = Margem_X + (_Coluna * Distancia);
			var _yy = Margem_Y - (_Linha * Distancia);
			
			if (_Mouse_X >= _xx && _Mouse_X <= _xx + Tamanho_Slot && _Mouse_Y >= _yy && _Mouse_Y <= _yy + Tamanho_Slot){
				var _Item_Slot = Inventario[i];
				
				if (Item_Segurado == noone){
					if (_Item_Slot != noone){
						Item_Segurado = _Item_Slot;
						Inventario[i] = noone;
					}
				}
				else {
					if (_Item_Slot == noone){
						Inventario[i] = Item_Segurado;
						Item_Segurado = noone;
					} 
					else {
						if (_Item_Slot.nome == Item_Segurado.nome){
							Inventario[i].quantidade += Item_Segurado.quantidade;
							Item_Segurado = noone;
						}
						else {
							var _Bolha = Inventario[i];
							Inventario[i] = Item_Segurado;
							Item_Segurado = _Bolha;
						}
					}
				}
				break;
			}
		}
	}

if (Inventario_Aberto == false){
	if (mouse_wheel_down()){
		Slot_Selecionado--;
		if (Slot_Selecionado < 0){
			Slot_Selecionado = Tamanho_HotBar - 1;
		}
	}
	if (mouse_wheel_up()){
		Slot_Selecionado++;
		if (Slot_Selecionado >= Tamanho_HotBar){
			Slot_Selecionado = 0;
		}
	}
}
		