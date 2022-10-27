draw_self();
draw_text(x, y - 32, "Target: " + string(obj_Player.x + enemyTarget) + ", " + string(obj_Player.y + enemyTarget));
draw_text(x, y - 52, "Position: " + string(x) + ", " + string(y));
draw_text(x, y - 72, "Vspd: " + string(enemyVspd));
draw_text(x, y - 92, "Hspd: " + string(enemyHspd));

if (enemyInvulnerabiltyTimer > 0)
{
	image_blend = c_red;
}
else
{
	image_blend = c_white;	
}