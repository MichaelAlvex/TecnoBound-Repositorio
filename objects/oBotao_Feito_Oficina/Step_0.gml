var _Mouse_Gui_X = device_mouse_x_to_gui(0);
var _Mouse_Gui_Y = device_mouse_y_to_gui(0);

if (global.podeFabricar) {
    sprite_index = sBtn_Feito_Desblock;
} else {
    sprite_index = sBtn_Feito_Block;
}

if (point_in_rectangle(_Mouse_Gui_X, _Mouse_Gui_Y, Pos_Caixa_X_Feito, Pos_Caixa_Y_Feito, Pos_Caixa_X_Feito + _Tam_Btn_X, Pos_Caixa_Y_Feito + _Tam_Btn_Y)) {

    if (mouse_check_button_pressed(mb_left) && global.podeFabricar) {

        var _chave;

        if (global.faseAtual == 1) {
            _chave = global.perifericoEscolhido;
        } else if (global.faseAtual == 2) {
            _chave = global.componenteEscolhido;
        } else {
            _chave = global.computadorEscolhido;
        }

        var _ingredientes = oCaixa_Receitas.receitas[$ _chave];

        with (oCaixa_Fabricacao) {
            for (var i = 0; i < array_length(_ingredientes); i++) {
                var _req = _ingredientes[i];
                var _restante_para_remover = _req.quantidade;

                for (var j = 0; j < Tamanho_Caixa; j++) {
                    if (_restante_para_remover <= 0) break;

                    var _slot = Slots_Caixa[j];
                    if (_slot != noone && _slot.nome == _req.nome) {
                        if (_slot.quantidade > _restante_para_remover) {
                            _slot.quantidade -= _restante_para_remover;
                            _restante_para_remover = 0;
                        } else {
                            _restante_para_remover -= _slot.quantidade;
                            Slots_Caixa[j] = noone;
                        }
                    }
                }
            }
        }

        with (oInventario) {
            for (var i = 0; i < array_length(_ingredientes); i++) {
                var _req_inv = _ingredientes[i];
                var _restante_inv = _req_inv.quantidade;

                for (var j = 0; j < Tamanho_Inventario; j++) {
                    if (_restante_inv <= 0) break;

                    var _slot_inv = Inventario[j];
                    if (_slot_inv != noone && _slot_inv.nome == _req_inv.nome) {
                        if (_slot_inv.quantidade > _restante_inv) {
                            _slot_inv.quantidade -= _restante_inv;
                            _restante_inv = 0;
                        } else {
                            _restante_inv -= _slot_inv.quantidade;
                            Inventario[j] = noone;
                        }
                    }
                }
            }
        }

        global.podeFabricar = false;

        if (global.faseAtual == 1) {

            switch (global.perifericoEscolhido) {
                case "Mouse":
                case 0:
                    room_goto(rMontagemMouse);
                    break;

                case "Teclado":
                case 1:
                    room_goto(rMontagemTeclado);
                    break;

                case "Monitor":
                case 2:
                    room_goto(rMontagemMonitor);
                    break;

                default:
                    show_debug_message("ERRO: nenhum periferico valido foi escolhido.");
                    break;
            }

        } else if (global.faseAtual == 2) {

            switch (global.componenteEscolhido) {
                case "PlacaMae":
                    room_goto(MontagemPMae);
                    break;

                case "PlacaVideo":
                    room_goto(MontagemPVideo);
                    break;

                case "Processador":
                    room_goto(MontagemProcessador);
                    break;

                default:
                    show_debug_message("ERRO: nenhum componente valido foi escolhido.");
                    break;
            }

        } else if (global.faseAtual == 3) {

            switch (global.computadorEscolhido) {
                case "PCGamer":
                    room_goto(MontagemGamer);
                    break;

                case "PCDomestico":
                    room_goto(MontagemCasa);
                    break;

                case "PCEscritorio":
                    room_goto(MontagemEscritorio);
                    break;

                default:
                    show_debug_message("ERRO: nenhum computador valido foi escolhido.");
                    break;
            }
        }
    }
}