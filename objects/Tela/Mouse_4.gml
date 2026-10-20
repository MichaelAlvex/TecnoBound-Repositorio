if (!encaixada && instance_exists(Contorno)) {
    if (Contorno.encaixada) {
        arrastando = true;
        offsetX = x - mouse_x;
        offsetY = y - mouse_y;
    }
}