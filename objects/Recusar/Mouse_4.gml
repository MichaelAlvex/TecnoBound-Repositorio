if (global.faseAtual == 1) {
    with (ControlePedidos) {
        var limitePedido = 2;
        var novoPedido = irandom(limitePedido);

        while (novoPedido == pedidoAtual) {
            novoPedido = irandom(limitePedido);
        }

        pedidoAtual = novoPedido;
        global.pedidoAtual = pedidoAtual;
    }
}
else if (global.faseAtual == 2) {
    with (ControlePedidosFase2) {
        var limitePedido = 1;
        var novoPedido = irandom(limitePedido);

        while (novoPedido == pedidoAtual) {
            novoPedido = irandom(limitePedido);
        }

        pedidoAtual = novoPedido;
        global.pedidoAtual = pedidoAtual;
    }
}