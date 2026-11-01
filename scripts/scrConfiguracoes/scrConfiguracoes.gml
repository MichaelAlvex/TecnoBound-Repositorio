#macro RES_BASE_W 640
#macro RES_BASE_H 360

enum VOLUME {
    GERAL,
    BGM,
    SFX,
    UI
}

function configuracoes_iniciar() {
    if (!variable_global_exists("volumes")) {
        global.volumes = [1, 1, 1, 1];
    }

    if (!audio_group_is_loaded(ag_bgm)) {
        audio_group_load(ag_bgm);
    }

    if (!audio_group_is_loaded(ag_sfx)) {
        audio_group_load(ag_sfx);
    }

    if (!audio_group_is_loaded(ag_ui)) {
        audio_group_load(ag_ui);
    }

    global.cfg_tela_opcoes = [
        { nome: "640 x 360", largura: 640, altura: 360, tela_cheia: false },
        { nome: "1280 x 720", largura: 1280, altura: 720, tela_cheia: false },
        { nome: "1920 x 1080", largura: 1920, altura: 1080, tela_cheia: false },
        { nome: "Tela cheia", largura: display_get_width(), altura: display_get_height(), tela_cheia: true }
    ];

    global.cfg_centralizar = 0;

    if (window_get_fullscreen()) {
        global.cfg_tela = 3;
    } else {
        global.cfg_tela = clamp(round(window_get_width() / RES_BASE_W) - 1, 0, 2);
    }

    audio_aplicar_volumes();
}

function audio_aplicar_volumes() {
    audio_master_gain(global.volumes[VOLUME.GERAL]);
    audio_group_set_gain(ag_bgm, global.volumes[VOLUME.BGM], 0);
    audio_group_set_gain(ag_sfx, global.volumes[VOLUME.SFX], 0);
    audio_group_set_gain(ag_ui, global.volumes[VOLUME.UI], 0);
}

function audio_grupos_prontos() {
    return (audio_group_is_loaded(ag_bgm) && audio_group_is_loaded(ag_sfx) && audio_group_is_loaded(ag_ui));
}

function tela_opcao_disponivel(_indice) {
    var _opcao = global.cfg_tela_opcoes[_indice];

    if (_opcao.tela_cheia) {
        return true;
    }

    return (_opcao.largura <= display_get_width() && _opcao.altura <= display_get_height());
}

function tela_aplicar(_indice) {
    var _opcao = global.cfg_tela_opcoes[_indice];

    if (_opcao.tela_cheia) {
        window_set_fullscreen(true);
    } else {
        window_set_fullscreen(false);
        window_set_size(_opcao.largura, _opcao.altura);
        surface_resize(application_surface, RES_BASE_W, RES_BASE_H);
        display_set_gui_size(RES_BASE_W, RES_BASE_H);
        global.cfg_centralizar = 2;
    }

    global.cfg_tela = _indice;
}
