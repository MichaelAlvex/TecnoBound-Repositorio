if (!instance_exists(oPlayer) || !esta_queimado()) {
    instance_destroy();
    exit;
}

frame += 0.2; 