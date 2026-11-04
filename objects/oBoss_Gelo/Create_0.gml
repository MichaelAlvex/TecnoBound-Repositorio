objeto_drop = oNeodimio;
depth = oPlayer.depth + 1;
cone_passo = 2;       
garra_alcance = 128;   
garra_largura = 64;    
garra_inicio = 16;  
tipo_monstro = "Boss de gelo";
HP_Monstro = 2000;
tempo_idle = 90;
qtd_espinhos = 20;
vel_corrida = 3;
dist_min_corrida = 288;
dist_max_corrida = 288;
olhando = 270;
olhando_x = 0;
olhando_y = 1;
HP_Max = HP_Monstro;      
hp_visual = HP_Monstro;

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
    idle:     conjunto(sBossGelo_Idle_Lado,     sBossGelo_Idle_Costas,     sBossGelo_Idle_Frente),
    espinhos: conjunto(sBossGelo_Espinhos_Lado, sBossGelo_Espinhos_Costas, sBossGelo_Espinhos_Frente),
    aviso:    conjunto(sBossGelo_Aviso_Lado,    sBossGelo_Aviso_Costas,    sBossGelo_Aviso_Frente),
    corrida:  conjunto(sBossGelo_Corrida_Lado,  sBossGelo_Corrida_Costas,  sBossGelo_Corrida_Frente),
    garra:    conjunto(sBossGelo_Garra_Lado,    sBossGelo_Garra_Costas,    sBossGelo_Garra_Frente),
    cansado:  conjunto(sBossGelo_Cansado_Lado,  sBossGelo_Cansado_Costas,  sBossGelo_Cansado_Frente),
};

function set_sprite(_nome) {
    sprite_index = sprites[$ _nome][olhando / 90];
    image_xscale = (olhando == 180) ? -1 : 1;
}

estado = undefined;
timer = 0;
mudou = false;
indice_ataque = 0;
mostrar_aviso = false;
dash_dist = 0;
dash_percorrido = 0;
acertou = false;

function mudar_estado(_novo) {
    estado = _novo;
    timer = 0;
    mudou = true;
    image_index = 0;
    mostrar_aviso = false;
}

function retangulo_garra() {
    var _l = garra_largura / 2;

    var _ax = x + olhando_x * garra_inicio;
    var _ay = y + olhando_y * garra_inicio;
    var _bx = x + olhando_x * (garra_inicio + garra_alcance);
    var _by = y + olhando_y * (garra_inicio + garra_alcance);

    var _x1 = _ax + olhando_y * _l;
    var _y1 = _ay + olhando_x * _l;
    var _x2 = _bx - olhando_y * _l;
    var _y2 = _by - olhando_x * _l;

    return {
        x1: min(_x1, _x2), y1: min(_y1, _y2),
        x2: max(_x1, _x2), y2: max(_y1, _y2)
    };
}

function golpe_garra() {
    if (acertou) exit;
    var _r = retangulo_garra();
    var _p = collision_rectangle(_r.x1, _r.y1, _r.x2, _r.y2, oPlayer, false, true);
    if (_p != noone) {
        acertou = true;
        with (_p) {
            oPlayer.HP_Player -= 2;
        }
    }
}

function estado_idle() {
    olhar_player();
    set_sprite("idle");

    if (timer >= tempo_idle) {
        mudar_estado(ataques[indice_ataque]);
        indice_ataque = (indice_ataque + 1) % array_length(ataques);
    }
}

function estado_espinhos() {
    if (timer == 0) {
        olhar_player(); 
        set_sprite("espinhos");
    }

    if (timer == 20) {
        var _gx = floor(x / 16) * 16 + 8;
        var _gy = floor(y / 16) * 16 + 8;

        for (var i = 1; i <= qtd_espinhos; i++) {
            var _cx = _gx + olhando_x * 16 * i;
            var _cy = _gy + olhando_y * 16 * i;

            if (position_meeting(_cx, _cy, oParede_Invisivel)) break;

            var _meia = floor((i - 1) / cone_passo);

            for (var l = -_meia; l <= _meia; l++) {
                var _sx = _cx + olhando_y * 16 * l;
                var _sy = _cy + olhando_x * 16 * l;

                if (position_meeting(_sx, _sy, oParede_Invisivel)) continue;

                var _e = instance_create_layer(_sx, _sy, "Instances", oEspinho_Gelo);
                _e.espera = 45 + i * 5; 
            }
        }
    }

    if (timer >= 90) mudar_estado(estado_idle);
}

function estado_aviso_corrida() {
    if (timer == 0) {
        olhar_player();
        set_sprite("aviso");

        var _d = 0;
        if (instance_exists(oPlayer)) {
            _d = (olhando_x != 0) ? abs(oPlayer.x - x) : abs(oPlayer.y - y);
        }
        dash_dist = clamp(_d, dist_min_corrida, dist_max_corrida);
        mostrar_aviso = true;
    }

    if (timer >= 50) mudar_estado(estado_corrida);
}

function estado_corrida() {
    if (timer == 0) {
        set_sprite("corrida");
        dash_percorrido = 0;
    }

    var _bateu = place_meeting(x + olhando_x * vel_corrida, y + olhando_y * vel_corrida, oParede_Invisivel);

    if (!_bateu) {
        x += olhando_x * vel_corrida;
        y += olhando_y * vel_corrida;
        dash_percorrido += vel_corrida;
    }

    var _perto = instance_exists(oPlayer) && distance_to_object(oPlayer) < 12;

    if (_bateu || _perto || dash_percorrido >= dash_dist) {
        mudar_estado(estado_garra);
    }
}

function estado_garra() {
    if (timer == 0) {
        set_sprite("garra");
        acertou = false;
    }

    if (timer >= 12 && timer <= 20) golpe_garra();

    if (timer >= 45) mudar_estado(estado_cansado);
}

function estado_cansado() {
    if (timer == 0) set_sprite("cansado");

    if (timer >= 100) mudar_estado(estado_idle);
}

ataques = [estado_espinhos, estado_aviso_corrida];

mudar_estado(estado_idle);