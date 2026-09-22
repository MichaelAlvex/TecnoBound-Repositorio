if (room == Menu) exit;

var _Tamanho_Tile = 16;
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

var _Fila_X = ds_queue_create();
var _Fila_Y = ds_queue_create();

ds_queue_enqueue(_Fila_X, _Centro_X);
ds_queue_enqueue(_Fila_Y, _Centro_Y);

_Grade[# _Centro_X, _Centro_Y] = 3;

while (!ds_queue_empty(_Fila_X)){
	var _Atual_X = ds_queue_dequeue(_Fila_X);
	var _Atual_Y = ds_queue_dequeue(_Fila_Y);
	var _Dir_X = [1, -1, 0, 0];
	var _Dir_Y = [0, 0, 1, -1];
	
	for (var i = 0; i < 4; i++){
		var _Viz_X = _Atual_X + _Dir_X[i];
		var _Viz_Y = _Atual_Y + _Dir_Y[i];
		
		if (_Viz_X > 0 && _Viz_X < _Largura_Grade - 1 && _Viz_Y > 0 && _Viz_Y < _Altura_Grade - 1){
			
			if (_Grade[# _Viz_X, _Viz_Y] == 0){
				_Grade[# _Viz_X, _Viz_Y] = 3;
				ds_queue_enqueue(_Fila_X, _Viz_X);
				ds_queue_enqueue(_Fila_Y, _Viz_Y);
			}
		}
	}
}

ds_queue_destroy(_Fila_X);
ds_queue_destroy(_Fila_Y);

for (var _X_Sub = 0; _X_Sub < _Largura_Grade; _X_Sub++){
	for (var _Y_Sub = 0; _Y_Sub < _Altura_Grade; _Y_Sub++){
		
		if (_Grade[# _X_Sub, _Y_Sub] == 0){
			_Grade[# _X_Sub, _Y_Sub] = 1;
		} else if (_Grade[# _X_Sub, _Y_Sub] == 3){
			_Grade[# _X_Sub, _Y_Sub] = 0;
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
			
			var _Peso = 0;
			
			if (_y > 0 && _Grade[# _x, _y - 1] == 1){
				_Peso += 1;
				}else if (_y == 0){
					 _Peso += 1;
				}
					
				
			if (_x < _Largura_Grade - 1 && _Grade[# _x + 1, _y] == 1){
				_Peso += 2;
				}else if (_x == _Largura_Grade - 1){
					 _Peso += 2;
				}
					 
				
			if (_y < _Altura_Grade - 1 && _Grade[# _x, _y + 1] == 1){
				_Peso += 4;
				}else if (_y == _Altura_Grade - 1){
					_Peso += 4;
				}
					
				
			if (_x > 0 && _Grade[# _x - 1, _y] == 1){
				_Peso += 8;
				}else if (_x == 0){
					_Peso += 8;
				}
					
			var _Lista_Tiles_Parede = [
				7,
				8,
				9,
				10,
				11,
				12,
				13,
				14,
				15,
				16,
				17,
				18,
				19,
				20,
				21,
				22
			];
			
			var _Tile_Parede_Final = _Lista_Tiles_Parede[_Peso];
			
			tilemap_set(_tilemap_id, _Tile_Parede_Final, _x, _y);
			instance_create_layer(_Pos_x, _Pos_y, "Instances", oParede_Invisivel);
		} else{
			var _tile_chao = choose(1, 2, 5, 6)
			tilemap_set(_tilemap_id, _tile_chao, _x, _y);
		}
	}
}

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
		instance_create_layer(_x_Pedra, _y_Pedra, "Instances", oParede_Invisivel);
		
		_Grade [# _x_Grade, _y_Grade] = 2;
		_NumPedras++;
	}
	_Tentativas++;
	}
	
ds_grid_destroy(_Grade);