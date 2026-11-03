espera = 45;
dano = 1;
acertou = false;
timer = 0;
tempo_subida = 20;
tempo_ativo = 90;
tempo_sumir = 30;

depth = oPlayer.depth + 2;
sprite_index = sEspinho_Gelo_Aviso;
image_speed = 1;

function mudar_estado(_novo) {
    estado = _novo;
    timer = 0;
}

function causar_dano() {
    if (acertou) exit;
    var _p = instance_place(x, y, oPlayer);
    if (_p != noone) {
        acertou = true;
        with (_p) {
            HP_Player -= oEspinho_Gelo.dano; 
        }
    }
}

function estado_aviso() {

    visible = (espera - timer > 15) || (timer mod 4 < 2);

    if (timer >= espera) {
        visible = true;
        sprite_index = sEspinho_Gelo_Subindo;
        image_speed = 0; 
        image_index = 0;
        mudar_estado(estado_subindo);
    }
}

function estado_subindo() {
    image_index = (timer / tempo_subida) * (image_number - 1);

    if (image_index == 2) {
        image_index = image_number - 1;
        mudar_estado(estado_ativo);
    }
}

function estado_ativo() {
    causar_dano();
    if (timer >= tempo_ativo) mudar_estado(estado_sumindo);
}

function estado_sumindo() {
    image_alpha = 1 - (timer / tempo_sumir);
    if (timer >= tempo_sumir) instance_destroy();
}

estado = estado_aviso;