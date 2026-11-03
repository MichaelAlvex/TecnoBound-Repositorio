espera = 40;
tempo_queda = 12;
altura_queda = 160;
altura = altura_queda;
raio_impacto = 24;
dano = 1;
timer = 0;
caindo = false;

depth = oPlayer.depth - 1;

function mudar_estado(_novo) {
    estado = _novo;
    timer = 0;
}

function impacto() {
    for (var _i = -1; _i <= 1; _i++) {
        for (var _j = -1; _j <= 1; _j++) {
            criar_magma(x + _i * 16, y + _j * 16);
        }
    }
    if (instance_exists(oPlayer) && point_distance(x, y, oPlayer.x, oPlayer.y) <= raio_impacto) {
        oPlayer.HP_Player -= dano;
    }
}

function estado_aviso() {
    if (timer >= espera) {
        caindo = true;
        mudar_estado(estado_queda);
    }
}

function estado_queda() {
    altura = altura_queda * (1 - timer / tempo_queda);
    if (timer >= tempo_queda) {
        altura = 0;
        impacto();
        instance_destroy();
    }
}

estado = estado_aviso;