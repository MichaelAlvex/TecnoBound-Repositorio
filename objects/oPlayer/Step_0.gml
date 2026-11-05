if (room == Envio || instance_exists(oSalas_Sem_Player)) {
    visible = false;
} else {
    visible = true;
}

if (!instance_exists(oSalas_Sem_Player)){

if (IFrames > 0){
	IFrames--;
}

if (HP_Player <= 0){
	HP_Player = 5;
	IFrames = 50;
	Timer_Empurrao = 4;
	Cooldown_Ataque = 0;
	Estado = "Livre";
	VelH = 0;
	VelV = 0;
	room_goto(Room_0);
}

if (Lentidao) {
	Tempo_Lentidao--;
	Velocidade = Velocidade_Base * 0.5;
	
	if (Tempo_Lentidao <= 0) {
		Lentidao = false;
	}
} else {
	Velocidade = Velocidade_Base;
}

if (Player_Move == true){

	if (Timer_Empurrao > 0){
		Timer_Empurrao--;
	} else {

		switch (Estado){

			case "Livre":
				var _Direita = keyboard_check(ord("D"));
				var _Esquerda = keyboard_check(ord("A"));
				var _Baixo = keyboard_check(ord("S"));
				var _Cima = keyboard_check(ord("W"));

				var _Eixo_x = _Direita - _Esquerda;
				var _Eixo_y = _Baixo - _Cima;

				var _Movendo = (_Eixo_x != 0 || _Eixo_y != 0);

				if (_Movendo){
					var _Direcao = point_direction(0, 0, _Eixo_x, _Eixo_y);

					VelH = lengthdir_x(Velocidade, _Direcao);
					VelV = lengthdir_y(Velocidade, _Direcao);

					if (!Lentidao){
						if (keyboard_check_pressed(vk_space)){
							Estado = "Rolando";
							Timer_Rolagem = Duracao_Rolagem;
							Direcao_Rolagem = _Direcao;
						}
					}
					
				} else {
					VelH = 0;
					VelV = 0;
				}
			break;

			case "Rolando":
				VelH = lengthdir_x(VelRolagem, Direcao_Rolagem);
				VelV = lengthdir_y(VelRolagem, Direcao_Rolagem);

				image_speed = 1;

				if (Direcao_Rolagem >= 30 && Direcao_Rolagem <= 120){
					sprite_index = sPlayer_Rolando_Tras;
				} else if (Direcao_Rolagem > 120 && Direcao_Rolagem < 240){
					sprite_index = sPlayer_Rolando_Esquerda;
				} else if (Direcao_Rolagem >= 240 && Direcao_Rolagem <= 333){
					sprite_index = sPlayer_Rolando_Frente;
				} else {
					sprite_index = sPlayer_Rolando_Direita;
				}

				Timer_Rolagem--;

				if (Timer_Rolagem <= 0){
					Estado = "Livre";

					if (sprite_index == sPlayer_Rolando_Frente){
						sprite_index = sPlayer_Tras;
					} else if (sprite_index == sPlayer_Rolando_Esquerda){
						sprite_index = sPlayer_Esquerda;
					} else if (sprite_index == sPlayer_Rolando_Tras){
						sprite_index = sPlayer_Frente;
					} else {
						sprite_index = sPlayer_Direita;
					}
				}
			break;
		}

		if (place_meeting(x + VelH, y, oParede_Invisivel)){
			while (!place_meeting(x + sign(VelH), y, oParede_Invisivel)){
				x += sign(VelH);
			}
			VelH = 0;
		}
		x += VelH;

		if (place_meeting(x, y + VelV, oParede_Invisivel)){
			while (!place_meeting(x, y + sign(VelV), oParede_Invisivel)){
				y += sign(VelV);
			}
			VelV = 0;
		}
		y += VelV;

		switch (Estado){

			case "Livre":
				if (oInventario.Slot_Selecionado == 0){
					if (!instance_exists(oBroca)){
						instance_create_layer(x, y, "Instances", oBroca);
					}
				} else {
					if (instance_exists(oBroca)){
						instance_destroy(oBroca);
					}
				}

				if (VelH != 0 || VelV != 0){
					image_speed = 1;

					if (VelH > 0){
						sprite_index = sPlayer_Direita;
					} else if (VelH < 0){
						sprite_index = sPlayer_Esquerda;
					} else if (VelV > 0){
						sprite_index = sPlayer_Frente;
					} else if (VelV < 0){
						sprite_index = sPlayer_Tras;
					}
				} else {
					image_speed = 0;
					image_index = 0;
				}
			break;
		}

		if (oInventario.Slot_Selecionado == 0){

			if (mouse_check_button(mb_left)){
				var _Dir_Mouse = point_direction(x, y + 27, mouse_x, mouse_y);

				if (_Dir_Mouse >= 30 && _Dir_Mouse <= 120){
					sprite_index = sPlayer_Tras;
				} else if (_Dir_Mouse > 120 && _Dir_Mouse < 240){
					sprite_index = sPlayer_Esquerda;
				} else if (_Dir_Mouse >= 240 && _Dir_Mouse <= 333){
					sprite_index = sPlayer_Frente;
				} else {
					sprite_index = sPlayer_Direita;
				}

				if (!instance_exists(oBroca)){
					var _Broca = instance_create_layer(x, y, "Instances", oBroca);
					_Broca.x = x;
					_Broca.y = y;
				}
			} else {
				if (instance_exists(oBroca)){
					instance_destroy(oBroca);
				}
			}

		} else {
			if (instance_exists(oBroca)){
				instance_destroy(oBroca);
			}
		}
	}
}

if (Cooldown_Ataque > 0){
	Cooldown_Ataque--;
}

switch (Estado){

	case "Livre":
    if (oInventario.Slot_Selecionado == 0 && mouse_check_button(mb_left)){

        var _Monstro = instance_position(mouse_x, mouse_y, oMonstro_Mae);

        if (_Monstro != noone){
            var _Px = x;
            var _Py = y + 27;

            var _Mx = (_Monstro.bbox_left + _Monstro.bbox_right) / 2;
            var _My = (_Monstro.bbox_top + _Monstro.bbox_bottom) / 2;

            if (point_distance(_Px, _Py, _Mx, _My) <= 44 && Cooldown_Ataque <= 0){
                _Monstro.HP_Monstro -= 50;
                _Monstro.Monstro_Tremer_Timer = 10;
                Cooldown_Ataque = 12;

                if (_Monstro.HP_Monstro <= 0){
                    if (variable_global_exists("monstros_derrotados")) {
                        var _tipo = _Monstro.tipo_monstro;
                        if (struct_exists(global.monstros_derrotados, _tipo)) {
                            global.monstros_derrotados[$ _tipo] += 1;
                        }
                    }
                    with (_Monstro) instance_destroy();
                }
            }
        }
    }
break;
}
}

