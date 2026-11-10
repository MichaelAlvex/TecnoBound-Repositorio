if (!variable_global_exists("dialogo_visto")) global.dialogo_visto = false;

if (global.dialogo_visto) {
    room_goto_next();
    exit;
}

falas = [
    "Há muito tempo atrás, a montanha de Everbound era conhecida por sua riqueza incomparável em diversos tipos de minérais, que atraia aos montes pessoas em busca de tal riqueza.",
    "No entanto, as pessoas cegadas pela ganância não se contentaram em extrair aquilo que precisavam, elas vieram aos montes e destruiram a montanha cada vez mais.",
    "A montanha então, afogada pela dor, começou a embaralhar o seu próprio interior, de maneira a confundir e explusar aqueles que a destruíam.",
	"O embaralhamento da montanha não foi o bastante, o interior dela começou a se infestar de monstros, frutos do ódio e tristeza da montanha",
	"No fim, os humanos desistiram e fugiram, deixando a montanha pra trás com seus terriveis monstros que agora eram apenas um lembrete de sua dor avassaladora.",
	"No presente, uma nova exploradora se desafia a fazer o que deveria ter sido feito antes, coletar os recursos da montanha de maneira respeitosa e derrotar os monstros que assombram a montanha de Everbound"
];

indice   = 0;    
chars    = 0;     
vel_texto = 0.5;