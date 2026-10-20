with (ControlePedidos) {
    global.pedidoAceito = pedidoAtual;
    global.pedidoTexto = pedidos[pedidoAtual];
    global.pedidoAtivo = true;
}

room_goto(Room_0);