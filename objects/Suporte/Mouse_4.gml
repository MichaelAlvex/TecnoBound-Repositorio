if (!encaixada && instance_exists(Base_Interna)) {
    if (Base_Interna.encaixada) {
        arrastando = true;
        offsetX = x - mouse_x;
        offsetY = y - mouse_y;
    }
}