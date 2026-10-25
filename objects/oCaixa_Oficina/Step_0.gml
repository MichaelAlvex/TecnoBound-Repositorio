var _Mouse_X = device_mouse_x_to_gui(0);
var _Mouse_Y = device_mouse_y_to_gui(0);

if (mouse_check_button_pressed(mb_left)) {
    
    for (var i = 0; i < Tamanho_Caixa; i++) {
        
        var _Coluna = i mod Colunas_Caixa;
        var _Linha = i div Colunas_Caixa;
        
        var _xx = Pos_Caixa_X_Ofc + (_Coluna * Distancia);
        var _yy = Pos_Caixa_Y_Ofc + (_Linha * Distancia);
        
        if (_Mouse_X >= _xx && _Mouse_X <= _xx + Tamanho_Slot && _Mouse_Y >= _yy && _Mouse_Y <= _yy + Tamanho_Slot) {
            
            var _Item_Slot = Slots_Caixa[i];
            
            if (oInventario.Item_Segurado == noone) {
                if (_Item_Slot != noone) {
                    oInventario.Item_Segurado = _Item_Slot;
                    Slots_Caixa[i] = noone;
                }
            } 
            else {
                if (_Item_Slot == noone) {
                    Slots_Caixa[i] = oInventario.Item_Segurado;
                    oInventario.Item_Segurado = noone;
                } else {
                    if (_Item_Slot.nome == oInventario.Item_Segurado.nome) {
                        Slots_Caixa[i].quantidade += oInventario.Item_Segurado.quantidade;
                        oInventario.Item_Segurado = noone;
                    } 
                    else {
                        var _Bolha = Slots_Caixa[i];
                        Slots_Caixa[i] = oInventario.Item_Segurado;
                        oInventario.Item_Segurado = _Bolha;
                    }
                }
            }
            
            break; 
        }
    }
}