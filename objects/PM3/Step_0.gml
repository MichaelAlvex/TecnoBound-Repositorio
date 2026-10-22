if (arrastando && !encaixada) {
    x = mouse_x + offsetX;
    y = mouse_y + offsetY;
}

if (arrastando && mouse_check_button_released(mb_left)) {
    arrastando = false;

    if (global.etapaPM == etapaNecessaria &&
        point_distance(x, y, posicaoAlvoX, posicaoAlvoY) <= 30) {

        x = posicaoAlvoX;
        y = posicaoAlvoY;

        encaixada = true;
        global.etapaPM += 1;

        if (etapaNecessaria == 6) {
            global.montagemPMConcluida = true;
        }
    }
}