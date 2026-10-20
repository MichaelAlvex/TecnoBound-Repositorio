if (!encaixada && instance_exists(Interno2)) {
    if (Interno2.encaixada && arrastando) {
        if (mouse_check_button(mb_left)) {
            x = mouse_x + offsetX;
            y = mouse_y + offsetY;
        } else {
            arrastando = false;

            if (point_distance(x, y, posicaoAlvoX, posicaoAlvoY) <= 30) {
                x = posicaoAlvoX;
                y = posicaoAlvoY;
                encaixada = true;
            }
        }
    }
}