var base = instance_find(objBaseTeclado, 0);
var teclas = instance_find(objTeclas, 0);
var grade = instance_find(objGradeTeclado, 0);

if (base != noone && teclas != noone && grade != noone) {

    tecladoCompleto =
        base.encaixada &&
        teclas.encaixada &&
        grade.encaixada;

    if (tecladoCompleto && !mensagemExibida) {
        show_debug_message("Teclado montado com sucesso!");
        mensagemExibida = true;
    }
}