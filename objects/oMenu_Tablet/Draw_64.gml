if (Tablet_Aberto == true) {

    draw_sprite(sTablet_Fundo, 0, Pos_Fundo_X, Pos_Fundo_Y);

    if (Tela_Atual == "home") {

        draw_sprite(sApp_Pedidos, 0, Pos_Fundo_X + 10, Pos_Y_Apps1);
        draw_sprite(sApp_Inventario, 0, Pos_Fundo_X + 80, Pos_Y_Apps1);
        draw_sprite(sApp_Oficina, 0, Pos_Fundo_X + 150, Pos_Y_Apps1);
        draw_sprite(sApp_Conquista, 0, Pos_Fundo_X + 220, Pos_Y_Apps1);
        draw_sprite(sApp_Opcoes, 0, Pos_Fundo_X + 10, Pos_Y_Apps2);
        draw_sprite(sApp_Stats, 0, Pos_Fundo_X + 80, Pos_Y_Apps2);
        draw_sprite(sApp_Ajuda, 0, Pos_Fundo_X + 150, Pos_Y_Apps2);
        draw_sprite(sApp_Sair, 0, Pos_Fundo_X + 220, Pos_Y_Apps2);

        draw_set_colour(c_white);
        draw_set_font(Font1);
        draw_set_halign(fa_center);
        draw_text_transformed(Pos_Fundo_X + 35, Pos_Y_Apps1 + 55, "Pedidos", 0.4, 0.4, 0);
        draw_text_transformed(Pos_Fundo_X + 105, Pos_Y_Apps1 + 55, "Inventário", 0.4, 0.4, 0);
        draw_text_transformed(Pos_Fundo_X + 175, Pos_Y_Apps1 + 55, "Oficina", 0.4, 0.4, 0);
        draw_text_transformed(Pos_Fundo_X + 245, Pos_Y_Apps1 + 55, "Conquistas", 0.4, 0.4, 0);
        draw_text_transformed(Pos_Fundo_X + 35, Pos_Y_Apps2 + 55, "Opções", 0.4, 0.4, 0);
        draw_text_transformed(Pos_Fundo_X + 105, Pos_Y_Apps2 + 55, "Estatísticas", 0.4, 0.4, 0);
        draw_text_transformed(Pos_Fundo_X + 175, Pos_Y_Apps2 + 55, "Ajuda", 0.4, 0.4, 0);
        draw_text_transformed(Pos_Fundo_X + 245, Pos_Y_Apps2 + 55, "Sair", 0.4, 0.4, 0);

        draw_set_halign(fa_left);
    }

    else {

        draw_sprite(sBtn_Home, 0, Pos_Fundo_X + 257, Pos_Y_Apps1);

        if (Tela_Atual == "oficina") {

            draw_sprite(sTp_Oficina, 0, Pos_Fundo_X + 115, Pos_Y_Apps1 + 45);
        }

        else if (Tela_Atual == "pedidos") {

            draw_set_colour(c_white);
            draw_set_font(Font1);
            draw_set_halign(fa_left);
            draw_set_valign(fa_top);

            draw_text_transformed(Pos_Fundo_X + 15, Pos_Fundo_Y + 15, "Pedido Atual:", 0.45, 0.45, 0);

            if (variable_global_exists("pedidoAtivo") && global.pedidoAtivo) {

                draw_text_transformed(Pos_Fundo_X + 15, Pos_Fundo_Y + 35, string(global.pedidoTexto), 0.35, 0.35, 0);

                draw_text_transformed(Pos_Fundo_X + 15, Pos_Fundo_Y + 65, "Ingredientes:", 0.45, 0.45, 0);

                var _item_escolhido = -1;

                if (global.faseAtual == 1) {
                    _item_escolhido = global.perifericoEscolhido;
                }
                else if (global.faseAtual == 2) {
                    _item_escolhido = global.componenteEscolhido;
                }
                else if (global.faseAtual == 3) {
                    _item_escolhido = global.computadorEscolhido;
                }

                if (instance_exists(oCaixa_Receitas) && _item_escolhido != -1) {
                    if (struct_exists(oCaixa_Receitas.receitas, _item_escolhido)) {

                        var _ingredientes = oCaixa_Receitas.receitas[$ _item_escolhido];
                        var _start_y = Pos_Fundo_Y + 85;
                        var _start_x = Pos_Fundo_X + 20;

                        for (var i = 0; i < array_length(_ingredientes); i++) {
                            var _item = _ingredientes[i];

                            var _coluna = i div 3;
                            var _linha  = i mod 3;
                            var _item_x = _start_x + (_coluna * 85);
                            var _item_y = _start_y + (_linha  * 25);

                            if (sprite_exists(_item.sprite)) {
                                draw_sprite(_item.sprite, 0, _item_x, _item_y + 4);
                            }

                            var _txt = _item.nome + " x " + string(_item.quantidade);
                            draw_text_transformed(_item_x + 25, _item_y, _txt, 0.32, 0.32, 0);
                        }
                    }
                } else {
                    draw_text_transformed(Pos_Fundo_X + 15, Pos_Fundo_Y + 85, "Detalhes da receita indisponíveis.", 0.35, 0.35, 0);
                }

            } else {

                draw_text_transformed(Pos_Fundo_X + 15, Pos_Fundo_Y + 40, "Nenhum pedido aceito no momento.", 0.35, 0.35, 0);
            }
        }

        else if (Tela_Atual == "stats") {

            draw_set_font(Font_Pequena);
            draw_sprite(sBtn_Home, 0, Pos_Fundo_X + 257, Pos_Y_Apps1);

            var _area_x = Pos_Fundo_X + 15;
            var _area_y = Pos_Fundo_Y + 25;
            var _area_w = sprite_get_width(sTablet_Fundo) - 45;
            var _area_h = sprite_get_height(sTablet_Fundo) - 40;

            if (!surface_exists(global.stat_surface)) {
                global.stat_surface = surface_create(_area_w, _area_h);
            }

            surface_set_target(global.stat_surface);
            draw_clear_alpha(c_black, 0);

            draw_set_font(Font1);
            draw_set_halign(fa_left);
            draw_set_valign(fa_top);
            draw_set_colour(c_white);

            var _y_pos = -stat_scroll;
            var _espacamento = 13;

            draw_text_transformed(0, _y_pos, "=== ESTATÍSTICAS ===", 1, 1, 0);
            _y_pos += _espacamento + 4;

            var _passos = variable_global_exists("stat_passos") ? global.stat_passos : 0;
            draw_text_transformed(0, _y_pos, "- Passos andados: " + string(_passos), 1, 1, 0);
            _y_pos += _espacamento;

            var _andares = variable_global_exists("stat_andares") ? global.stat_andares : 0;
            draw_text_transformed(0, _y_pos, "- Andares descidos: " + string(_andares), 1, 1, 0);
            _y_pos += _espacamento + 4;

            draw_text_transformed(0, _y_pos, "", 0.5, 0.5, 0);
            _y_pos += _espacamento;
            draw_text_transformed(0, _y_pos, "[ Minérios Quebrados ]", 1, 1, 0);
            _y_pos += _espacamento;
            draw_text_transformed(0, _y_pos, "", 0.5, 0.5, 0);
            _y_pos += _espacamento;

            var _minerios = ["Quartzo", "Grafite", "Cobre", "Bauxita", "Ouro", "Tungstênio"];
            for (var i = 0; i < array_length(_minerios); i++) {
                var _m_nome = _minerios[i];
                var _m_qtd = 0;

                if (variable_global_exists("minerios_quebrados") && struct_exists(global.minerios_quebrados, _m_nome)) {
                    _m_qtd = global.minerios_quebrados[$ _m_nome];
                }

                draw_text_transformed(10, _y_pos, "- " + _m_nome + ": " + string(_m_qtd), 1, 1, 0);
                _y_pos += _espacamento;
                draw_text_transformed(0, _y_pos, "", 0.1, 0.1, 0);
                _y_pos += _espacamento;
            }

            var _total_minerios = variable_global_exists("stat_total_minerios") ? global.stat_total_minerios : 0;
            _y_pos += 2;
            draw_text_transformed(0, _y_pos, "- Totais Quebrados: " + string(_total_minerios), 1, 1, 0);
            _y_pos += _espacamento + 4;

            draw_text_transformed(0, _y_pos, "", 0.5, 0.5, 0);
            _y_pos += _espacamento;
            draw_text_transformed(0, _y_pos, "[ Monstros Derrotados ]", 1, 1, 0);
            _y_pos += _espacamento;
            draw_text_transformed(0, _y_pos, "", 0.5, 0.5, 0);
            _y_pos += _espacamento;

            var _monstros = ["Slime", "Morcego", "Aranha", "Boss de gelo", "Boss de terra", "Boss de lava"];
            for (var i = 0; i < array_length(_monstros); i++) {
                var _mon_nome = _monstros[i];
                var _mon_qtd = 0;

                if (variable_global_exists("monstros_derrotados") && struct_exists(global.monstros_derrotados, _mon_nome)) {
                    _mon_qtd = global.monstros_derrotados[$ _mon_nome];
                }

                draw_text_transformed(10, _y_pos, "- " + _mon_nome + ": " + string(_mon_qtd), 1, 1, 0);
                _y_pos += _espacamento;
                draw_text_transformed(0, _y_pos, "", 0.1, 0.1, 0);
                _y_pos += _espacamento;
            }

            var _total_monstros = variable_global_exists("stat_total_monstros") ? global.stat_total_monstros : 0;
            _y_pos += 2;
            draw_text_transformed(0, _y_pos, "- Totais Derrotados: " + string(_total_monstros), 1, 1, 0);
            _y_pos += _espacamento + 4;
            draw_text_transformed(0, _y_pos, "", 0.1, 0.1, 0);
            _y_pos += _espacamento;

            _y_pos += 2;
            var _pedidos = variable_global_exists("stat_pedidos") ? global.stat_pedidos : 0;
            draw_text_transformed(0, _y_pos, "- Pedidos entregues: " + string(_pedidos), 1, 1, 0);

            surface_reset_target();

            draw_surface(global.stat_surface, _area_x, _area_y);

            var _altura_conteudo_real = 520;
            if (_altura_conteudo_real > _area_h) {
                var _bar_x = Pos_Fundo_X + sprite_get_width(sTablet_Fundo) - 22;
                var _bar_y = _area_y;
                var _bar_w = 3;
                var _bar_h = _area_h;

                draw_set_colour(c_dkgrey);
                draw_rectangle(_bar_x, _bar_y, _bar_x + _bar_w, _bar_y + _bar_h, false);

                var _proporcao = _area_h / _altura_conteudo_real;
                var _thumb_h = max(18, _bar_h * _proporcao);
                var _max_scroll = _altura_conteudo_real - _area_h;
                var _scroll_pct = (_max_scroll > 0) ? (stat_scroll / _max_scroll) : 0;
                var _thumb_y = _bar_y + (_bar_h - _thumb_h) * _scroll_pct;

                draw_set_colour(c_white);
                draw_rectangle(_bar_x, _thumb_y, _bar_x + _bar_w, _thumb_y + _thumb_h, false);
            }
        }

        else if (Tela_Atual == "conquista") {

            draw_set_colour(c_white);
            draw_set_font(Font1);
            draw_set_halign(fa_left);
            draw_set_valign(fa_top);

            var _Mouse_X = device_mouse_x_to_gui(0);
            var _Mouse_Y = device_mouse_y_to_gui(0);
            var _total_conquistas = array_length(global.conquistas);
            var _desbloqueadas = 0;
            var _hover = -1;

            for (var i = 0; i < _total_conquistas; i++) {
                var _conq = global.conquistas[i];
                var _coluna = i mod Conq_Colunas;
                var _linha = i div Conq_Colunas;
                var _cx = Conq_Inicio_X + (_coluna * Conq_Espaco);
                var _cy = Conq_Inicio_Y + (_linha * Conq_Espaco);

                if (_conq.desbloqueada) {
                    _desbloqueadas++;
                    draw_sprite_stretched(_conq.sprite, 0, _cx, _cy, Conq_Tam, Conq_Tam);
                } else {
                    draw_sprite_stretched(sConq_Vazia, 0, _cx, _cy, Conq_Tam, Conq_Tam);
                }

                if (point_in_rectangle(_Mouse_X, _Mouse_Y, _cx, _cy, _cx + Conq_Tam, _cy + Conq_Tam)) {
                    _hover = i;
                }
            }

            draw_text_transformed(Pos_Fundo_X + 15, Pos_Fundo_Y + 15, "Conquistas: " + string(_desbloqueadas) + "/" + string(_total_conquistas), 0.45, 0.45, 0);

            if (_hover != -1) {
                var _conq_hover = global.conquistas[_hover];
                var _texto = _conq_hover.nome;

                if (_conq_hover.desbloqueada) {
                    _texto += "\n" + _conq_hover.descricao;
                }

                var _larg = (string_width(_texto) * 0.4) + 10;
                var _alt = (string_height(_texto) * 0.4) + 10;
                var _bx = min(_Mouse_X + 8, display_get_gui_width() - _larg - 2);
                var _by = min(_Mouse_Y + 8, display_get_gui_height() - _alt - 2);

                draw_set_alpha(0.9);
                draw_set_colour(c_black);
                draw_rectangle(_bx, _by, _bx + _larg, _by + _alt, false);

                draw_set_alpha(1);
                draw_set_colour(c_white);
                draw_rectangle(_bx, _by, _bx + _larg, _by + _alt, true);

                draw_text_transformed(_bx + 5, _by + 5, _texto, 0.4, 0.4, 0);
            }
        }

        else if (Tela_Atual == "sair") {

            draw_sprite(sBtn_Home, 0, Pos_Fundo_X + 257, Pos_Y_Apps1);

            draw_set_font(Font1);
            draw_set_halign(fa_center);
            draw_set_valign(fa_middle);
            draw_set_colour(c_white);
            draw_text_transformed(Pos_Fundo_X + 140, Pos_Fundo_Y + 20, "Opções de Saída", 0.8, 0.8, 0);

            var _bm_x = Pos_Fundo_X + 78;
            var _bm_y = Pos_Fundo_Y + 55;

            draw_sprite(sBtn_MenuPrincipal, 0, _bm_x, _bm_y);
            draw_text_transformed(_bm_x + (sprite_get_width(sBtn_MenuPrincipal) / 2), _bm_y + (sprite_get_height(sBtn_MenuPrincipal) / 2), "Menu Principal", 0.35, 0.35, 0);

            var _bs_x = Pos_Fundo_X + 148;
            var _bs_y = Pos_Fundo_Y + 55;

            draw_sprite(sBtn_FecharJogo, 0, _bs_x, _bs_y);
            draw_text_transformed(_bs_x + (sprite_get_width(sBtn_FecharJogo) / 2), _bs_y + (sprite_get_height(sBtn_FecharJogo) / 2), "Fechar Jogo", 0.35, 0.35, 0);

            draw_set_halign(fa_left);
            draw_set_valign(fa_top);
        }
    }
}
