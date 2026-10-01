var _Mouse_X = device_mouse_x_to_gui(0);
var _Mouse_Y = device_mouse_y_to_gui(0);

for (var _i = 0; _i < Tamanho_Caixa; _i++) {
    var _Coluna = _i mod Colunas_Caixa;
    var _Linha = _i div Colunas_Caixa;
    
    var _xx = Pos_Caixa_X_Ofc + (_Coluna * Distancia);
    var _yy = Pos_Caixa_Y_Ofc + (_Linha * Distancia);
    
    if (point_in_rectangle(_Mouse_X, _Mouse_Y, _xx, _yy, _xx + Tamanho_Slot, _yy + Tamanho_Slot)) {
        
        if (mouse_check_button_pressed(mb_left)) {
            
            var _Item_Temporario = Slots_Caixa[_i];
            Slots_Caixa[_i] = oInventario.Item_Segurado;
            oInventario.Item_Segurado = _Item_Temporario;
        }
    }
}