if (global.faseAtual == 1) {

    // Voltar para o periférico da primeira fase
    switch (global.perifericoEscolhido) {
        case 0:
            room_goto(rMontagemMouse);
            break;

        case 1:
            room_goto(rMontagemTeclado);
            break;

        case 2:
            room_goto(rMontagemMonitor);
            break;
    }

} else if (global.faseAtual == 2) {

    // Voltar para o componente da segunda fase
    switch (global.componenteEscolhido) {
        case 0:
            room_goto(MontagemPMae);
            break;

        case 1:
            room_goto(MontagemPVideo);
            break;
		case 2:
            room_goto(MontagemProcessador);
            break;
    }

}