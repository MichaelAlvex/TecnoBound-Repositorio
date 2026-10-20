var idBase = asset_get_index("objBaseTeclado");

if (idBase != -1) {
    var base = instance_find(idBase, 0);

    if (!encaixada && base != noone && base.encaixada) {

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
                }
            }
        }
    }
}