Inventario_Aberto = false;
Tamanho_HotBar = 3;  
Linhas = 3;
Colunas = 4;        
Tamanho_Inventario = Tamanho_HotBar + (Linhas * Colunas); 
Inventario = array_create(Tamanho_Inventario, noone);
Distancia = 20;
Tamanho_Slot = 20;
Inventario[0] = {nome: "Broca", sprite: sBroca_Inventario, quantidade: 1, descricao: "Item"};
Item_Segurado = noone; 
Slot_Selecionado = 0;

function Pegar_Posicao_Slot(_indice) {
    var _xx, _yy;
    
    if (_indice < Tamanho_HotBar) {
     
        var _Largura_Hotbar = ((Tamanho_HotBar - 1) * Distancia) + Tamanho_Slot;
        var _Margem_X = (display_get_gui_width() / 2) - (_Largura_Hotbar / 2);
        var _Margem_Y = (display_get_gui_height() / 100) * 85; 
        
        _xx = _Margem_X + (_indice * Distancia);
        _yy = _Margem_Y;
    } 
    else {
    
        var _Indice_Tablet = _indice - Tamanho_HotBar; 
        
        var _Coluna = _Indice_Tablet mod Colunas;
        var _Linha = _Indice_Tablet div Colunas;
        var _Largura_Inv = ((Colunas - 1) * Distancia) + Tamanho_Slot;
        var _Altura_Inv = ((Linhas - 1) * Distancia) + Tamanho_Slot;
        
		var _Largura_Tablet = sprite_get_width(sTablet_Fundo);
        var _Altura_Tablet = sprite_get_height(sTablet_Fundo);
		var _Centro_Tablet_X = oMenu_Tablet.Pos_Fundo_X + (_Largura_Tablet / 2);
        var _Centro_Tablet_Y = oMenu_Tablet.Pos_Fundo_Y + (_Altura_Tablet / 2);
        
        var _Margem_X = _Centro_Tablet_X - (_Largura_Inv / 2);
        var _Margem_Y = _Centro_Tablet_Y - (_Altura_Inv / 2);
        
        _xx = _Margem_X + (_Coluna * Distancia);
        _yy = _Margem_Y + (_Linha * Distancia); 
    }
    
    return { x: _xx, y: _yy }; 
}