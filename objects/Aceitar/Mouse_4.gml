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
		
		if (pedidoAtual == 0)      global.componenteEscolhido = "PlacaMae";
        else if (pedidoAtual == 1) global.componenteEscolhido = "PlacaVideo";
        else if (pedidoAtual == 2) global.componenteEscolhido = "Processador";
    }
}
else if (global.faseAtual == 3) {
    with (ControlePedidosFase3) {
        global.pedidoAceito = pedidoAtual;
        global.pedidoAtivo = true;
        global.pedidoTexto = pedidos[pedidoAtual];
        global.computadorEscolhido = pedidoAtual;
		
		if (pedidoAtual == 0)      global.computadorEscolhido = "PCGamer";
        else if (pedidoAtual == 1) global.computadorEscolhido = "PCDomestico";
        else if (pedidoAtual == 2) global.computadorEscolhido = "PCEscritorio";
    }
}

room_goto(Room_0);

receitas = {};
draw_set_font(Font1);

receitas.Mouse = [
    { sprite: sGrafite, nome: "Grafite", quantidade: 3 },
    { sprite: sQuartzo,   nome: "Quartzo",   quantidade: 10 }
];

receitas.Teclado = [
    { sprite: sGrafite, nome: "Grafite", quantidade: 10 },
    { sprite: sQuartzo,   nome: "Quartzo",   quantidade: 25 }
];

receitas.Monitor = [
    { sprite: sGrafite, nome: "Grafite", quantidade: 20 },
    { sprite: sQuartzo,   nome: "Quartzo",   quantidade: 45 },
	{ sprite: sNeodimio,   nome: "Neodímio",   quantidade: 10 }
];




receitas.PlacaMae = [
    { sprite: sQuartzo, nome: "Quartzo", quantidade: 45 },
    { sprite: sGrafite, nome: "Grafite", quantidade: 25 },
	{ sprite: sNeodimio, nome: "Neodímio", quantidade: 10 },
    { sprite: sCobre,   nome: "Cobre",   quantidade: 25 },
	{ sprite: sBauxita, nome: "Bauxita", quantidade: 15 }
];

receitas.PlacaVideo = [
	{ sprite: sQuartzo, nome: "Quartzo", quantidade: 45 },
    { sprite: sGrafite, nome: "Grafite", quantidade: 25 },
	{ sprite: sNeodimio, nome: "Neodímio", quantidade: 10 },
    { sprite: sCobre,   nome: "Cobre",   quantidade: 25 },
	{ sprite: sNiquel,   nome: "Níquel",   quantidade: 25 },
	{ sprite: sBauxita, nome: "Bauxita", quantidade: 15 }

];

receitas.Processador = [
    { sprite: sQuartzo, nome: "Quartzo", quantidade: 45 },
    { sprite: sGrafite, nome: "Grafite", quantidade: 25 },
	{ sprite: sNeodimio, nome: "Neodímio", quantidade: 10 },
    { sprite: sCobre,   nome: "Cobre",   quantidade: 10 },
	{ sprite: sBauxita, nome: "Bauxita", quantidade: 5 }
];




receitas.PCGamer = [
    { sprite: sQuartzo, nome: "Quartzo", quantidade: 45 },
    { sprite: sGrafite, nome: "Grafite", quantidade: 25 },
	{ sprite: sNeodimio, nome: "Neodímio", quantidade: 10 },
    { sprite: sCobre,   nome: "Cobre",   quantidade: 45 },
	{ sprite: sBauxita, nome: "Bauxita", quantidade: 35 },
	{ sprite: sNiquel, nome: "Níquel", quantidade: 15 },
	{ sprite: sOuro,   nome: "Ouro",   quantidade: 40 },
	{ sprite: sTugstenio, nome: "Tugstênio", quantidade: 30 },
	{ sprite: sPerovskita, nome: "Perovskita", quantidade: 20 }
];

receitas.PCDomestico = [
    { sprite: sQuartzo, nome: "Quartzo", quantidade: 45 },
    { sprite: sGrafite, nome: "Grafite", quantidade: 25 },
	{ sprite: sNeodimio, nome: "Neodímio", quantidade: 10 },
    { sprite: sCobre,   nome: "Cobre",   quantidade: 40 },
	{ sprite: sBauxita, nome: "Bauxita", quantidade: 30 },
	{ sprite: sOuro,   nome: "Ouro",   quantidade: 30 },
	{ sprite: sTugstenio, nome: "Tugstênio", quantidade: 25 },
	{ sprite: sNiquel, nome: "Níquel", quantidade: 15 }
];

receitas.PCEscritorio = [
    { sprite: sQuartzo, nome: "Quartzo", quantidade: 45 },
    { sprite: sGrafite, nome: "Grafite", quantidade: 25 },
	{ sprite: sNeodimio, nome: "Neodímio", quantidade: 10 },
    { sprite: sCobre,   nome: "Cobre",   quantidade: 35 },
	{ sprite: sBauxita, nome: "Bauxita", quantidade: 25 },
	{ sprite: sOuro,   nome: "Ouro",   quantidade: 20 },
	{ sprite: sTugstenio, nome: "Tugstênio", quantidade: 15 },
	{ sprite: sNiquel, nome: "Níquel", quantidade: 15 }
];

Pos_Receita_X = (display_get_gui_width() / 2) + 150; 
Pos_Receita_Y = (display_get_gui_height() / 2) - 100;