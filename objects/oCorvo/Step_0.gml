if (!instance_exists(oPlayer)) exit;

var _dist_p = point_distance(x, y, oPlayer.x + 16, oPlayer.y + 29);
var _dir_p  = point_direction(x, y, oPlayer.x + 16, oPlayer.y + 29);
var _olhar  = _dir_p;

switch (estado) {

    case "procurar":
        var _g = instance_nearest(x, y, oGalho_Corvo);
        if (_g == noone) { image_speed = 0; break; }   

        _olhar = point_direction(x, y, _g.x, _g.y);
        mover(_olhar, spd);
        image_speed = 1;

        if (place_meeting(x, y, _g)) {
            with (_g) instance_destroy();
            tem_galho = true;
			sprite_index = sCorvo_Baixo_Galho;
            estado = "aproximar";
        }
    break;

    case "aproximar":
        image_speed = 1;
        mover(_dir_p, spd);

        if (_dist_p <= dist_ataque) {
            estado = "estocada";
            dir_dash = _dir_p;
            dash_tempo = dash_tempo_max;
            acertou = false;
        }
    break;

    case "estocada":

        var _diff = angle_difference(_dir_p, dir_dash);
        dir_dash += clamp(_diff, -dash_curva, dash_curva);
        _olhar = dir_dash;

        var _bateu = mover(dir_dash, spd_dash);
        dash_tempo--;

        if (!acertou && place_meeting(x, y, oPlayer)) {
            acertou = true;
            oPlayer.HP_Player -= 1;
			tem_galho = false;
        }

        if (_bateu || acertou || dash_tempo <= 0) {
            estado = "espera";
            alarm[0] = espera_max;
        }
    break;

    case "espera":
        image_speed = 0;
        image_index = 0;
    break;
}

if (tem_galho == true) {
	spr_up = sCorvo_Cima_Galho; 
	spr_down = sCorvo_Baixo_Galho;
	spr_left = sCorvo_Esquerda_Galho; 
	spr_right = sCorvo_Direita_Galho;
	sprite_index = spr_down;
}

if (_olhar >= 45 && _olhar < 135)       sprite_index = spr_up;
else if (_olhar >= 135 && _olhar < 225) sprite_index = spr_left;
else if (_olhar >= 225 && _olhar < 315) sprite_index = spr_down;
else                                    sprite_index = spr_right;

