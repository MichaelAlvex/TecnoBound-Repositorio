draw_set_font(Font1);
Tablet_Aberto = false;
Tela_Atual = "home";
Pos_Fundo_X = (display_get_gui_width() / 2) - 140;
Pos_Fundo_Y = (display_get_gui_height() / 2) - 70;
Pos_Y_Apps1 = Pos_Fundo_Y + 10;
Pos_Y_Apps2 = Pos_Fundo_Y + 80;
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

Conq_Colunas = 4;
Conq_Tam = 40;
Conq_Espaco = 56;
Conq_Inicio_X = Pos_Fundo_X + 25;
Conq_Inicio_Y = Pos_Fundo_Y + 35;

if (!variable_global_exists("stat_passos")) global.stat_passos = 0;
if (!variable_global_exists("stat_andares")) global.stat_andares = 0;
if (!variable_global_exists("stat_total_minerios")) global.stat_total_minerios = 0;
if (!variable_global_exists("stat_total_monstros")) global.stat_total_monstros = 0;
if (!variable_global_exists("stat_pedidos")) global.stat_pedidos = 0;
if (!variable_global_exists("minerios_quebrados")) global.minerios_quebrados = {};
if (!variable_global_exists("monstros_derrotados")) global.monstros_derrotados = {};

global.conquistas = [
    {
        nome: "Primeiros Passos",
        descricao: "Ande seus primeiros passos pelo mapa.",
        sprite: sConq_PrimeirosPassos,
        desbloqueada: false,
        condicao: function() { return global.stat_passos >= 10; }
    },
    {
        nome: "Minerador Iniciante",
        descricao: "Quebre um total de 5 minérios.",
        sprite: sConq_MineradorIniciante,
        desbloqueada: false,
        condicao: function() { return global.stat_total_minerios >= 5; }
    },
    {
        nome: "Caçador de monstros",
        descricao: "Derrote o seu primeiro monstro.",
        sprite: sConq_Cacador,
        desbloqueada: false,
        condicao: function() {
            var _slime = global.monstros_derrotados[$ "Slime"] ?? 0;
            var _morcego = global.monstros_derrotados[$ "Morcego"] ?? 0;
            return (_slime + _morcego) >= 1;
        }
    },
    {
        nome: "Entregador Oficial",
        descricao: "Conclua o seu primeiro pedido.",
        sprite: sConq_EntregadorOficial,
        desbloqueada: false,
        condicao: function() { return global.stat_pedidos >= 1; }
    },
    {
        nome: "Explorador",
        descricao: "Desça 5 andares da mina.",
        sprite: sConq_Explorador,
        desbloqueada: false,
        condicao: function() { return global.stat_andares >= 5; }
    },
    {
        nome: "Minerador Experiente",
        descricao: "Quebre um total de 50 minérios.",
        sprite: sConq_MineradorExperiente,
        desbloqueada: false,
        condicao: function() { return global.stat_total_minerios >= 50; }
    },
    {
        nome: "Exterminador",
        descricao: "Derrote um total de 20 monstros.",
        sprite: sConq_Exterminador,
        desbloqueada: false,
        condicao: function() { return global.stat_total_monstros >= 20; }
    },
    {
        nome: "Entregador Experiente",
        descricao: "Conclua 10 pedidos.",
        sprite: sConq_EntregadorExperiente,
        desbloqueada: false,
        condicao: function() { return global.stat_pedidos >= 10; }
    }
];
