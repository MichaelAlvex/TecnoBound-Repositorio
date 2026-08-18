randomize();

Velocidade = 1.5;
VelH = 0;
VelV = 0;
Estado = "Livre";
VelRolagem = 5;
Duracao_Rolagem = 15;
Timer_Rolagem = 0;
Direcao_Rolagem = 0;

display_set_gui_size(480, 270);
window_set_size(1200, 900);

instance_create_layer(0, 0, "Instances", oInventario)