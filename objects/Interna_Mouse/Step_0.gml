if (global.baseMontada && !encaixada) {
    if (arrastando) {
        if (mouse_check_button(mb_left)) {
            x = mouse_x + offsetX;
            y = mouse_y + offsetY;
        }
        else {
            arrastando = false;

            var distancia = point_distance(
                x, y,
                posicaoAlvoX, posicaoAlvoY
            );

            if (distancia <= 30) {
                x = posicaoAlvoX;
                y = posicaoAlvoY;
                encaixada = true;

                global.internaMontada = true;
            }
        }
    }
}