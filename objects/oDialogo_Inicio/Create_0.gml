if (!variable_global_exists("dialogo_visto")) global.dialogo_visto = false;

if (global.dialogo_visto) {
    room_goto_next();
    exit;
}

falas = [
    "Há muito tempo, a montanha de Everbound era conhecida por sua riqueza incomparável em diversos tipos de minerais que atraía pessoas aos montes em busca de tal riqueza.",
    "No entanto, as pessoas cegas pela ganância não se contentaram em extrair aquilo que precisavam, elas vieram aos montes e destruíram a montanha cada vez mais.",
    "A montanha então, afogada pela dor, começou a embaralhar o seu próprio interior, de maneira a confundir e expulsar aqueles que a destruíam.",
	"O embaralhamento da montanha não foi o bastante, o interior dela começou a se infestar de monstros, frutos do ódio e tristeza da montanha.",
	"No fim, os humanos desistiram e fugiram, deixando a montanha para trás com seus terríveis monstros, que agora eram apenas um lembrete de sua dor avassaladora.",
	"No presente, uma nova exploradora se desafia a fazer o que deveria ter sido feito antes, coletar os recursos da montanha de maneira respeitosa e derrotar os monstros que assombram a montanha de Everbound.",
	"Embarque nessa jornada ajudando Ada a conquistar seus objetivos e derrotar os inimigos. Acesse o menu pressionando a tecla E para obter ajuda durante sua jornada."
];

indice   = 0;    
chars    = 0;     
vel_texto = 0.5;