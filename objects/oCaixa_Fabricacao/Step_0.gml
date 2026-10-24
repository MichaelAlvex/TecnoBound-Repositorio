var _Mouse_X = device_mouse_x_to_gui(0);
var _Mouse_Y = device_mouse_y_to_gui(0);

for (var _i = 0; _i < Tamanho_Caixa; _i++) {
    var _Coluna = _i mod Colunas_Caixa;
    var _Linha = _i div Colunas_Caixa;
    
    var _xx = Pos_Caixa_X_Ofc + (_Coluna * Distancia) + 10;
    var _yy = Pos_Caixa_Y_Ofc + (_Linha * Distancia) + 10;
    
    var _centro_x = _xx + (Tamanho_Slot / 2);
    var _centro_y = _yy + (Tamanho_Slot / 2);
	var _x1 = _centro_x - (Tamanho_Slot / 2);
	var _y1 = _centro_y - (Tamanho_Slot / 2);
    var _x2 = _centro_x + (Tamanho_Slot / 2);
    var _y2 = _centro_y + (Tamanho_Slot / 2);
        
        if (_Mouse_X >= _x1 && _Mouse_X <= _x2 && _Mouse_Y >= _y1 && _Mouse_Y <= _y2) {
        
        if (mouse_check_button_pressed(mb_left)) {
            
            var _Item_Temporario = Slots_Caixa[_i];
            Slots_Caixa[_i] = oInventario.Item_Segurado;
            oInventario.Item_Segurado = _Item_Temporario;
        }
    }
}
