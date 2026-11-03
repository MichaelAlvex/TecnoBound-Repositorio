espera = 45;
dono = noone;
cria = "";           
timer = 0;
mudou = false;
tempo_subida = 20;
tempo_ativo = 60;
tempo_sumir = 30;

sprite_index = sGalho_Aviso;
image_speed = 1;

function mudar_estado(_novo) {
    estado = _novo;
    timer = 0;
    mudou = true;
}

function criar_item() {
    switch (cria) {
        case "pedra":
			instance_create_layer(x, y, "Instances", oParede_Invisivel);
            var _p = instance_create_layer(x, y, "Instances", oPedraNiquel);
            if (instance_exists(dono)) dono.pedra = _p;
            break;
        case "ovo":
			var _ovo_escolhido = irandom_range(0, 2);
			if (_ovo_escolhido == 0) {
				instance_create_layer(x, y, "Instances", oOvoCagu);
			} else if (_ovo_escolhido == 1) {
				instance_create_layer(x, y, "Instances", oOvoCorvo);
			} else {
				instance_create_layer(x, y, "Instances", oOvoPombo);
			}
            
            break;
		case "galho":
			instance_create_layer(x, y, "Instances", oGalho_Corvo);
			break;
    }
}

function estado_aviso() {
    visible = (espera - timer > 15) || (timer mod 4 < 2);

    if (timer >= espera) {
        visible = true;
        sprite_index = sGalho_Subindo;
        image_speed = 0;
        image_index = 0;
        mudar_estado(estado_subindo);
    }
}

function estado_subindo() {
    image_index = (timer / tempo_subida) * (image_number - 1);

    if (timer >= tempo_subida) {
        image_index = image_number - 1;
        mudar_estado(estado_ativo);
    }
}

function estado_ativo() {
    if (timer == 0) criar_item();

    if (timer >= tempo_ativo) mudar_estado(estado_sumindo);
}

function estado_sumindo() {
    image_alpha = 1 - (timer / tempo_sumir);
    if (timer >= tempo_sumir) instance_destroy();
}

estado = estado_aviso;