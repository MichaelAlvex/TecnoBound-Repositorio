if (mostrar_aviso) {
    var _pulso = 0.5 + 0.5 * sin(timer * 0.5);

    draw_set_color(c_red);
    draw_set_alpha(0.15 + 0.15 * _pulso);
    draw_circle(soco_cx, soco_cy, soco_raio, false);       

    draw_set_alpha(0.35);
    draw_circle(soco_cx, soco_cy, soco_raio * soco_prog, false); 

    draw_set_alpha(0.6 + 0.4 * _pulso);
    draw_circle(soco_cx, soco_cy, soco_raio, true);      

    draw_set_alpha(1);
    draw_set_color(c_white);
}

draw_self();