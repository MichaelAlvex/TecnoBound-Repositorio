if (room == Menu) exit;

var _Tamanho_Tile = 32;
var _Largura_Grade = room_width / _Tamanho_Tile;
var _Altura_Grade = room_height / _Tamanho_Tile;

var _Grade = ds_grid_create(_Largura_Grade, _Altura_Grade);
var _Chance_Parede = 40;

for (var _x = 0; _x < _Largura_Grade; _x++){
	for (var _y = 0;_y < _Altura_Grade;_y++){
		if (_x == 0 || _y == 0 || _x == _Largura_Grade - 1 || _y == _Altura_Grade - 1 || random(100) < _Chance_Parede){
			_Grade[# _x, _y] = 1;
		} else{
			_Grade[# _x, _y] = 0;
		}
	}
}

var _Refinamentos = 6;
var _Grade_Temp = ds_grid_create(_Largura_Grade, _Altura_Grade);

repeat (_Refinamentos){
	ds_grid_copy(_Grade_Temp, _Grade);
	
	for (var _x = 1; _x < _Largura_Grade - 1; _x++){
	for (var _y = 1; _y < _Altura_Grade - 1; _y++){
		
		var _Blocos_Adjacentes = 0;
		
		for (var _vx = -1; _vx <= 1; _vx++){
			for (var _vy = -1; _vy <= 1; _vy++){
				if (_vx != 0 || _vy != 0){
					if (_Grade_Temp[# _x + _vx, _y + _vy] == 1){
						_Blocos_Adjacentes++
					}
				}
			}
		}
		
		if (_Blocos_Adjacentes > 4){
			_Grade[# _x, _y] = 1;
		} else if (_Blocos_Adjacentes < 4){
			_Grade[# _x, _y] = 0;
		}
	}
	}
}

ds_grid_destroy(_Grade_Temp);

var _Centro_X = _Largura_Grade div 2;
var _Centro_Y = _Altura_Grade div 2;
var _Raio_Seguro = 2;

for (var _cx = -_Raio_Seguro; _cx <= _Raio_Seguro; _cx++){
	for (var _cy = -_Raio_Seguro; _cy <= _Raio_Seguro; _cy++){
		if ((_Centro_X + _cx > 0) && (_Centro_X + _cx < _Largura_Grade - 1) &&
			(_Centro_Y + _cy > 0) && (_Centro_Y + _cy < _Altura_Grade - 1)){
				_Grade [# _Centro_X + _cx, _Centro_Y + _cy] = 0;
			}
	}
}


var _ID_Tilemap = layer_get_id("Tiles_Caverna");
var _tilemap_id = layer_tilemap_get_id(_ID_Tilemap);

for (var _x = 0; _x < _Largura_Grade; _x++){
	for (var _y = 0; _y < _Altura_Grade; _y++){
		
		var _Pos_x = _x * _Tamanho_Tile;
		var _Pos_y = _y * _Tamanho_Tile;
		
		if (_Grade[# _x, _y] == 1){
			tilemap_set(_tilemap_id, 1, _x, _y);
			instance_create_layer(_Pos_x, _Pos_y, "Instances", oParede_Invisivel);
		} else{
			tilemap_set(_tilemap_id, 2, _x, _y);
		}
	}
}

if (room == Menu) exit;

var _qntPedras = irandom_range(5, 10);
var _NumPedras = 0;
var _Tentativas = 0;

while (_NumPedras < _qntPedras && _Tentativas < 1000){
	
	var _x_Grade = irandom_range(1, _Largura_Grade - 2);
	var _y_Grade = irandom_range(1, _Altura_Grade - 2);
	
	if (_Grade[# _x_Grade, _y_Grade] == 0){
		
		var _x_Pedra = _x_Grade * _Tamanho_Tile;
		var _y_Pedra = _y_Grade * _Tamanho_Tile;

		var _Chance_Minerio = random(100);
		var _Tipo_Pedra = oPedra_Cobre;
		
		if (_Chance_Minerio <= 15){
			_Tipo_Pedra = oPedra_Aluminio;
		}
		
		instance_create_layer(_x_Pedra, _y_Pedra, "Instances", _Tipo_Pedra);
		
		_Grade [# _x_Grade, _y_Grade] = 2;
		_NumPedras++;
	}
	_Tentativas++;
	}
ds_grid_destroy(_Grade)