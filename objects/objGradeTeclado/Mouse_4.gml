if (!encaixada && instance_exists(objTeclas)) {
    if (objTeclas.encaixada) {
        arrastando = true;

        offsetX = x - mouse_x;
        offsetY = y - mouse_y;
    }
}