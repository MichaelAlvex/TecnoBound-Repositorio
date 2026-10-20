if (
    instance_exists(Base_Interna)
    && instance_exists(Suporte)
    && instance_exists(Base)
    && instance_exists(Interno1)
    && instance_exists(Interno2)
    && instance_exists(Interno3)
    && instance_exists(Contorno)
    && instance_exists(Tela)
) {
    monitorCompleto =
        Base_Interna.encaixada
        && Suporte.encaixada
        && Base.encaixada
        && Interno1.encaixada
        && Interno2.encaixada
        && Interno3.encaixada
        && Contorno.encaixada
        && Tela.encaixada;

    if (monitorCompleto && !mensagemExibida) {
        show_debug_message("Monitor montado com sucesso!");
        mensagemExibida = true;
    }
}