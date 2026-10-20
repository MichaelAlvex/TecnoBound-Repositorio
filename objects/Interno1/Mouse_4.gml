if (!encaixada && instance_exists(Base)) {
    if (Base.encaixada) {
        arrastando = true;
        offsetX = x - mouse_x;
        offsetY = y - mouse_y;
    }
}