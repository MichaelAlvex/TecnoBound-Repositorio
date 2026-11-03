if (Timer_Eclode > 0) {
	Timer_Eclode--;
	
	if (Timer_Eclode <= 0) {
		instance_create_layer(x, y, "Instances", oCagu);
		instance_destroy();
}
}