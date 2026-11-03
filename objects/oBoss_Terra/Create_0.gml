depth = oPlayer.depth + 100;
tipo_monstro = "Boss de terra";
HP_Monstro = 500;
HP_Max = HP_Monstro;
hp_visual = HP_Monstro;
hp_guardado = HP_Monstro;
invulneravel = true;

tempo_idle = 90;
tempo_aviso = 40;
tempo_max_vulneravel = 400;
qtd_galhos = 8;
raio_galhos = 192;
dist_min_galho = 40;

pedra = noone;

sprites = {
    idle:       sBossTerra_Idle,
    aviso:      sBossTerra_Aviso,
    galhos:     sBossTerra_Galhos,
    protegido:  sBossTerra_Protegido,
    vulneravel: sBossTerra_Vulneravel,
    dano:       sBossTerra_Dano,
};

function set_sprite(_nome) {
    sprite_index = sprites[$ _nome];
    image_xscale = 1;
}

estado = undefined;
timer = 0;
mudou = false;
indice_ataque = 0;
mostrar_aviso = false;

function mudar_estado(_novo, _invul = true) {
    estado = _novo;
    timer = 0;
    mudou = true;
    image_index = 0;
    mostrar_aviso = false;
    invulneravel = _invul;
}

function celula_livre(_cx, _cy) {
    if (position_meeting(_cx, _cy, oParede_Invisivel)) return false;
	if (collision_rectangle(_cx - 8, _cy - 8, _cx + 7, _cy + 7, id, true, false) != noone) return false;
    if (point_distance(_cx, _cy, x, y) < dist_min_galho) return false;
    if (instance_exists(oPlayer) && point_distance(_cx, _cy, oPlayer.x, oPlayer.y) < 20) return false;

    var _livre = true;
    with (oGalho) {
        if (x == _cx && y == _cy) _livre = false;
    }
    return _livre;
}

function criar_galhos() {
    var _gx = floor(x / 16) * 16;
    var _gy = floor(y / 16) * 16;
    var _celulas = floor(raio_galhos / 16);
    var _criados = 0;
    var _tentativas = 0;

    while (_criados < qtd_galhos && _tentativas < 200) {
        _tentativas++;
        var _cx = _gx + irandom_range(-_celulas, _celulas) * 16;
        var _cy = _gy + irandom_range(-_celulas, _celulas) * 16;

        if (!celula_livre(_cx, _cy)) continue;

        var _g = instance_create_layer(_cx, _cy, "Instances", oGalho);
        _g.dono = id;
        _g.espera = 30 + _criados * 6;

        if (_criados == 0) _g.cria = "pedra";
        else if (_criados == 1) _g.cria = "ovo";
		else if (_criados == 2) _g.cria = "galho";

        _criados++;
    }
}

function estado_idle() {
    set_sprite("idle");

    if (timer >= tempo_idle) {
        mudar_estado(ataques[indice_ataque]);
        indice_ataque = (indice_ataque + 1) % array_length(ataques);
    }
}

function estado_aviso_galhos() {
    if (timer == 0) {
        set_sprite("aviso");
        pedra = noone;
        criar_galhos();
        mostrar_aviso = true;
    }

    if (timer >= tempo_aviso) mudar_estado(estado_galhos);
}

function estado_galhos() {
    if (timer == 0) set_sprite("galhos");

    if (pedra != noone && !instance_exists(pedra)) {
        mudar_estado(estado_vulneravel, false);
    } else if (timer > 5 && instance_number(oGalho) == 0) {
        if (instance_exists(pedra)) mudar_estado(estado_protegido);
        else mudar_estado(estado_vulneravel, false);
    }
}

function estado_protegido() {
    if (timer == 0) set_sprite("protegido");

    if (!instance_exists(pedra)) mudar_estado(estado_vulneravel, false);
}

function estado_vulneravel() {
    if (timer == 0) set_sprite("vulneravel");

    if (HP_Monstro < hp_guardado) {
        hp_guardado = HP_Monstro;
        mudar_estado(estado_dano);
    } else if (timer >= tempo_max_vulneravel) {
        mudar_estado(estado_aviso_galhos);
    }
}

function estado_dano() {
    if (timer == 0) set_sprite("dano");

    if (timer >= 40) mudar_estado(estado_aviso_galhos);
}

ataques = [estado_aviso_galhos];

mask_index = sBossTerra_Idle;

parede = instance_create_layer(x, y, "Instances", oParede_Invisivel);
parede.mask_index = sBossTerra_Idle;
parede.visible = false;

mudar_estado(estado_idle);