draw_set_font(Font1);
if (!variable_global_exists("stat_total_monstros")) {
    global.stat_total_monstros = 0;
}

audio_stop_sound(mus_Gelo);