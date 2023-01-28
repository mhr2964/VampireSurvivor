if (keyboard_check(ord("W")) || (keyboard_check(vk_up))) global.upKey = 1;
else global.upKey = 0;
if (keyboard_check(ord("S")) || (keyboard_check(vk_down))) global.downKey = 1;
else global.downKey = 0;
if (keyboard_check(ord("D")) || (keyboard_check(vk_right))) global.rightKey = 1;
else global.rightKey = 0;
if (keyboard_check(ord("A")) || (keyboard_check(vk_left))) global.leftKey = 1;
else global.leftKey = 0;



if (keyboard_check_pressed(ord("1"))) {
	room_goto(room_FletcherTesting);	
}
if (keyboard_check_pressed(ord("2"))) {
	room_goto(room_MichaelTesting);	
}


if (keyboard_check_pressed(ord("Q"))) {
	if (global.Pause = false) {
		Pause();
	} else {
		unPause();
	}
}

gameTimer++;
if (gameTimer % 300 == 0)
{
for (i = floor(gameTimer / 3600) + 1; i > 0; i--)
{
	newEnemy = instance_create_depth(0,0,0, obj_Enemy);
	switch(irandom_range(0, 3))
	{
		case 0:
		newEnemy.x = -10;
		newEnemy.y = random_range(0, window_get_height());
		break;
		case 1:
		newEnemy.x = window_get_width() + 10;
		newEnemy.y = random_range(0, window_get_height());
		break;
		case 2:
		newEnemy.y = -10;
		newEnemy.x = random_range(0, window_get_width());
		break;
		case 3:
		newEnemy.y = window_get_height() + 10;
		newEnemy.x = random_range(0, window_get_width());
		break;
	}
	ds_list_add(enemies, newEnemy);
}
}