if (!encaixada && instance_exists(Suporte)) {
    if (Suporte.encaixada) {
        arrastando = true;
        offsetX = x - mouse_x;
        offsetY = y - mouse_y;
    }
}