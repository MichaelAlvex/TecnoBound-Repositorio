instance_create_layer(x, y, "Instances", objeto_drop);

var _chance_escada = 100;
var _total_pedras = instance_number(oPedra_Mae);

if (_total_pedras <= 1){
	_chance_escada = 100;
}

if (random(100) <= _chance_escada){
	instance_create_layer(x, y, "Instances", oEscada)
}