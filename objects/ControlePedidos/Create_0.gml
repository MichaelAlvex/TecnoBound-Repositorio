pedidoAtual = irandom(2);
pedidos = [
    "Olá! Gostaria de encomendar um mouse.",
    "Olá! Gostaria de encomendar um teclado.",
    "Olá! Gostaria de encomendar um monitor."
];
// Inicializa os dados do pedido apenas na primeira vez
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