if (invulneravel) HP_Monstro = hp_guardado;

mudou = false;
estado();
if (!mudou) timer++;

hp_visual = lerp(hp_visual, invulneravel ? hp_guardado : HP_Monstro, 0.08);
