function ProjectileDefault()
{
	projectileDamage = 1;
	projectileDuration = 200;
	projectileLevel = 1;
	projectilePiercing = 1;
	projectileType = "test";
}
ProjectileDefault();

function projectileOnEnd()
{
	instance_destroy();	
}

function projectileMovement()
{
	switch(projectileType)
	{
		case "test":
			x += lengthdir_x(3, point_direction(x, y, obj_Enemy.x, obj_Enemy.y));
			y += lengthdir_y(3, point_direction(x, y, obj_Enemy.x, obj_Enemy.y));
			break;
	}
}


