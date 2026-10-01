Tamanho_Caixa = 12; 
Slots_Caixa = array_create(Tamanho_Caixa, noone);
Colunas_Caixa = 4;
Distancia = 20; 
Tamanho_Slot = 20; 

Pos_Caixa_X_Ofc = (display_get_gui_width() / 2) + 200; 
Pos_Caixa_Y_Ofc = (display_get_gui_height() / 2) - 100;

array_copy(Slots_Caixa, 0, oInventario.Inventario, 3, 12);

