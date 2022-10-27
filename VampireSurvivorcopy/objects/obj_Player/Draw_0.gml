draw_set_alpha(0.1);
draw_circle(x, y, playerMagnetRadius, false);
draw_set_alpha(1);



draw_healthbar(x - 32, y - 38, x + 32, y - 48, (playerHealth / playerMaxHealth) * 100, c_black, c_black, c_green, 1, true, true);


draw_text(x, y - 32, "playerLevel: " + string(playerLevel));
draw_text(x, y - 48, "playerEXP: " + string(playerEXP));
draw_text(x, y - 64, "playerEXPthreshold: " + string(playerEXPThreshold));
draw_text(x, y - 80, "playerDir: " + string(playerDir));
draw_text(x, y - 96, "playerHealth: " + string(playerHealth));




if (playerInvulnerabilityTimer > 0) {
	image_blend = c_red;
} else {
	image_blend = c_white;
}

draw_self();

