

//Give Player EXP for testing
if (keyboard_check_pressed(vk_space)) {
	playerEXP += 1 + (keyboard_check(vk_shift)) * 9;
}

if (playerInvulnerabilityTimer > 0) playerInvulnerabilityTimer--;


playerMovement();

if (playerEXP >= playerEXPThreshold) {
	playerLevelUp()
}
playerWeapons();


playerHeal(playerRegen);

playerCollision();



//PLay test shoot weapon
if (global.Debug) {
	
	if (keyboard_check_pressed(ord("P"))) {
		//Test knife shot
		//scr_createProjectile(1, 0);
		scr_createProjectile(4, 0);
	}
	
	if (keyboard_check_pressed(ord("L"))) {
		upgradeIndex = 2;
		ds_list_set(obj_Player.playerWeaponLvlList, upgradeIndex, ds_list_find_value(obj_Player.playerWeaponLvlList, upgradeIndex) + 1);
	}
	
	if (keyboard_check_pressed(ord("E"))) {
		playerLevelUp();
	}

}