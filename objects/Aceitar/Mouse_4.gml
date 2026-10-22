with (ControlePedidos) {
    global.pedidoAceito = pedidoAtual;
    global.pedidoTexto = pedidos[pedidoAtual];
    global.pedidoAtivo = true;
	global.perifericoEscolhido = pedidoAtual;
}

room_goto(Room_0);