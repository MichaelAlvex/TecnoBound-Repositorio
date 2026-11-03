HP_Monstro = 90;
tipo_monstro = "Corvo-da-Nova-Caledônia";

spd = 2;
spd_dash = 3.5;
dist_ataque = 80;    
dash_tempo_max = 25;  
dash_curva = 3;      
espera_max = 60;      

estado = "procurar";
tem_galho = false;
dir_dash = 0;
dash_tempo = 0;
acertou = false;

if (tem_galho == false) {
	spr_up = sCorvo_Cima; 
	spr_down = sCorvo_Baixo;
	spr_left = sCorvo_Esquerda; 
	spr_right = sCorvo_Direita;
	sprite_index = spr_down;
}

mover = function(_ang, _v) {
    var _dx = lengthdir_x(_v, _ang);
    var _dy = lengthdir_y(_v, _ang);
    var _bateu = false;

    if (place_meeting(x + _dx, y, oParede_Invisivel)) {
        var _s = sign(_dx);
        while (_s != 0 && !place_meeting(x + _s, y, oParede_Invisivel)) x += _s;
        _dx = 0; _bateu = true;
    }
    x += _dx;

    if (place_meeting(x, y + _dy, oParede_Invisivel)) {
        var _s = sign(_dy);
        while (_s != 0 && !place_meeting(x, y + _s, oParede_Invisivel)) y += _s;
        _dy = 0; _bateu = true;
    }
    y += _dy;
    return _bateu;
}