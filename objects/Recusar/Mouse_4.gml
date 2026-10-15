with (ControlePedidos) {
    var novoPedido = irandom(2);
    while (novoPedido == pedidoAtual) {
        novoPedido = irandom(2);
    }

    pedidoAtual = novoPedido;
}