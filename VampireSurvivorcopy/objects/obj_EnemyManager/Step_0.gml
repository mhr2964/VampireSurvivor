/// @description Insert description here
// You can write your code in this editor
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
