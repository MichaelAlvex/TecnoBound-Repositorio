if (!instance_exists(oPlayer)) exit;

var _dist = point_distance(x, y, oPlayer.x, oPlayer.y);
var _dir  = point_direction(x, y, oPlayer.x + 16, oPlayer.y + 29);

if (estado == "perseguir" && _dist <= dist_parar)  estado = "atirar";
if (estado == "atirar"    && _dist >  dist_voltar) estado = "perseguir";

if (_dir >= 45 && _dir < 135)       sprite_index = spr_up;
else if (_dir >= 135 && _dir < 225) sprite_index = spr_left;
else if (_dir >= 225 && _dir < 315) sprite_index = spr_down;
else                                sprite_index = spr_right;

if (estado == "perseguir") {
    image_speed = 1;

    var _dx = lengthdir_x(spd, _dir);
    var _dy = lengthdir_y(spd, _dir);

    if (place_meeting(x + _dx, y, oParede_Invisivel)) {
        var _s = sign(_dx);
        while (_s != 0 && !place_meeting(x + _s, y, oParede_Invisivel)) x += _s;
        _dx = 0;
    }
    x += _dx;

    if (place_meeting(x, y + _dy, oParede_Invisivel)) {
        var _s = sign(_dy);
        while (_s != 0 && !place_meeting(x, y + _s, oParede_Invisivel)) y += _s;
        _dy = 0;
    }
    y += _dy;

    if (cooldown > 0) cooldown--;
}
else if (estado == "atirar") {
    image_speed = 0;
    image_index = 0;

    cooldown--;
    if (cooldown <= 0) {
        var _p = instance_create_layer(x, y, layer, oProjetil_Semente);
        _p.direction   = _dir;
        _p.image_angle = _dir;
        _p.speed       = vel_semente;
        cooldown = cooldown_max;
    }
}