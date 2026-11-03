var _dx = lengthdir_x(spd, direction);
var _dy = lengthdir_y(spd, direction);

var _bateu = false;

if (place_meeting(x + _dx, y, oParede_Invisivel)) {
    var _s = sign(_dx);
    while (!place_meeting(x + _s, y, oParede_Invisivel)) x += _s;
    _dx = 0;
    _bateu = true;
}
x += _dx;

if (place_meeting(x, y + _dy, oParede_Invisivel)) {
    var _s = sign(_dy);
    while (!place_meeting(x, y + _s, oParede_Invisivel)) y += _s;
    _dy = 0;
    _bateu = true;
}
y += _dy;

if (_bateu && instance_exists(oPlayer)) {
    direction = point_direction(x, y, oPlayer.x + 16, oPlayer.y + 29);
}

if (direction >= 45 && direction < 135)       sprite_index = spr_up;
else if (direction >= 135 && direction < 225) sprite_index = spr_left;
else if (direction >= 225 && direction < 315) sprite_index = spr_down;
else                                          sprite_index = spr_right;