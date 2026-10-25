if (faseDoPedido != global.faseAtual) {

    if (global.faseAtual == 1) {
        pedidoAtual = irandom(2);
        global.pedidoAtual = pedidoAtual;
    }

    faseDoPedido = global.faseAtual;
}

if (global.faseDesbloqueadaMensagem > 0) {

    var mensagem = instance_create_layer(
        0, 0, "Instances", Mensagem
    );

    mensagem.faseDesbloqueada =
        global.faseDesbloqueadaMensagem;

    global.faseDesbloqueadaMensagem = 0;
}
