draw_set_alpha(0.1);
draw_circle(x, y, playerMagnetRadius, false);
draw_set_alpha(1);
draw_self();
draw_text(x, y - 32, "playerLevel: " + string(playerLevel));
draw_text(x, y - 48, "playerEXP: " + string(playerEXP));
draw_text(x, y - 64, "playerEXPthreshold: " + string(playerEXPThreshold));
draw_text(x, y - 80, "playerDir: " + string(playerDir));


