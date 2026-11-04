randomize();

if (instance_number(oPlayer) > 1){
    instance_destroy();
    exit;
}

Timer_Empurrao = 4;
IFrames = 50;
HP_Max_Player = 10;
HP_Player = 10;
Player_Move = true
depth = 2;
Velocidade = 1.5;
VelH = 0;
VelV = 0;
Estado = "Livre";
VelRolagem = 5;
Duracao_Rolagem = 15;
Timer_Rolagem = 0;
Direcao_Rolagem = 0;
Cooldown_Ataque = 0;
Direcao_Visual = "Frente";
Velocidade_Base = 1.5;
Lentidao = false;
Tempo_Lentidao = 0;

display_set_gui_size(640, 360);

instance_create_layer(0, 0, "Instances", oInventario);
instance_create_layer(0, 0, "Instances", oMenu_Tablet);

global.total_passos = 0;
contador_movimento = 0;
intervalo_passo = 10;


max_celulas   = 5;      
energia       = 0;      
cura_por_raio = 1;     
espaco        = 4;     
pos_x         = 10;     
pos_y         = 28;

monstros_anterior = global.stat_total_monstros;

pedras_por_energia = 5;
pedras_anterior    = global.stat_total_minerios;
pedras_acumuladas  = 0;