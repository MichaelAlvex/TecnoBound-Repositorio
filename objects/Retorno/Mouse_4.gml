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