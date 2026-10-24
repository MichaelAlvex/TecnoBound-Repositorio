_Mouse_Gui_X = device_mouse_x_to_gui(0);
_Mouse_Gui_Y = device_mouse_y_to_gui(0);

if (point_in_rectangle(
    _Mouse_Gui_X,
    _Mouse_Gui_Y,
    Pos_Caixa_X_Feito,
    Pos_Caixa_Y_Feito,
    Pos_Caixa_X_Feito + _Tam_Btn_X,
    Pos_Caixa_Y_Feito + _Tam_Btn_Y
)) {
    if (mouse_check_button_pressed(mb_left)) {

        if (global.faseAtual == 1) {

            switch (global.perifericoEscolhido) {
                case 0:
                    room_goto(rMontagemMouse);
                    break;

                case 1:
                    room_goto(rMontagemTeclado);
                    break;

                case 2:
                    room_goto(rMontagemMonitor);
                    break;

                default:
                    show_debug_message(
                        "ERRO: nenhum periferico valido foi escolhido."
                    );
                    break;
            }

        } else if (global.faseAtual == 2) {

            switch (global.componenteEscolhido) {
                case 0:
                    room_goto(MontagemPMae);
                    break;

                case 1:
                    room_goto(MontagemPVideo);
                    break;
				case 2:
					room_goto(MontagemProcessador);
					break;
                default:
                    show_debug_message(
                        "ERRO: nenhum componente valido foi escolhido."
                    );
                    break;
            }

        }
    }
}