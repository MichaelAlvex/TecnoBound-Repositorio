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

var _Refinamentos = 5;
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

var _ID_Tilemap = layer_get_id("Tiles_Caverna");
var _tilemap_id = layer_tilemap_get_id(_ID_Tilemap);

for (var _x = 0; _x < _Largura_Grade; _x++){
	for (var _y = 0; _y < _Altura_Grade; _y++){
		
		var _Pos_x = _x * _Tamanho_Tile;
		var _Pos_y = _y * _Tamanho_Tile;
		
		if (_Grade[# _x, _y] == 1){
			tilemap_set(_ID_Tilemap, 1, _x, _y);
			instance_create_layer(_Pos_x, _Pos_y, "Instances", oParede_Invisivel);
		} else{
			tilemap_set(_ID_Tilemap, 3, _x, _y);
		}
	}
}
		
ds_grid_destroy(_Grade)