if (arrastando) {
    x = mouse_x + offsetX;
    y = mouse_y + offsetY;

    if (mouse_check_button_released(mb_left)) {
        arrastando = false;
    }
}