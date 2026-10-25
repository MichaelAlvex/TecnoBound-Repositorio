if (global.faseAtual == 1) {
    with (ControlePedidos) {
        global.pedidoAceito = pedidoAtual;
        global.pedidoAtivo = true;
        global.pedidoTexto = pedidos[pedidoAtual];
        
        if (pedidoAtual == 0)      global.perifericoEscolhido = "Mouse";
        else if (pedidoAtual == 1) global.perifericoEscolhido = "Teclado";
        else if (pedidoAtual == 2) global.perifericoEscolhido = "Monitor";
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

receitas = {};

receitas.Mouse = [
    { sprite: sBauxita, nome: "Bauxita", quantidade: 5 },
    { sprite: sCobre,   nome: "Cobre",   quantidade: 2 }
];

receitas.Teclado = [
    { sprite: sBauxita, nome: "Bauxita", quantidade: 3 },
    { sprite: sCobre,   nome: "Cobre",   quantidade: 2 }
];

receitas.Monitor = [
    { sprite: sBauxita, nome: "Bauxita", quantidade: 3 },
    { sprite: sCobre,   nome: "Cobre",   quantidade: 2 }
];

Pos_Receita_X = (display_get_gui_width() / 2) + 150; 
Pos_Receita_Y = (display_get_gui_height() / 2) - 100;