if (Opcoes_Abertas) {
	var _Mouse_X = device_mouse_x_to_gui(0);
    var _Mouse_Y = device_mouse_y_to_gui(0);
	var _nomes_volume = ["Geral", "BGM", "SFX", "UI"];
	draw_sprite(sTablet_Fundo, 0, Pos_Fundo_X, Pos_Fundo_Y);

            draw_set_colour(c_white);
            draw_set_font(Font2);
            draw_set_halign(fa_left);
            draw_set_valign(fa_top);

            draw_text_transformed(Pos_Fundo_X + 15, Pos_Fundo_Y + 15, "Opções", 0.45, 0.45, 0);

            var _k = max(1, window_get_width() / display_get_gui_width());

            if (!surface_exists(global.opcoes_surface) || Opcoes_Surface_K != _k) {
                if (surface_exists(global.opcoes_surface)) {
                    surface_free(global.opcoes_surface);
                }

                global.opcoes_surface = surface_create(ceil(Opcoes_Area_W * _k), ceil(Opcoes_Area_H * _k));
                Opcoes_Surface_K = _k;
            }

            var _ox = -Opcoes_Area_X;
            var _oy = -(Opcoes_Area_Y + Opcoes_Scroll);
            var _mouse_na_area = point_in_rectangle(_Mouse_X, _Mouse_Y, Opcoes_Area_X, Opcoes_Area_Y, Opcoes_Area_X + Opcoes_Area_W, Opcoes_Area_Y + Opcoes_Area_H);

            surface_set_target(global.opcoes_surface);
            draw_clear_alpha(c_black, 0);
            matrix_set(matrix_world, matrix_build(0, 0, 0, 0, 0, 0, _k, _k, 1));

            draw_set_font(Font1);
            draw_set_colour(c_white);
            draw_set_halign(fa_left);
            draw_set_valign(fa_top);

            draw_text_transformed(Pos_Fundo_X + 15 + _ox, Pos_Fundo_Y + 32 + _oy, "Volume", 0.5, 0.5, 0);
            draw_text_transformed(Conf_Tela_X + _ox, Pos_Fundo_Y + 32 + _oy, "Tela", 0.5, 0.5, 0);

            draw_set_valign(fa_middle);

            for (var i = 0; i < 4; i++) {
                var _sy = Conf_Vol_Y + (i * Conf_Linha) + _oy;
                var _valor = global.volumes[i];
                var _knob_x = Conf_Vol_X + (_valor * Conf_Vol_W) + _ox;
                var _trilho_x = Conf_Vol_X + _ox;

                draw_set_colour(c_white);
                draw_text_transformed(Pos_Fundo_X + 15 + _ox, _sy, _nomes_volume[i], 0.5, 0.5, 0);

                draw_set_colour(c_dkgrey);
                draw_rectangle(_trilho_x, _sy - 2, _trilho_x + Conf_Vol_W, _sy + 2, false);

                draw_set_colour(c_white);
                draw_rectangle(_trilho_x, _sy - 2, _knob_x, _sy + 2, false);

                if (Conf_Arrastando == i) {
                    draw_set_colour(c_purple);
                }
                draw_rectangle(_knob_x - 3, _sy - 5, _knob_x + 3, _sy + 5, false);

                draw_set_colour(c_white);
                draw_text_transformed(Conf_Vol_X + Conf_Vol_W + 8 + _ox, _sy, string(round(_valor * 100)) + "%", 0.45, 0.45, 0);
            }

            draw_set_halign(fa_center);

            for (var i = 0; i < array_length(global.cfg_tela_opcoes); i++) {
                var _opcao = global.cfg_tela_opcoes[i];
                var _by_tela = Conf_Tela_Y + (i * Conf_Linha) - Opcoes_Scroll;
                var _by = Conf_Tela_Y + (i * Conf_Linha) + _oy;
                var _bx = Conf_Tela_X + _ox;
                var _disponivel = tela_opcao_disponivel(i);
                var _selecionada = (global.cfg_tela == i);
                var _sobre = _mouse_na_area && point_in_rectangle(_Mouse_X, _Mouse_Y, Conf_Tela_X, _by_tela, Conf_Tela_X + Conf_Tela_W, _by_tela + Conf_Tela_H);

                if (_selecionada) {
                    draw_set_colour(c_white);
                } else if (_sobre && _disponivel) {
                    draw_set_colour(c_gray);
                } else {
                    draw_set_colour(c_dkgrey);
                }
                draw_rectangle(_bx, _by, _bx + Conf_Tela_W, _by + Conf_Tela_H, false);

                draw_set_colour(c_white);
                draw_rectangle(_bx, _by, _bx + Conf_Tela_W, _by + Conf_Tela_H, true);

                if (_selecionada) {
                    draw_set_colour(c_black);
                } else if (!_disponivel) {
                    draw_set_colour(c_gray);
                } else {
                    draw_set_colour(c_white);
                }
                var _esc_opcao = min(0.45, (Conf_Tela_W - 6) / max(1, string_width(_opcao.nome)));
                draw_text_transformed(_bx + (Conf_Tela_W / 2), _by + (Conf_Tela_H / 2), _opcao.nome, _esc_opcao, _esc_opcao, 0);
            }

            var _btn_y_tela = Opcoes_Btn_Y - Opcoes_Scroll;
            var _btn_y = Opcoes_Btn_Y + _oy;
            var _btn_nomes = ["Salvar", "Carregar"];
            var _btn_xs = [Opcoes_Btn_Salvar_X, Opcoes_Btn_Carregar_X];

            for (var i = 0; i < 2; i++) {
                var _bbx = _btn_xs[i] + _ox;
                var _sobre_btn = _mouse_na_area && point_in_rectangle(_Mouse_X, _Mouse_Y, _btn_xs[i], _btn_y_tela, _btn_xs[i] + Opcoes_Btn_W, _btn_y_tela + Opcoes_Btn_H);

                draw_set_colour(_sobre_btn ? c_gray : c_dkgrey);
                draw_rectangle(_bbx, _btn_y, _bbx + Opcoes_Btn_W, _btn_y + Opcoes_Btn_H, false);

                draw_set_colour(c_white);
                draw_rectangle(_bbx, _btn_y, _bbx + Opcoes_Btn_W, _btn_y + Opcoes_Btn_H, true);
                var _esc_btn = min(0.45, (Opcoes_Btn_W - 6) / max(1, string_width(_btn_nomes[i])));
                draw_text_transformed(_bbx + (Opcoes_Btn_W / 2), _btn_y + (Opcoes_Btn_H / 2), _btn_nomes[i], _esc_btn, _esc_btn, 0);
            }

            matrix_set(matrix_world, matrix_build_identity());
            surface_reset_target();

            draw_surface_ext(global.opcoes_surface, Opcoes_Area_X, Opcoes_Area_Y, 1 / _k, 1 / _k, 0, c_white, 1);

            if (Opcoes_Max_Scroll > 0) {
                var _bar_h = Opcoes_Area_H;
                var _thumb_h = max(18, _bar_h * (Opcoes_Area_H / Opcoes_Altura));
                var _thumb_y = Opcoes_Area_Y + (_bar_h - _thumb_h) * (Opcoes_Scroll / Opcoes_Max_Scroll);

                draw_set_colour(c_dkgrey);
                draw_rectangle(Opcoes_Barra_X, Opcoes_Area_Y, Opcoes_Barra_X + Opcoes_Barra_W, Opcoes_Area_Y + _bar_h, false);

                draw_set_colour(Opcoes_Barra_Arrastando ? c_purple : c_white);
                draw_rectangle(Opcoes_Barra_X, _thumb_y, Opcoes_Barra_X + Opcoes_Barra_W, _thumb_y + _thumb_h, false);
            }

            draw_set_colour(c_white);
            draw_set_halign(fa_left);
            draw_set_valign(fa_top);
}
		
		