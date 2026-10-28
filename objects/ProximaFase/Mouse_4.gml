if (global.faseAtual == 1) {
    global.faseAtual = 2;
    global.faseDesbloqueadaMensagem = 2;
    room_goto(Pedidos);
}
else if (global.faseAtual == 2) {
    global.faseAtual = 3;
    global.faseDesbloqueadaMensagem = 3;
    room_goto(Pedidos);
}
else if (global.faseAtual == 3) {
    room_goto(Conclusao);
}

global.stat_pedidos += 1;
