persistent = true;

if (!variable_global_exists("faseAtual")) {
    global.faseAtual = 1;
}

pedidos = [
    "Olá! Gostaria de encomendar um mouse.",
    "Olá! Gostaria de encomendar um teclado.",
    "Olá! Gostaria de encomendar um monitor."
];

if (!variable_global_exists("pedidoAtivo")) {
    global.pedidoAtivo = false;
}

if (!variable_global_exists("pedidoAceito")) {
    global.pedidoAceito = -1;
}

if (!variable_global_exists("pedidoTexto")) {
    global.pedidoTexto = "";
}

if (!variable_global_exists("perifericoEscolhido")) {
    global.perifericoEscolhido = -1;
}

if (!variable_global_exists("componenteEscolhido")) {
    global.componenteEscolhido = -1;
}

if (!variable_global_exists("computadorEscolhido")) {
    global.computadorEscolhido = -1;
}

if (!variable_global_exists("segundaFaseDesbloqueada")) {
    global.segundaFaseDesbloqueada = false;
}

if (!variable_global_exists("faseDesbloqueadaMensagem")) {
    global.faseDesbloqueadaMensagem = 0;
}

pedidoAtual = irandom(2);

global.pedidoAtual = pedidoAtual;
faseDoPedido = 1;
show_debug_message("ControlePedidos: Create executado");