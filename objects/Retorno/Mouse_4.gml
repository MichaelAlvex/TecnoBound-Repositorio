if (global.faseAtual == 1) {

    switch (global.perifericoEscolhido) {
        case "Mouse":
            room_goto(rMontagemMouse);
            break;
        case "Teclado":
            room_goto(rMontagemTeclado);
            break;
        case "Monitor":
            room_goto(rMontagemMonitor);
            break;
        default:
            show_debug_message("Periferico desconhecido: " + string(global.perifericoEscolhido));
            break;
    }

} else if (global.faseAtual == 2) {

    switch (global.componenteEscolhido) {
        case "PlacaMae":
            room_goto(MontagemPMae);
            break;
        case "PlacaVideo":
            room_goto(MontagemPVideo);
            break;
        case "Processador":
            room_goto(MontagemProcessador);
            break;
        default:
            show_debug_message("Componente desconhecido: " + string(global.componenteEscolhido));
            break;
    }

} else if (global.faseAtual == 3) {

    switch (global.computadorEscolhido) {
        case "PCGamer":
            room_goto(MontagemGamer);
            break;
        case "PCDomestico":
            room_goto(MontagemCasa);
            break;
        case "PCEscritorio":
            room_goto(MontagemEscritorio);
            break;
        default:
            show_debug_message("Computador desconhecido: " + string(global.computadorEscolhido));
            break;
    }
}