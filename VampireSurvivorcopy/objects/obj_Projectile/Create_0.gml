function ProjectileDefault()
{
	projectileDamage = 1;
	projectileDuration = 200;
	projectileLevel = 1;
	projectilePiercing = 1;
	projectileType = "test";
	image_speed = 0;
	projectileExtraAmount = 0;
	destroyOffScreen = true;
	projectileMoveSpeed = 5;
	projectileCooldown = 60;
	
	projectileDirection = 1;
	projectileTypePreset(0, 0);


	switch (projectileType) {
		case 0:
			//knife
			projectileDirection = obj_Player.image_xscale;
			break;
	}
}



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
		case 0:
			//Knife
			image_xscale = projectileDirection;
			x += projectileMoveSpeed * projectileDirection;
			break;
	}
}

function projectileTypePreset(type, lvl) {
	
	image_index = type;
	projectileType = type;
	projectileLevel = lvl;
	
	switch (type) {
		case 0:
			//knife 
			//unchanging stuff
			sprite_index = spr_weapon;
			destroyOffScreen = false;
			projectileDuration = 600;
			
			
			//Base lvl 0 stats
			projectileDamage = 1;
			projectileExtraAmount = 0;
			projectilePiercing = 1;
			projectileMoveSpeed = 10;
			projectileCooldown = 60;
			
			if (lvl >= 1) projectileDamage += 5;
			if (lvl >= 2) projectilePiercing += 1;
			if (lvl >= 3) projectileExtraAmount += 1;
			if (lvl >= 4) projectileMoveSpeed += 5;
			if (lvl >= 5) projectileDamage += 5;
			if (lvl >= 6) projectileExtraAmount += 1;
			if (lvl >= 7) projectileMoveSpeed += 5;
			if (lvl >= 8) projectilePiercing += 1;
			if (lvl >= 9) projectileExtraAmount += 1;
			if (lvl >= 10) {
				projectileDamage += 10;
				projectileExtraAmount += 1;
				projectilePiercing += 1;
				projectileMoveSpeed += 1;
			}


			break;
		case 1:
			
			break;
		
	}
}

ProjectileDefault();