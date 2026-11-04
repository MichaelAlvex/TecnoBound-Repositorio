objeto_drop = oPerovskita;
depth = oPlayer.depth + 1;
tipo_monstro = "Boss de lava";
nome_boss = "Golem de Lava";
HP_Monstro = 2500;
HP_Max = HP_Monstro;
hp_visual = HP_Monstro;
fase2 = false;

tempo_idle = 90;
vel_andar = 1;
dist_parar = 48;

olhando = 270;
olhando_x = 0;
olhando_y = 1;

soco_raio = 64;     
soco_dano = 2;
qtd_socos = 1;
soco_aviso = 45;
soco_recup = 25;
soco_cx = x;
soco_cy = y;
soco_prog = 0;

qtd_rochas = 6;
raio_rochas = 96;      
rocha_intervalo = 8;  
rocha_espera = 40;   
rocha_queda = 12;      

estado = undefined;
timer = 0;
mudou = false;
indice_ataque = 0;
mostrar_aviso = false;

function snap(_v) {
    return floor(_v / 16) * 16 + 8;
}

function definir_direcao(_ang) {
    olhando = _ang;
    olhando_x = round(lengthdir_x(1, _ang));
    olhando_y = round(lengthdir_y(1, _ang));
}

function olhar_player() {
    if (!instance_exists(oPlayer)) exit;
    var _ang = point_direction(x, y, oPlayer.x, oPlayer.y);
    definir_direcao((round(_ang / 90) mod 4) * 90);
}

function conjunto(_lado, _costas, _frente) {
    return [_lado, _costas, _lado, _frente];
}

sprites = {
    idle:      conjunto(sBossLava_Idle_Lado,      sBossLava_Idle_Costas,      sBossLava_Idle_Frente),
    andar:     conjunto(sBossLava_Andar_Lado,     sBossLava_Andar_Costas,     sBossLava_Andar_Frente),
    soco:      conjunto(sBossLava_Soco_Lado,      sBossLava_Soco_Costas,      sBossLava_Soco_Frente),
    arremesso: conjunto(sBossLava_Arremesso_Lado, sBossLava_Arremesso_Costas, sBossLava_Arremesso_Frente),
    cansado:   conjunto(sBossLava_Cansado_Lado,   sBossLava_Cansado_Costas,   sBossLava_Cansado_Frente),
};

function set_sprite(_nome) {
    sprite_index = sprites[$ _nome][olhando / 90];
    image_xscale = (olhando == 180) ? -1 : 1;
}

function mudar_estado(_novo) {
    estado = _novo;
    timer = 0;
    mudou = true;
    image_index = 0;
    mostrar_aviso = false;
}

function verificar_fase() {
    if (fase2 || HP_Monstro > HP_Max * 0.5) exit;
    fase2 = true;
    qtd_socos = 3;
    vel_andar *= 1.2;
    qtd_rochas *= 2;
}

function golpe_soco() {
    var _n = soco_raio div 16;
    for (var _i = -_n; _i <= _n; _i++) {
        for (var _j = -_n; _j <= _n; _j++) {
            if (point_distance(0, 0, _i * 16, _j * 16) <= soco_raio) {
                criar_magma(soco_cx + _i * 16, soco_cy + _j * 16);
            }
        }
    }
    if (instance_exists(oPlayer) && point_distance(soco_cx, soco_cy, oPlayer.x, oPlayer.y) <= soco_raio) {
        oPlayer.HP_Player -= soco_dano;
    }
}

function estado_idle() {
    if (timer mod 15 == 0) olhar_player();

    var _longe = instance_exists(oPlayer) && distance_to_object(oPlayer) > dist_parar;
    var _bateu = place_meeting(x + olhando_x * vel_andar, y + olhando_y * vel_andar, oParede_Invisivel);

    if (_longe && !_bateu) {
        x += olhando_x * vel_andar;
        y += olhando_y * vel_andar;
        set_sprite("andar");
    } else {
        set_sprite("idle");
    }

    if (timer >= tempo_idle) {
        mudar_estado(ataques[indice_ataque]);
        indice_ataque = (indice_ataque + 1) % array_length(ataques);
    }
}

function estado_soco() {
    var _ciclo = soco_aviso + soco_recup;
    var _n = timer div _ciclo;
    var _t = timer mod _ciclo;

    if (_n >= qtd_socos) {
        mudar_estado(estado_cansado);
        exit;
    }

    if (_t == 0) {
        olhar_player();
        set_sprite("soco");
        image_index = 0;
        soco_cx = snap(x);
        soco_cy = snap(y);
        mostrar_aviso = true;
    }

    soco_prog = clamp(_t / soco_aviso, 0, 1);

    if (_t == soco_aviso) {
        mostrar_aviso = false;
        golpe_soco();
    }
}

function estado_pedras() {
    if (timer == 0) {
        olhar_player();
        set_sprite("arremesso");
    }

    if (timer == 20 && instance_exists(oPlayer)) {
        var _px = oPlayer.x;
        var _py = oPlayer.y;

        for (var i = 0; i < qtd_rochas; i++) {
            var _tx = snap(_px);
            var _ty = snap(_py);

            if (i > 0) { 
                var _ok = false;
                var _tent = 0;
                while (!_ok && _tent < 10) {
                    _tx = snap(_px + irandom_range(-raio_rochas, raio_rochas));
                    _ty = snap(_py + irandom_range(-raio_rochas, raio_rochas));
                    _ok = !position_meeting(_tx, _ty, oParede_Invisivel);
                    _tent++;
                }
                if (!_ok) continue;
            }

            var _r = instance_create_layer(_tx, _ty, "Instances", oRocha_Lava);
            _r.espera = rocha_espera + i * rocha_intervalo;
        }
    }

    var _fim = 20 + rocha_espera + (qtd_rochas - 1) * rocha_intervalo + rocha_queda + 20;
    if (timer >= _fim) mudar_estado(estado_idle);
}

function estado_cansado() {
    if (timer == 0) set_sprite("cansado");
    if (timer >= 80) mudar_estado(estado_idle);
}

ataques = [estado_soco, estado_pedras];

mudar_estado(estado_idle);