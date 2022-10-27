

//Give Player EXP for testing
if (keyboard_check_pressed(vk_space)) {
	playerEXP += 1 + (keyboard_check(vk_shift)) * 9;
}



playerMovement();
//playerCollision();
if (playerEXP >= playerEXPThreshold) {
	playerLevelUp()
}


//PlayerRegen
playerHeal(playerRegen);