if (IFrames == 0) {
	HP_Player -= 1;
	IFrames = 10;

Timer_Empurrao = 4;

var _Direcao = point_direction(other.x, other.y, x, y);
VelH = lengthdir_x(10, _Direcao);
VelV = lengthdir_y(10, _Direcao);

}