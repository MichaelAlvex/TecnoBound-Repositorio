if (room == Menu) exit;

var _qntPedras = irandom_range(5, 10);
var _Grade = 16;
var _NumPedras = 0;
var _Tentativas = 0;

while (_NumPedras < _qntPedras && _Tentativas < 1000){
	
	var _x = irandom_range(1, (room_width / _Grade - 2) * _Grade);
	var _y = irandom_range(1, (room_height / _Grade - 2) * _Grade);
	
	var _Bloco_Livre = !position_meeting(_x, _y, oPlayer) && !position_meeting(_x, _y, oPedra_Mae);
	
	if (_Bloco_Livre){
		
		var _Chance_Minerio = random(100);
		var _Tipo_Pedra = oPedra_Cobre;
		
		if (_Chance_Minerio < 15){
			_Tipo_Pedra = oPedra_Ouro
		}
		
		instance_create_layer(_x, _y, "Instances", _Tipo_Pedra);
		_NumPedras++;
	}
	_Tentativas++;
}