var _movendo = (abs(VelH) > 0.1 || abs(VelV) > 0.1 ); 

if (_movendo) {
    contador_movimento ++;

    if (contador_movimento >= intervalo_passo) {
        global.stat_passos += 1; 
        contador_movimento = 0;

    }
} else {
    contador_movimento = 0; 
}

var novos = global.stat_total_monstros - monstros_anterior;
if (novos > 0) {
    energia = min(energia + novos, max_celulas);
}
monstros_anterior = global.stat_total_monstros;

if (keyboard_check_pressed(ord("Q")) && energia > 0 && instance_exists(oPlayer)) {
    if (oPlayer.HP_Player < oPlayer.HP_Max_Player) {
        energia -= 1;
        oPlayer.HP_Player = min(oPlayer.HP_Player + cura_por_raio, oPlayer.HP_Max_Player);
    }
}

var novas_pedras = global.stat_total_minerios - pedras_anterior;
pedras_anterior = global.stat_total_minerios;

if (novas_pedras > 0) {
    pedras_acumuladas += novas_pedras;

    var ganho = pedras_acumuladas div pedras_por_energia;   
    if (ganho > 0) {
        energia = min(energia + ganho, max_celulas);
        pedras_acumuladas = pedras_acumuladas mod pedras_por_energia; 
    }
}