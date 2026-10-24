draw_set_font(-1);
var _Centro_Slot = Tamanho_Slot / 2;
var _Mouse_X = device_mouse_x_to_gui(0);
var _Mouse_Y = device_mouse_y_to_gui(0);
var _Item_Hover = noone; 

for (var _i = 0; _i < Tamanho_Caixa; _i++) {
    var _Coluna = _i mod Colunas_Caixa;
    var _Linha = _i div Colunas_Caixa;
    
    var _xx = Pos_Caixa_X_Ofc + (_Coluna * Distancia);
    var _yy = Pos_Caixa_Y_Ofc + (_Linha * Distancia);
    
    var _centro_x = _xx + _Centro_Slot;
    var _centro_y = _yy + _Centro_Slot;
    
    draw_sprite(sSlot, 0, _centro_x, _centro_y);
    
    if (Slots_Caixa[_i] != noone) {
        var _Item = Slots_Caixa[_i];
        
        draw_sprite(_Item.sprite, 0, _centro_x + 10, _centro_y + 10);
        
        if (_Item.quantidade > 1) {
            draw_set_colour(c_white);
            draw_set_halign(fa_right);
            draw_set_valign(fa_bottom);
            draw_text_transformed(_xx + 30 - 3, _yy + 30, string(_Item.quantidade), 0.3, 0.3, 0);
            draw_set_halign(fa_left);
            draw_set_valign(fa_top);
        }
        
        if (oInventario.Item_Segurado == noone) {
            if (_Mouse_X >= _xx && _Mouse_X <= _xx + Tamanho_Slot && _Mouse_Y >= _yy && _Mouse_Y <= _yy + Tamanho_Slot) {
                _Item_Hover = _Item; 
            }
        }
    }
}

if (oInventario.Item_Segurado != noone) {
    draw_sprite(oInventario.Item_Segurado.sprite, 0, _Mouse_X, _Mouse_Y);

    if (oInventario.Item_Segurado.quantidade > 1) {
        draw_set_colour(c_white);
        draw_set_halign(fa_right);
        draw_set_valign(fa_bottom);
        draw_text_transformed(_Mouse_X + _Centro_Slot - 3, _Mouse_Y + _Centro_Slot, string(oInventario.Item_Segurado.quantidade), 0.3, 0.3, 0);
        draw_set_halign(fa_left);
        draw_set_valign(fa_top);
    }
}

if (_Item_Hover != noone) {
    var _Texto_Caixa = _Item_Hover.nome + "\n" + _Item_Hover.descricao;
    var _Largura_Caixa = string_width(_Texto_Caixa) * 0.55;
    var _Altura_Caixa = string_height(_Texto_Caixa) * 0.8;
    var _Caixa_X = _Mouse_X + 5;
    var _Caixa_Y = _Mouse_Y + 5;
    
    draw_set_alpha(0.9);
    draw_set_colour(c_black);
    draw_rectangle(_Caixa_X, _Caixa_Y, _Caixa_X + _Largura_Caixa, _Caixa_Y + _Altura_Caixa, false);
    
    draw_set_alpha(1);
    draw_set_colour(c_white);
    draw_rectangle(_Caixa_X, _Caixa_Y, _Caixa_X + _Largura_Caixa, _Caixa_Y + _Altura_Caixa, true);
    
    draw_text_transformed(_Caixa_X + 5, _Caixa_Y + 5, _Texto_Caixa, 0.4, 0.4, 0);
}