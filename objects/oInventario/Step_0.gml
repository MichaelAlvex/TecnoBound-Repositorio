if (keyboard_check_pressed(ord("1"))) Slot_Selecionado = 0;
if (keyboard_check_pressed(ord("2"))) Slot_Selecionado = 1;
if (keyboard_check_pressed(ord("3"))) Slot_Selecionado = 2;

if (oMenu_Tablet.Tela_Atual == "inventario"){
    Inventario_Aberto = true;
} else {
    Inventario_Aberto = false;
}

if (Inventario_Aberto == true){
	
	var _Mouse_Gui_X = device_mouse_x_to_gui(0);
	var _Mouse_Gui_Y = device_mouse_y_to_gui(0);
	
	draw_sprite(sBtn_Home, 0, oMenu_Tablet.Pos_Fundo_X + 220, oMenu_Tablet.Pos_Y_Apps1);
		var _home_btn_x = oMenu_Tablet.Pos_Fundo_X + 220;
		var _home_btn_y = oMenu_Tablet.Pos_Y_Apps1;
		var _tam_btn = 16;
		
		if (point_in_rectangle(_Mouse_Gui_X, _Mouse_Gui_Y, _home_btn_x, _home_btn_y, _home_btn_x + _tam_btn, _home_btn_y + _tam_btn)){
			if (mouse_check_button_pressed(mb_left)){
				
				oMenu_Tablet.Tela_Atual = "home";
			}
		}
}

if (Inventario_Aberto == true && mouse_check_button_pressed(mb_left)){
    var _Mouse_X = device_mouse_x_to_gui(0);
    var _Mouse_Y = device_mouse_y_to_gui(0);
    
    for (var i = 0; i < Tamanho_Inventario; i++){
        
        var _Pos = Pegar_Posicao_Slot(i);
        var _xx = _Pos.x;
        var _yy = _Pos.y;
        
        if (_Mouse_X >= _xx && _Mouse_X <= _xx + Tamanho_Slot && _Mouse_Y >= _yy && _Mouse_Y <= _yy + Tamanho_Slot){
            var _Item_Slot = Inventario[i];
            
            if (Item_Segurado == noone){
                if (_Item_Slot != noone){
                    Item_Segurado = _Item_Slot;
                    Inventario[i] = noone;
                }
            } else {
				if (_Item_Slot == noone){
					Inventario[i] = Item_Segurado;
					Item_Segurado = noone;
				} else {
					if (_Item_Slot.nome == Item_Segurado.nome){
						Inventario[i].quantidade += Item_Segurado.quantidade;
						Item_Segurado = noone;
					} else {
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
		
if (Inventario_Aberto == true){
	var _Mouse_Gui_X = device_mouse_x_to_gui(0);
	var _Mouse_Gui_Y = device_mouse_y_to_gui(0);
	var _Botao_X = 400;
	var _Botao_Y = 100;
	var _Botao_Largura = sprite_get_width(sApp_Oficina);
	var _Botao_Altura = sprite_get_height(sApp_Oficina);
}
	