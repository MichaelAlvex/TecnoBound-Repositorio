var _Mouse_Gui_X = device_mouse_x_to_gui(0);
var _Mouse_Gui_Y = device_mouse_y_to_gui(0);

if (is_array(global.inventario_salvo)) {
    if (instance_exists(oInventario)) {
        aplicar_inventario_salvo();
        Inv_Espera = 0;
    } else {
        Inv_Espera++;

        if (Inv_Espera > 120) {
            global.inventario_salvo = undefined;
            Inv_Espera = 0;
        }
    }
}

if (global.cfg_centralizar > 0) {
    global.cfg_centralizar--;

    if (global.cfg_centralizar == 0) {
        window_center();
    }
}

if (!Conf_Grupos_Prontos) {
    if (audio_grupos_prontos()) {
        Conf_Grupos_Prontos = true;
        audio_aplicar_volumes();
    }
}

if ((Tablet_Aberto == false || Tela_Atual == "home") && !instance_exists(oSalas_Sem_Tablet)) {
    if (keyboard_check_pressed(ord("E"))) {
        Tablet_Aberto = !Tablet_Aberto;

        if (Tablet_Aberto == true) {
            Tela_Atual = "home";
        }
    }
}

if (Tablet_Aberto == true) {

    if (variable_global_exists("conquistas")) {
        for (var i = 0; i < array_length(global.conquistas); i++) {
            var _c = global.conquistas[i];

            if (!_c.desbloqueada) {
                if (_c.condicao()) {
                    _c.desbloqueada = true;

                }
            }
        }
    }

    var _home_btn_x = Pos_Fundo_X + 257;
    var _home_btn_y = Pos_Y_Apps1;
    var _tam_btn = 16;

    if (Tela_Atual != "home" && keyboard_check_pressed(ord("E"))) {

        Tela_Atual = "home"

    }

    if (Tela_Atual == "home") {

        var _App1_x = Pos_Fundo_X + 10;
        var _App1_y = Pos_Y_Apps1;
        var _Tam_App = 50;

        if (point_in_rectangle(_Mouse_Gui_X, _Mouse_Gui_Y, _App1_x, _App1_y, _App1_x + _Tam_App, _App1_y + _Tam_App)) {
            if (mouse_check_button_pressed(mb_left)) {

                Tela_Atual = "pedidos"
            }
        }

        var _App2_x = Pos_Fundo_X + 80;
        var _App2_y = Pos_Y_Apps1;

        if (point_in_rectangle(_Mouse_Gui_X, _Mouse_Gui_Y, _App2_x, _App2_y, _App2_x + _Tam_App, _App2_y + _Tam_App)) {
            if (mouse_check_button_pressed(mb_left)) {

                Tela_Atual = "inventario"
            }
        }

        var _App3_x = Pos_Fundo_X + 150;
        var _App3_y = Pos_Y_Apps1;

        if (point_in_rectangle(_Mouse_Gui_X, _Mouse_Gui_Y, _App3_x, _App3_y, _App3_x + _Tam_App, _App3_y + _Tam_App)) {
            if (mouse_check_button_pressed(mb_left)) {

                Tela_Atual = "oficina"
            }
        }

        var _App4_x = Pos_Fundo_X + 220;
        var _App4_y = Pos_Y_Apps1;

        if (point_in_rectangle(_Mouse_Gui_X, _Mouse_Gui_Y, _App4_x, _App4_y, _App4_x + _Tam_App, _App4_y + _Tam_App)) {
            if (mouse_check_button_pressed(mb_left)) {

                Tela_Atual = "conquista"
            }
        }

        var _App5_x = Pos_Fundo_X + 10;
        var _App5_y = Pos_Y_Apps2;

        if (point_in_rectangle(_Mouse_Gui_X, _Mouse_Gui_Y, _App5_x, _App5_y, _App5_x + _Tam_App, _App5_y + _Tam_App)) {
            if (mouse_check_button_pressed(mb_left)) {

                Tela_Atual = "opcoes"
            }
        }

        var _App6_x = Pos_Fundo_X + 80;
        var _App6_y = Pos_Y_Apps2;

        if (point_in_rectangle(_Mouse_Gui_X, _Mouse_Gui_Y, _App6_x, _App6_y, _App6_x + _Tam_App, _App6_y + _Tam_App)) {
            if (mouse_check_button_pressed(mb_left)) {

                Tela_Atual = "stats"
            }
        }

        var _App7_x = Pos_Fundo_X + 150;
        var _App7_y = Pos_Y_Apps2;

        if (point_in_rectangle(_Mouse_Gui_X, _Mouse_Gui_Y, _App7_x, _App7_y, _App7_x + _Tam_App, _App7_y + _Tam_App)) {
            if (mouse_check_button_pressed(mb_left)) {

				 Tela_Atual = "ajuda";
				 Ajuda_Pagina = 0;
			}
        }

        var _App8_x = Pos_Fundo_X + 220;
        var _App8_y = Pos_Y_Apps2;

        if (point_in_rectangle(_Mouse_Gui_X, _Mouse_Gui_Y, _App8_x, _App8_y, _App8_x + _Tam_App, _App8_y + _Tam_App)) {
            if (mouse_check_button_pressed(mb_left)) {

                Tela_Atual = "sair"
            }
        }
    }

    else {

        if (point_in_rectangle(_Mouse_Gui_X, _Mouse_Gui_Y, _home_btn_x, _home_btn_y, _home_btn_x + _tam_btn, _home_btn_y + _tam_btn)) {
            if (mouse_check_button_pressed(mb_left)) {

                Tela_Atual = "home";
            }
        }

        if (Tela_Atual == "oficina") {

            var _tp_btn_tam = 50;

            if (point_in_rectangle(_Mouse_Gui_X, _Mouse_Gui_Y, Pos_Fundo_X + 115, Pos_Y_Apps1 + 45, Pos_Fundo_X + 115 + _tp_btn_tam, Pos_Y_Apps1 + 45 + _tp_btn_tam)) {
                if (mouse_check_button_pressed(mb_left)) {

                    Tablet_Aberto = !Tablet_Aberto
                    room_goto(rOficina);
                }
            }
        }

        if (Tela_Atual == "opcoes") {

            var _op_w = sprite_get_width(sTablet_Fundo);
            var _op_h = sprite_get_height(sTablet_Fundo);

            if (point_in_rectangle(_Mouse_Gui_X, _Mouse_Gui_Y, Pos_Fundo_X, Pos_Fundo_Y, Pos_Fundo_X + _op_w, Pos_Fundo_Y + _op_h)) {
                if (mouse_wheel_down()) {
                    Opcoes_Scroll += 16;
                }
                if (mouse_wheel_up()) {
                    Opcoes_Scroll -= 16;
                }
            }

            if (!mouse_check_button(mb_left)) {
                Conf_Arrastando = -1;
                Opcoes_Barra_Arrastando = false;
            }

            if (Opcoes_Max_Scroll > 0) {
                var _thumb_h = max(18, Opcoes_Area_H * (Opcoes_Area_H / Opcoes_Altura));
                var _trilho = Opcoes_Area_H - _thumb_h;
                var _thumb_y = Opcoes_Area_Y + (_trilho * (Opcoes_Scroll / Opcoes_Max_Scroll));

                if (mouse_check_button_pressed(mb_left)) {
                    if (point_in_rectangle(_Mouse_Gui_X, _Mouse_Gui_Y, Opcoes_Barra_X - 4, Opcoes_Area_Y, Opcoes_Barra_X + Opcoes_Barra_W + 4, Opcoes_Area_Y + Opcoes_Area_H)) {
                        Opcoes_Barra_Arrastando = true;

                        if (_Mouse_Gui_Y >= _thumb_y && _Mouse_Gui_Y <= _thumb_y + _thumb_h) {
                            Opcoes_Barra_Offset = _Mouse_Gui_Y - _thumb_y;
                        } else {
                            Opcoes_Barra_Offset = _thumb_h / 2;
                        }
                    }
                }

                if (Opcoes_Barra_Arrastando) {
                    Opcoes_Scroll = clamp((_Mouse_Gui_Y - Opcoes_Barra_Offset - Opcoes_Area_Y) / _trilho, 0, 1) * Opcoes_Max_Scroll;
                }
            }

            Opcoes_Scroll = clamp(Opcoes_Scroll, 0, Opcoes_Max_Scroll);

            var _na_area = !Opcoes_Barra_Arrastando && point_in_rectangle(_Mouse_Gui_X, _Mouse_Gui_Y, Opcoes_Area_X, Opcoes_Area_Y, Opcoes_Area_X + Opcoes_Area_W, Opcoes_Area_Y + Opcoes_Area_H);

            if (_na_area && mouse_check_button_pressed(mb_left)) {
                for (var i = 0; i < 4; i++) {
                    var _sy = Conf_Vol_Y + (i * Conf_Linha) - Opcoes_Scroll;

                    if (point_in_rectangle(_Mouse_Gui_X, _Mouse_Gui_Y, Conf_Vol_X - 4, _sy - 6, Conf_Vol_X + Conf_Vol_W + 4, _sy + 6)) {
                        Conf_Arrastando = i;
                    }
                }
            }

            if (Conf_Arrastando != -1) {
                global.volumes[Conf_Arrastando] = clamp((_Mouse_Gui_X - Conf_Vol_X) / Conf_Vol_W, 0, 1);
                audio_aplicar_volumes();
            }

            for (var i = 0; i < array_length(global.cfg_tela_opcoes); i++) {
                var _by = Conf_Tela_Y + (i * Conf_Linha) - Opcoes_Scroll;

                if (_na_area && point_in_rectangle(_Mouse_Gui_X, _Mouse_Gui_Y, Conf_Tela_X, _by, Conf_Tela_X + Conf_Tela_W, _by + Conf_Tela_H)) {
                    if (mouse_check_button_pressed(mb_left) && tela_opcao_disponivel(i) && global.cfg_tela != i) {
                        tela_aplicar(i);
                    }
                }
            }

            var _btn_y = Opcoes_Btn_Y - Opcoes_Scroll;

            if (_na_area && mouse_check_button_pressed(mb_left)) {
                if (point_in_rectangle(_Mouse_Gui_X, _Mouse_Gui_Y, Opcoes_Btn_Salvar_X, _btn_y, Opcoes_Btn_Salvar_X + Opcoes_Btn_W, _btn_y + Opcoes_Btn_H)) {
                    salvar_jogo();
                }

                if (point_in_rectangle(_Mouse_Gui_X, _Mouse_Gui_Y, Opcoes_Btn_Carregar_X, _btn_y, Opcoes_Btn_Carregar_X + Opcoes_Btn_W, _btn_y + Opcoes_Btn_H)) {
                    if (carregar_jogo()) {
                        Tablet_Aberto = false;
                    }
                }
            }
        }
		
		if (Tela_Atual == "ajuda") {

    var _n = array_length(Ajuda_Paginas);
    var _voltar = keyboard_check_pressed(vk_left);
    var _avancar = keyboard_check_pressed(vk_right);

    if (mouse_check_button_pressed(mb_left)) {
        if (point_in_rectangle(_Mouse_Gui_X, _Mouse_Gui_Y, Ajuda_Seta_Esq_X, Ajuda_Rodape_Y, Ajuda_Seta_Esq_X + Ajuda_Seta_Tam, Ajuda_Rodape_Y + Ajuda_Seta_Tam)) {
            _voltar = true;
        }
        if (point_in_rectangle(_Mouse_Gui_X, _Mouse_Gui_Y, Ajuda_Seta_Dir_X, Ajuda_Rodape_Y, Ajuda_Seta_Dir_X + Ajuda_Seta_Tam, Ajuda_Rodape_Y + Ajuda_Seta_Tam)) {
            _avancar = true;
        }
    }

    if (_voltar)  Ajuda_Pagina = (Ajuda_Pagina - 1 + _n) mod _n;
    if (_avancar) Ajuda_Pagina = (Ajuda_Pagina + 1) mod _n;
}
    }
}



