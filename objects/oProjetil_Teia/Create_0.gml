alvo_x = x;
alvo_y = y;

if (oAranha.sprite_index == sAranha_Cima) {
	sprite_index = sProjetil_Teia_Cima;
} else if (oAranha.sprite_index == sAranha_Baixo) {
	sprite_index = sProjetil_Teia_Baixo;
} else if (oAranha.sprite_index == sAranha_Esquerda) {
	sprite_index = sProjetil_Teia_Esquerda;
} else {
	sprite_index = sProjetil_Teia_Direta;
}