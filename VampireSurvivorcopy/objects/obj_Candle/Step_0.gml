

if (candleDeathTimer > 0) {
	candleDeathTimer--;
	if (candleDeathTimer == 0) {
		candleDestroy()
	}
}

if (place_meeting(x, y, obj_Projectile)) && (candleDeathTimer == -1) {
	candleDeathTimer = candleDeathTime;
}