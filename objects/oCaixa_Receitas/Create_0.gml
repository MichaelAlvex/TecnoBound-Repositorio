receitas = {};

receitas.Mouse = [
    { sprite: sBauxita, nome: "Bauxita", quantidade: 1 },
    { sprite: sGrafite,   nome: "Grafite",   quantidade: 1 }
];

receitas.Teclado = [
    { sprite: sBauxita, nome: "Bauxita", quantidade: 3 },
    { sprite: sGrafite,   nome: "Grafite",   quantidade: 7 }
];

Pos_Receita_X = (display_get_gui_width() / 2) - 30;
Pos_Receita_Y = (display_get_gui_height() / 2) - 75;
Largura_Caixa = 100;
depth = -100

global.podeFabricar = false;