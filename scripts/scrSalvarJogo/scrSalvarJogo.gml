function salvar_jogo() {

    var _save_data = {
        fase_atual: variable_global_exists("faseAtual") ? global.faseAtual : 0,
        sala_atual: room_get_name(room),
        volumes: variable_global_exists("volumes") ? global.volumes : [1, 1, 1, 1],
        inventario: []
    };

    if (instance_exists(oInventario)) {
        with (oInventario) {
            for (var i = 0; i < Tamanho_Inventario; i++) {
                var _slot = Inventario[i];

                if (!is_struct(_slot)) {
                    array_push(_save_data.inventario, noone);
                } else {
                    var _dados_item = {};
                    var _campos = variable_struct_get_names(_slot);

                    for (var j = 0; j < array_length(_campos); j++) {
                        var _campo = _campos[j];
                        var _valor = _slot[$ _campo];

                        if (is_method(_valor)) continue;

                        if (string_lower(_campo) == "sprite" && is_real(_valor) && sprite_exists(_valor)) {
                            _valor = sprite_get_name(_valor);
                        }

                        _dados_item[$ _campo] = _valor;
                    }

                    array_push(_save_data.inventario, _dados_item);
                }
            }
        }
    }

    var _string = json_stringify(_save_data);
    var _file = file_text_open_write("savegame.json");

    if (_file == -1) {
        show_debug_message("Erro: não foi possível criar o arquivo de save!");
        return false;
    }

    file_text_write_string(_file, _string);
    file_text_close(_file);

    show_debug_message("Jogo salvo com sucesso! " + _string);
    return true;
}
