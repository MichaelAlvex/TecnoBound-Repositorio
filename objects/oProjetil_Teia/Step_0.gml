var _tamanho_grade = 16;

var _Teia_x = (x div _tamanho_grade) * _tamanho_grade;
var _Teia_y = (y div _tamanho_grade) * _tamanho_grade;


if (point_distance(x, y, alvo_x, alvo_y) <= 4 || place_meeting(x, y, oParede_Invisivel)) {
	instance_create_layer(_Teia_x, _Teia_y, "Instances", oTeia);
	instance_destroy();
}

