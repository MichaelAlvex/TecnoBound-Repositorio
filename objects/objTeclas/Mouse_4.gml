var idBase = asset_get_index("objBaseTeclado");

if (idBase != -1) {
    var base = instance_find(idBase, 0);

    if (!encaixada && base != noone && base.encaixada) {
        arrastando = true;

        offsetX = x - mouse_x;
        offsetY = y - mouse_y;
    }
}