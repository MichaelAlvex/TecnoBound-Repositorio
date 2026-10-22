if (arrastando && !encaixada) {
    x = mouse_x + offsetX;
    y = mouse_y + offsetY;
}

if (arrastando && mouse_check_button_released(mb_left)) {
    arrastando = false;

    if (global.etapaPV == etapaNecessaria &&
        point_distance(x, y, posicaoAlvoX, posicaoAlvoY) <= 30) {

        x = posicaoAlvoX;
        y = posicaoAlvoY;

        encaixada = true;
        global.etapaPV += 1;

        if (etapaNecessaria == 5) {
            global.montagemPVConcluida = true;
        }
    }
}