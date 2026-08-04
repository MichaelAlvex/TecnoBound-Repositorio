Inventario_Aberto = false;
Tamanho_HotBar = 10;
Linhas = 4;
Colunas = 10;
Tamanho_Inventario = Linhas * Colunas;
Inventario = array_create(Tamanho_Inventario, noone);
Distancia = 20;
Tamanho_Slot = 20;
var _Largura_Grade = ((Colunas - 1) * Distancia) + Tamanho_Slot;
Margem_X = (display_get_gui_width() / 2) - (_Largura_Grade / 2);
Margem_Y = (display_get_gui_height() / 100) * 85 - 5;
Inventario[0] = {nome: "Picareta", sprite: sPicareta, quantidade: 1, descricao: "Item"};
Item_Segurado = noone; 
Slot_Selecionado = 0;

