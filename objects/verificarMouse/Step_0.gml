var mouseCompleto =
    global.baseMontada &&
    global.internaMontada &&
    global.rolamentoMontado &&
    global.tampaMontada;

if (mouseCompleto && !verificacaoFeita) {
    montagemCorreta = true;
    verificacaoFeita = true;
}
if (verificacaoFeita && montagemCorreta) {
    oPronto.visible = true;
}