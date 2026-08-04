if (z < 0 || z_speed != 0){
	z_speed += gravidade;
	z += z_speed;
	
	if (z >= 0){
		z = 0;
		z_speed = 0;
		speed = 0;
	}
}

	if (z == 0){
		timer_flutuacao += velocidade_flutuacao;
	}

if (z == 0 && distance_to_object(oPlayer) <= 10){
	
	var _Coletado = false;
	
	for (i = 0; i < oInventario.Tamanho_Inventario; i++){
		
		var _Slot = oInventario.Inventario[i];
		
		if (_Slot != noone && _Slot.nome = Nome){
			_Slot.quantidade += Quantidade;
			_Coletado = true;
			break;
		}
	}
		
		if (_Coletado == false){
			
			for (i = 0; i < oInventario.Tamanho_Inventario; i++){
				
				if (oInventario.Inventario[i] == noone){
					oInventario.Inventario[i] = {
						nome: Nome,
						sprite: Sprite,
						quantidade: Quantidade,
						descricao: Descricao,
					};
					_Coletado = true;
					break;
				}
			}
		}
		
		if (_Coletado = true){
			instance_destroy()
		}
	}