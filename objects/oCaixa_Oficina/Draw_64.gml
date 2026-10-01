for (var _i = 0; _i < Tamanho_Caixa; _i++) {
    var _Coluna = _i mod Colunas_Caixa;
    var _Linha = _i div Colunas_Caixa;
    
    var _xx = Pos_Caixa_X_Ofc + (_Coluna * Distancia);
    var _yy = Pos_Caixa_Y_Ofc + (_Linha * Distancia);
    
    draw_sprite(sSlot, 0, _xx, _yy);
    
    if (Slots_Caixa[_i] != noone) {
        draw_sprite(Slots_Caixa[_i].sprite, 0, _xx, _yy);
        
        if (Slots_Caixa[_i].quantidade > 1) {
            draw_set_colour(c_white);
            draw_set_halign(fa_right);
            draw_set_valign(fa_bottom);
            draw_text_transformed(_xx + Tamanho_Slot - 2, _yy + Tamanho_Slot, string(Slots_Caixa[_i].quantidade), 0.4, 0.4, 0);
            draw_set_halign(fa_left);
            draw_set_valign(fa_top);
        }
    }
}