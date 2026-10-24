 // Atualiza o pedido somente quando a fase mudar
if (faseDoPedido != global.faseAtual) {

    if (global.faseAtual == 1) {
        pedidoAtual = irandom(2);
    }
    else if (global.faseAtual == 2) {
        pedidoAtual = irandom(1);
    }

    global.pedidoAtual = pedidoAtual;
    faseDoPedido = global.faseAtual;
}

// Exibe a mensagem da fase desbloqueada
if (global.faseDesbloqueadaMensagem > 0) {

    var mensagem = instance_create_layer(
        0, 0, "Instances", Mensagem
    );

    mensagem.faseDesbloqueada =
        global.faseDesbloqueadaMensagem;

    global.faseDesbloqueadaMensagem = 0;
}


