timer++;
image_alpha = min(1, (duracao - timer) / 60);

var _p = instance_place(x, y, oPlayer);
if (_p != noone) {
    _p.queimadura_ate = current_time + queimadura_ms;
    if (!instance_exists(oEfeito_Queimadura)) {
        instance_create_layer(_p.x, _p.y, "Instances", oEfeito_Queimadura);
    }
}

if (timer >= duracao) instance_destroy();