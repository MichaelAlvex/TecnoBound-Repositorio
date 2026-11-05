if (Tablet_Aberto == true) {

	var _Mouse_X = device_mouse_x_to_gui(0);
    var _Mouse_Y = device_mouse_y_to_gui(0);
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

            draw_set_font(Font4);
            draw_set_halign(fa_left);
            draw_set_valign(fa_top);
            draw_set_colour(c_white);

            var _y_pos = -stat_scroll;
            var _espacamento = 13;                  
            var _esp_item = _espacamento * 2;        
            var _esp_secao = _espacamento;           
            var _esp_titulo = _espacamento * 2;      

            draw_text_transformed(0, _y_pos, "ESTATÍSTICAS", 1, 1, 0);
            _y_pos += _espacamento + 4;

            var _passos = variable_global_exists("stat_passos") ? global.stat_passos : 0;
            draw_text_transformed(0, _y_pos, "- Passos andados: " + string(_passos), 1, 1, 0);
            _y_pos += _espacamento;

            var _andares = variable_global_exists("stat_andares") ? global.stat_andares : 0;
            draw_text_transformed(0, _y_pos, "- Andares descidos: " + string(_andares), 1, 1, 0);
            _y_pos += _espacamento + 4 + _esp_secao;

            draw_text_transformed(0, _y_pos, "[ Minérios Quebrados ]", 1, 1, 0);
            _y_pos += _esp_titulo;

            var _minerios = ["Quartzo", "Grafite", "Cobre", "Bauxita", "Ouro", "Tungstênio"];
            for (var i = 0; i < array_length(_minerios); i++) {
                var _m_nome = _minerios[i];
                var _m_qtd = 0;

                if (variable_global_exists("minerios_quebrados") && struct_exists(global.minerios_quebrados, _m_nome)) {
                    _m_qtd = global.minerios_quebrados[$ _m_nome];
                }

                draw_text_transformed(10, _y_pos, "- " + _m_nome + ": " + string(_m_qtd), 1, 1, 0);
                _y_pos += _esp_item;
            }

            var _total_minerios = variable_global_exists("stat_total_minerios") ? global.stat_total_minerios : 0;
            _y_pos += 2;
            draw_text_transformed(0, _y_pos, "- Totais Quebrados: " + string(_total_minerios), 1, 1, 0);
            _y_pos += _espacamento + 4 + _esp_secao;

            draw_text_transformed(0, _y_pos, "[ Monstros Derrotados ]", 1, 1, 0);
            _y_pos += _esp_titulo;

            var _monstros = ["Slime", "Morcego", "Aranha", "Boss de gelo", "Boss de terra", "Boss de lava"];
            for (var i = 0; i < array_length(_monstros); i++) {
                var _mon_nome = _monstros[i];
                var _mon_qtd = 0;

                if (variable_global_exists("monstros_derrotados") && struct_exists(global.monstros_derrotados, _mon_nome)) {
                    _mon_qtd = global.monstros_derrotados[$ _mon_nome];
                }

                draw_text_transformed(10, _y_pos, "- " + _mon_nome + ": " + string(_mon_qtd), 1, 1, 0);
                _y_pos += _esp_item;
            }

            var _total_monstros = variable_global_exists("stat_total_monstros") ? global.stat_total_monstros : 0;
            _y_pos += 2;
            draw_text_transformed(0, _y_pos, "- Totais Derrotados: " + string(_total_monstros), 1, 1, 0);
            _y_pos += _espacamento + 4 + _esp_secao + 2;

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
				draw_set_font(Font1);
            }
        }

        else if (Tela_Atual == "opcoes") {

            var _nomes_volume = ["Geral", "BGM", "SFX", "UI"];

            draw_set_colour(c_white);
            draw_set_font(Font2);
            draw_set_halign(fa_left);
            draw_set_valign(fa_top);

            draw_text_transformed(Pos_Fundo_X + 15, Pos_Fundo_Y + 15, "Opções", 0.5, 0.5, 0);

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
                draw_text_transformed(Conf_Vol_X + Conf_Vol_W + 8 + _ox, _sy, string(round(_valor * 100)) + "%", 0.5, 0.5, 0);
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

        else if (Tela_Atual == "conquista") {

            draw_set_colour(c_white);
            draw_set_font(Font1);
            draw_set_halign(fa_left);
            draw_set_valign(fa_top);

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

                var _esc_tip = 0.45;     
                var _pad = 5;            
                var _gap = 4;            
                var _larg_max = 180;      
                var _sep = string_height("Ag") * 1.15; 

                var _nome = _conq_hover.nome;
                var _desc = _conq_hover.desbloqueada ? _conq_hover.descricao : "";

                var _w_nome = string_width(_nome) * _esc_tip;
                var _h_nome = string_height(_nome) * _esc_tip;
                var _w_desc = 0;
                var _h_desc = 0;

                if (_desc != "") {
                    _w_desc = string_width_ext(_desc, _sep, _larg_max / _esc_tip) * _esc_tip;
                    _h_desc = string_height_ext(_desc, _sep, _larg_max / _esc_tip) * _esc_tip;
                }

                var _larg = max(_w_nome, _w_desc) + (_pad * 2);
                var _alt = _h_nome + ((_desc != "") ? (_gap + _h_desc) : 0) + (_pad * 2);
                var _bx = min(_Mouse_X + 8, display_get_gui_width() - _larg - 2);
                var _by = min(_Mouse_Y + 8, display_get_gui_height() - _alt - 2);

                draw_set_alpha(0.9);
                draw_set_colour(c_black);
                draw_rectangle(_bx, _by, _bx + _larg, _by + _alt, false);

                draw_set_alpha(1);
                draw_set_colour(c_white);
                draw_rectangle(_bx, _by, _bx + _larg, _by + _alt, true);

                draw_text_transformed(_bx + _pad, _by + _pad, _nome, _esc_tip, _esc_tip, 0);

                if (_desc != "") {
                    draw_text_ext_transformed(_bx + _pad, _by + _pad + _h_nome + _gap, _desc, _sep, _larg_max / _esc_tip, _esc_tip, _esc_tip, 0);
                }
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
            draw_text_transformed(_bs_x + (sprite_get_width(sBtn_FecharJogo) / 2), _bs_y + (sprite_get_height(sBtn_FecharJogo) / 2), "Salvar e Fechar Jogo", 0.35, 0.35, 0);

            draw_set_halign(fa_left);
            draw_set_valign(fa_top);
        } else if (Tela_Atual == "ajuda") {

    var _pag = Ajuda_Paginas[Ajuda_Pagina];
    var _n_pag = array_length(Ajuda_Paginas);

    draw_set_font(Font1);
    draw_set_colour(c_white);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);

    draw_text_transformed(Pos_Fundo_X + 15, Pos_Fundo_Y + 15, "Ajuda", 0.45, 0.45, 0);

    var _ix = Ajuda_Area_X;
    var _iy = Ajuda_Area_Y;
    var _iw = Ajuda_Img_W;
    var _ih = Ajuda_Corpo_H;

    draw_set_colour(c_dkgrey);
    draw_rectangle(_ix, _iy, _ix + _iw, _iy + _ih, false);

    if (sprite_exists(_pag.sprite)) {
        var _sw = sprite_get_width(_pag.sprite);
        var _sh = sprite_get_height(_pag.sprite);
        var _esc_img = min((_iw - 4) / _sw, (_ih - 4) / _sh);
        var _dx = _ix + ((_iw - (_sw * _esc_img)) / 2) + (sprite_get_xoffset(_pag.sprite) * _esc_img);
        var _dy = _iy + ((_ih - (_sh * _esc_img)) / 2) + (sprite_get_yoffset(_pag.sprite) * _esc_img);

        draw_sprite_ext(_pag.sprite, 0, _dx, _dy, _esc_img, _esc_img, 0, c_white, 1);
    } else {
        draw_set_colour(c_gray);
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        draw_text_transformed(_ix + (_iw / 2), _iy + (_ih / 2), "Imagem", 0.4, 0.4, 0);
        draw_set_halign(fa_left);
        draw_set_valign(fa_top);
    }

    draw_set_colour(c_white);
    draw_rectangle(_ix, _iy, _ix + _iw, _iy + _ih, true);

    var _tx = Ajuda_Texto_X;
    var _ty = Ajuda_Area_Y;
    var _tw = Ajuda_Texto_W;

    var _esc_tit = 0.5;
    draw_text_transformed(_tx, _ty, _pag.titulo, _esc_tit, _esc_tit, 0);
    var _h_tit = (string_height(_pag.titulo) * _esc_tit) + 4;

    var _sep = string_height("Ag") * 1.15;
    var _th = Ajuda_Corpo_H - _h_tit;
    var _esc_txt = 0.4;

    while (_esc_txt > 0.2 && (string_height_ext(_pag.texto, _sep, _tw / _esc_txt) * _esc_txt) > _th) {
        _esc_txt -= 0.025;
    }

    draw_text_ext_transformed(_tx, _ty + _h_tit, _pag.texto, _sep, _tw / _esc_txt, _esc_txt, _esc_txt, 0);

    var _ty_seta = Ajuda_Rodape_Y;
    var _t = Ajuda_Seta_Tam;
    var _xe = Ajuda_Seta_Esq_X;
    var _xd = Ajuda_Seta_Dir_X;

    var _sobre_e = point_in_rectangle(_Mouse_X, _Mouse_Y, _xe, _ty_seta, _xe + _t, _ty_seta + _t);
    var _sobre_d = point_in_rectangle(_Mouse_X, _Mouse_Y, _xd, _ty_seta, _xd + _t, _ty_seta + _t);

    draw_set_colour(_sobre_e ? c_gray : c_dkgrey);
    draw_rectangle(_xe, _ty_seta, _xe + _t, _ty_seta + _t, false);
    draw_set_colour(c_white);
    draw_rectangle(_xe, _ty_seta, _xe + _t, _ty_seta + _t, true);
    draw_triangle(_xe + _t - 4, _ty_seta + 3, _xe + _t - 4, _ty_seta + _t - 3, _xe + 4, _ty_seta + (_t / 2), false);

    draw_set_colour(_sobre_d ? c_gray : c_dkgrey);
    draw_rectangle(_xd, _ty_seta, _xd + _t, _ty_seta + _t, false);
    draw_set_colour(c_white);
    draw_rectangle(_xd, _ty_seta, _xd + _t, _ty_seta + _t, true);
    draw_triangle(_xd + 4, _ty_seta + 3, _xd + 4, _ty_seta + _t - 3, _xd + _t - 4, _ty_seta + (_t / 2), false);

    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text_transformed(Ajuda_Area_X + (Ajuda_Area_W / 2), _ty_seta + (_t / 2), string(Ajuda_Pagina + 1) + "/" + string(_n_pag), 0.45, 0.45, 0);

    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}
    }
}
