draw_set_font(-1);
var _Centro_Slot = Tamanho_Slot / 2;
var _Mouse_X = device_mouse_x_to_gui(0);
var _Mouse_Y = device_mouse_y_to_gui(0);
var _Item_Hover = noone; 

if (Inventario_Aberto){
	draw_set_alpha(0.5);
	draw_set_colour(c_black);
	draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
	draw_set_alpha(1);
}

var _Limite_Desenho = Tamanho_HotBar;

if (Inventario_Aberto){
	_Limite_Desenho = Tamanho_Inventario;
}

for (var i = 0; i < _Limite_Desenho; i++){
	var _Coluna = i mod Colunas;
	var _Linha = i div Colunas;
	var _xx = Margem_X + (_Coluna * Distancia);
	var _yy = Margem_Y - (_Linha * Distancia);
	
	draw_sprite(sSlot, 0, _xx, _yy);
	
	if (i == Slot_Selecionado){
		draw_sprite(sSlot_Selecionado, 0, _xx, _yy);
	}
		

    if (Inventario[i] != noone){
        var _Item = Inventario[i];
        draw_sprite(_Item.sprite, 0, _xx + _Centro_Slot, _yy + _Centro_Slot);
        
        if (_Item.quantidade > 1){
            draw_set_colour(c_white);
            draw_set_halign(fa_right);
            draw_set_valign(fa_bottom);
            draw_text_transformed(_xx + Tamanho_Slot - 3, _yy + Tamanho_Slot, string(_Item.quantidade), 0.3, 0.3, 0);
            draw_set_halign(fa_left);
            draw_set_valign(fa_top);
        }
        
        if (Inventario_Aberto && Item_Segurado == noone){
            if (_Mouse_X >= _xx && _Mouse_X <= _xx + Tamanho_Slot && _Mouse_Y >= _yy && _Mouse_Y <= _yy + Tamanho_Slot){
                _Item_Hover = _Item; 
            }
        }
	}
}

if (Item_Segurado != noone){
	draw_sprite(Item_Segurado.sprite, 0, _Mouse_X, _Mouse_Y);
	
	if (Item_Segurado.quantidade > 1){
		draw_set_colour(c_white);
		draw_set_halign(fa_right);
		draw_set_valign(fa_bottom);
		draw_text_transformed(_Mouse_X + (Tamanho_Slot / 2) - 3, _Mouse_Y + (Tamanho_Slot / 2), string(Item_Segurado.quantidade), 0.3, 0.3, 0);
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
	}
}

if (_Item_Hover != noone){
    var _Texto_Caixa = _Item_Hover.nome + "\n" + _Item_Hover.descricao;
    var _Largura_Caixa = string_width(_Texto_Caixa) * 0.55;
    var _Altura_Caixa = string_height(_Texto_Caixa) * 0.8;
    var _Caixa_X = _Mouse_X + 5;
    var _Caixa_Y = _Mouse_Y + 5;
    
    draw_set_alpha(0.9);
    draw_set_colour(c_black);
    draw_rectangle(_Caixa_X, _Caixa_Y, _Caixa_X + _Largura_Caixa, _Caixa_Y + _Altura_Caixa, 0);
    
    draw_set_alpha(1);
    draw_set_colour(c_white);
    draw_rectangle(_Caixa_X, _Caixa_Y, _Caixa_X + _Largura_Caixa, _Caixa_Y + _Altura_Caixa, 1);
    
    draw_text_transformed(_Caixa_X + 5, _Caixa_Y + 5, _Texto_Caixa, 0.4, 0.4, 0);
}