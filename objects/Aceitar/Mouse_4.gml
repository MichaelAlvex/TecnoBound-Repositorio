
if (global.faseAtual == 1) {
    with (ControlePedidos) {
        global.pedidoAceito = pedidoAtual;
        global.pedidoAtivo = true;
        global.pedidoTexto = pedidos[pedidoAtual];
        global.perifericoEscolhido = pedidoAtual;
    }
}
else if (global.faseAtual == 2) {
    with (ControlePedidosFase2) {
        global.pedidoAceito = pedidoAtual;
        global.pedidoAtivo = true;
        global.pedidoTexto = pedidos[pedidoAtual];
        global.componenteEscolhido = pedidoAtual;
    }
}
else if (global.faseAtual == 3) {
    with (ControlePedidosFase3) {
        global.pedidoAceito = pedidoAtual;
        global.pedidoAtivo = true;
        global.pedidoTexto = pedidos[pedidoAtual];
        global.computadorEscolhido = pedidoAtual;
    }
}

room_goto(Room_0);


