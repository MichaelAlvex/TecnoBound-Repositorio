if (oInventario.Inventario_Aberto == false){
	var _Item_Atual = oInventario.Inventario[oInventario.Slot_Selecionado];
	if (_Item_Atual != noone && _Item_Atual.nome == "Picareta"){
		if (distance_to_object(oPlayer) <= 40){
			id.hp -=1;
			if (id.hp <= 0){
				instance_destroy()
			}
		}
	}
}
		