if (Opcoes_Abertas) {
			var _Mouse_Gui_X = device_mouse_x_to_gui(0);
			var _Mouse_Gui_Y = device_mouse_y_to_gui(0);
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
    
