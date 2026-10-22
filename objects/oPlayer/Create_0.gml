randomize();

if (instance_number(oPlayer) > 1){
    instance_destroy();
    exit;
}

Timer_Empurrao = 4;
IFrames = 50;
HP_Player = 5;
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
window_set_size(1280, 720);

instance_create_layer(0, 0, "Instances", oInventario);
instance_create_layer(0, 0, "Instances", oMenu_Tablet)