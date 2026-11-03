mudou = false;
verificar_fase();
estado();
if (!mudou) timer++;

hp_visual = lerp(hp_visual, HP_Monstro, 0.08);