function criar_magma(_x, _y) {
    if (position_meeting(_x, _y, oParede_Invisivel)) return noone;
    var _m = instance_position(_x, _y, oMagma);
    if (_m != noone) { _m.timer = 0; return _m; } 
    return instance_create_layer(_x, _y, "Instances", oMagma);
}

function esta_queimado() {
    return instance_exists(oPlayer)
        && variable_instance_exists(oPlayer, "queimadura_ate")
        && current_time < oPlayer.queimadura_ate;
}

function aplicar_queimadura(_dano) {
    return esta_queimado() ? _dano * 0.5 : _dano;
}