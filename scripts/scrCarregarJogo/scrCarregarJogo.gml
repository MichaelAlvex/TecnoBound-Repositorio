function carregar_jogo() {

    if (!file_exists("savegame.json")) {
        show_debug_message("Nenhum save encontrado.");
        return false;
    }

    var _file = file_text_open_read("savegame.json");
    var _string = "";
    while (!file_text_eof(_file)) {
        _string += file_text_readln(_file);
    }
    file_text_close(_file);

    var _data = json_parse(_string);

    if (variable_struct_exists(_data, "fase_atual")) {
        global.faseAtual = _data.fase_atual;
    }

    if (variable_struct_exists(_data, "volumes") && is_array(_data.volumes)) {
        global.volumes = _data.volumes;

        if (instance_exists(oMenu_Tablet) && oMenu_Tablet.Conf_Grupos_Prontos) {
            audio_aplicar_volumes();
        }
    }

    global.inventario_salvo = _data.inventario;

    var _sala = asset_get_index(_data.sala_atual);
    if (room_exists(_sala)) {
        room_goto(_sala);
    } else {
        aplicar_inventario_salvo();
    }

    return true;
}


function aplicar_inventario_salvo() {

    if (!variable_global_exists("inventario_salvo")) return;
    if (!is_array(global.inventario_salvo)) return;
    if (!instance_exists(oInventario)) return;

    var _lista = global.inventario_salvo;

    with (oInventario) {
        for (var i = 0; i < Tamanho_Inventario; i++) {
            Inventario[i] = noone;

            if (i >= array_length(_lista)) continue;

            var _d = _lista[i];
            if (!is_struct(_d)) continue;

            var _item = {};
            var _campos = variable_struct_get_names(_d);

            for (var j = 0; j < array_length(_campos); j++) {
                var _campo = _campos[j];
                var _valor = _d[$ _campo];

                if (string_lower(_campo) == "sprite" && is_string(_valor)) {
                    var _spr = asset_get_index(_valor);
                    if (!sprite_exists(_spr)) continue;
                    _valor = _spr;
                }

                _item[$ _campo] = _valor;
            }

            Inventario[i] = _item;
        }
    }

    show_debug_message("Inventário restaurado.");
    global.inventario_salvo = undefined;
}
