var offset_x = 0;
var offset_y = 0;
    
if (Monstro_Tremer_Timer > 0){
	offset_x = random_range(-tremer_potencia, tremer_potencia);
	offset_y = random_range(-tremer_potencia, tremer_potencia);
}
draw_sprite_ext(sMorcego, image_index, x + offset_x, y + offset_y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);