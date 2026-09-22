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
		
		if (keyboard_check_pressed(vk_space)){
			Estado = "Rolando";
			Timer_Rolagem = Duracao_Rolagem;
			Direcao_Rolagem = _Direcao;
		}
	} else{
		VelH = 0;
		VelV = 0;
	}
	break;
	
	case "Rolando":
	
	VelH = lengthdir_x(VelRolagem, Direcao_Rolagem);
	VelV = lengthdir_y(VelRolagem, Direcao_Rolagem);
	
	Timer_Rolagem--;
	
	if (Timer_Rolagem <= 0){
		Estado = "Livre";
	}
	break;
}

if (place_meeting (x + VelH, y, oParede_Invisivel)){
	while (!place_meeting(x + sign(VelH), y, oParede_Invisivel)){
		x += sign(VelH);
	}
	VelH = 0;
}
x += VelH;

if (place_meeting (x, y + VelV, oParede_Invisivel)){
	while (!place_meeting(x, y + sign(VelV), oParede_Invisivel)){
		y += sign(VelV);
	}
	VelV = 0;
}
y += VelV;



if (oInventario.Slot_Selecionado == 0){
	if (!instance_exists(oBroca)){
		instance_create_layer(x, y, "Instances", oBroca);
	}
}else {
	if(instance_exists(oBroca)){
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
			sprite_index = sPlayer_Direita
			}
		
		if (!instance_exists(oBroca)){
			instance_create_layer(x, y, "Instances", oBroca);
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