if (Tablet_Aberto && Tela_Atual == "stats") {

    var _tablet_x = Pos_Fundo_X;
    var _tablet_y = Pos_Fundo_Y;
    var _tablet_w = sprite_get_width(sTablet_Fundo);
    var _tablet_h = sprite_get_height(sTablet_Fundo);

    if (point_in_rectangle(_Mouse_Gui_X, _Mouse_Gui_Y, _tablet_x, _tablet_y, _tablet_x + _tablet_w, _tablet_y + _tablet_h)) {
        if (mouse_wheel_down()) {
            stat_scroll += 16;
        }
        if (mouse_wheel_up()) {
            stat_scroll -= 16;
        }

        var _altura_conteudo = 520;
        var _altura_visivel = _tablet_h - 45;
        var _max_scroll = max(0, _altura_conteudo - _altura_visivel);

        stat_scroll = clamp(stat_scroll, 0, _max_scroll);
    }
} else if (Tela_Atual == "sair") {

    var _bm_x = Pos_Fundo_X + 78;
    var _bm_y = Pos_Fundo_Y + 55;
    var _bw1 = sprite_get_width(sBtn_MenuPrincipal);
    var _bh1 = sprite_get_height(sBtn_MenuPrincipal);

    if (point_in_rectangle(_Mouse_Gui_X, _Mouse_Gui_Y, _bm_x, _bm_y, _bm_x + _bw1, _bm_y + _bh1)) {
        if (mouse_check_button_pressed(mb_left)) {
            Tablet_Aberto = false;
            room_goto(Menu);
        }
    }

    var _bs_x = Pos_Fundo_X + 148;
    var _bs_y = Pos_Fundo_Y + 55;
    var _bw2 = sprite_get_width(sBtn_FecharJogo);
    var _bh2 = sprite_get_height(sBtn_FecharJogo);

    if (point_in_rectangle(_Mouse_Gui_X, _Mouse_Gui_Y, _bs_x, _bs_y, _bs_x + _bw2, _bs_y + _bh2)) {
        if (mouse_check_button_pressed(mb_left)) {
            salvar_jogo();
			game_end();
        }
    }
}
