if (instance_exists(oPlayer)) {
    oPlayer.visible = false;
	oPlayer.Player_Move = false;
	oMenu_Tablet.Tablet_Aberto = false;
}

if (instance_exists(oInventario)) {
    oInventario.Inventario_Aberto = true;
	oInventario.visible = false;
}