Opcoes_Abertas = false;
Pos_Fundo_X = (display_get_gui_width() / 2) - 140;
Pos_Fundo_Y = (display_get_gui_height() / 2) - 70;
stat_scroll = 0;
global.stat_surface = -1;

Conf_Arrastando = -1;
Conf_Linha = 22;
Conf_Vol_X = Pos_Fundo_X + 55;
Conf_Vol_Y = Pos_Fundo_Y + 55;
Conf_Vol_W = 80;
Conf_Tela_X = Pos_Fundo_X + 185;
Conf_Tela_Y = Pos_Fundo_Y + 46;
Conf_Tela_W = 85;
Conf_Tela_H = 18;

Conf_Grupos_Prontos = false;

configuracoes_iniciar();

var _n_tela_opcoes = variable_global_exists("cfg_tela_opcoes") ? array_length(global.cfg_tela_opcoes) : 3;

global.opcoes_surface = -1;
if (!variable_global_exists("inventario_salvo")) global.inventario_salvo = undefined;
Opcoes_Scroll = 0;
Opcoes_Surface_K = 1;
Inv_Espera = 0;
Opcoes_Barra_Arrastando = false;
Opcoes_Barra_Offset = 0;

Opcoes_Area_X = Pos_Fundo_X + 5;
Opcoes_Area_Y = Pos_Fundo_Y + 28;
Opcoes_Area_W = sprite_get_width(sTablet_Fundo) - 15;
Opcoes_Area_H = sprite_get_height(sTablet_Fundo) - 40;
Opcoes_Barra_X = Pos_Fundo_X + sprite_get_width(sTablet_Fundo) - 7;
Opcoes_Barra_W = 3;

Opcoes_Btn_W = 100;
Opcoes_Btn_H = 20;
Opcoes_Btn_Salvar_X = Pos_Fundo_X + 25;
Opcoes_Btn_Carregar_X = Pos_Fundo_X + 155;
Opcoes_Btn_Y = max(Conf_Vol_Y + (3 * Conf_Linha) + 14, Conf_Tela_Y + (_n_tela_opcoes * Conf_Linha)) + 16;

Opcoes_Altura = (Opcoes_Btn_Y + Opcoes_Btn_H + 10) - Opcoes_Area_Y;
Opcoes_Max_Scroll = max(0, Opcoes_Altura - Opcoes_Area_H);