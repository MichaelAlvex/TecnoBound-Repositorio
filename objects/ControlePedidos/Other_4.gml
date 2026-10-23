if (global.segundaFaseDesbloqueada) {
    instance_create_layer(0, 0, "Instances", Mensagem);
    global.segundaFaseDesbloqueada = false;
}