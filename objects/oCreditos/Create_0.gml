creditos = false; 

cred_w = 209;
cred_h = 192;
cred_y = 32; 

cred_texto  = "Ana Beatriz Oliva da Conceição\nSprites\n\n";
cred_texto += "Jackeline de Paula Nascimento\nSite, sons e música\n\n";
cred_texto += "Lays Santos Moura\nDocumentação e código\n\n";
cred_texto += "Marina Vieira Prado\nStoryboard, cenários, sprites e código\n\n";
cred_texto += "Michael Alves Oliveira\nCódigo";

draw_set_font(Font2); 
cred_sep   = -1; 
cred_escala = 1;
while (cred_escala > 0.3) {
    var _h = string_height_ext(cred_texto, cred_sep, cred_w / cred_escala) * cred_escala;
    if (_h <= cred_h) break;
    cred_escala -= 0.05;
}