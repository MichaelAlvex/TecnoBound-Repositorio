if (room != rOficina) {
    exit; 
}

draw_set_font(-1);
draw_set_font(Font1);

if (global.faseAtual == 1) {
    var _receita_atual = receitas[$ global.perifericoEscolhido];
    var _total_itens = array_length(_receita_atual);
    var _altura_caixa = 40 + (_total_itens * 25);
    
    draw_sprite_stretched(sCaixa_Receitas, 0, Pos_Receita_X, Pos_Receita_Y, Largura_Caixa, _altura_caixa);
    draw_text_transformed(Pos_Receita_X + 10, Pos_Receita_Y + 8, "Receita: " + string(global.perifericoEscolhido), 0.5, 0.5, 0);
    
    for (var i = 0; i < _total_itens; i++) {
        var _item = _receita_atual[i];
        var _item_y = Pos_Receita_Y + 30 + (i * 24);
        
        if (sprite_exists(_item.sprite)) {
            draw_sprite(_item.sprite, 0, Pos_Receita_X + 20, _item_y + 6);
        }
        
        var _texto_item = _item.nome + " x" + string(_item.quantidade);
        draw_text_transformed(Pos_Receita_X + 45, _item_y, _texto_item, 0.4, 0.4, 0);
    }
} else if (global.faseAtual == 2) {
    var _receita_atual = receitas[$ global.componenteEscolhido];
    var _total_itens = array_length(_receita_atual);
    var _altura_caixa = 40 + (_total_itens * 25);
    
    draw_sprite_stretched(sCaixa_Receitas, 0, Pos_Receita_X, Pos_Receita_Y, Largura_Caixa, _altura_caixa);
    draw_text_transformed(Pos_Receita_X + 10, Pos_Receita_Y + 8, "Receita: " + string(global.componenteEscolhido), 0.5, 0.5, 0);
    
    for (var i = 0; i < _total_itens; i++) {
        var _item = _receita_atual[i];
        var _item_y = Pos_Receita_Y + 30 + (i * 24);
        
        if (sprite_exists(_item.sprite)) {
            draw_sprite(_item.sprite, 0, Pos_Receita_X + 20, _item_y + 6);
        }
        
        var _texto_item = _item.nome + " x" + string(_item.quantidade);
        draw_text_transformed(Pos_Receita_X + 45, _item_y, _texto_item, 0.4, 0.4, 0);
    }
} else if (global.faseAtual == 3) {
    var _receita_atual = receitas[$ global.computadorEscolhido];
    var _total_itens = array_length(_receita_atual);
    var _altura_caixa = 40 + (_total_itens * 25);
    
    draw_sprite_stretched(sCaixa_Receitas, 0, Pos_Receita_X, Pos_Receita_Y, Largura_Caixa, _altura_caixa);
    draw_text_transformed(Pos_Receita_X + 10, Pos_Receita_Y + 8, "Receita: " + string(global.computadorEscolhido), 0.5, 0.5, 0);
    
    for (var i = 0; i < _total_itens; i++) {
        var _item = _receita_atual[i];
        var _item_y = Pos_Receita_Y + 30 + (i * 24);
        
        if (sprite_exists(_item.sprite)) {
            draw_sprite(_item.sprite, 0, Pos_Receita_X + 20, _item_y + 6);
        }
        
        var _texto_item = _item.nome + " x" + string(_item.quantidade);
        draw_text_transformed(Pos_Receita_X + 45, _item_y, _texto_item, 0.4, 0.4, 0);
    }
}