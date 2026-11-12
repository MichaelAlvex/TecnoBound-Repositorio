var _fala = falas[indice];
var _avancar = mouse_check_button_pressed(mb_left) || keyboard_check_pressed(ord("E"));

if (_avancar) {
	audio_play_sound(snd_Click, 2, 0);
}

if (chars < string_length(_fala)) {
    chars += vel_texto;
    if (_avancar) chars = string_length(_fala);
} else if (_avancar) {
    indice++;
    chars = 0;
    if (indice >= array_length(falas)) {
        global.dialogo_visto = true;
        room_goto_next();
    }
}