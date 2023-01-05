



function projectileOnEnd()
{
	instance_destroy();	
}

function projectileMovement()
{
	switch(projectileType)
	{
		#region TEST
		case "test":
			x += lengthdir_x(3, point_direction(x, y, obj_Enemy.x, obj_Enemy.y));
			y += lengthdir_y(3, point_direction(x, y, obj_Enemy.x, obj_Enemy.y));
			break;
		#endregion
		#region Knife
		case 0:
			//Knife
			image_xscale = projectileDirection;
			x += projectileMoveSpeed * projectileDirection;
			break;
			#endregion
		#region Axe
		case 1:
			//Axe
			image_xscale = projectileDirection;
			image_angle += projectileRotationSpeed;
			x += projectileXSpeed;
			y += projectileYSpeed;
			if (projectileYSpeed < projectileYMax)
			{
				projectileYSpeed += projectileGravity
			}
			break;
			#endregion
		#region HolyWater
		case 2:
			//HolyWater
			if (abs(y - projectileYStart) < projectileFallDistance && y + 5 < 1000)
			{
				image_angle += projectileRotationSpeed;
				x += projectileXSpeed;
				y -= projectileYSpeed;
				projectileDuration++;	
			}
			else
			{
				if (!projectileActive)
				{
					projectileActive = true;
					image_xscale = projectilePoolArea;
					image_yscale = projectilePoolArea;
					sprite_index = spr_pool;
					depth = 550;
				}
			}
			break;
		#endregion
		#region Cross
		case 3:
			//Cross
			image_angle += projectileRotationSpeed;
			x += projectileXSpeed;
			y += projectileYSpeed;
			if (abs(projectileXSpeed) < projectileMaxSpeed)
			{
				projectileXSpeed -= projectileGravityX;
			}
			if (abs(projectileYSpeed) < projectileMaxSpeed)
			{
				projectileYSpeed -= projectileGravityY;
			}
			if (projectileXSpeed * projectileGravityX * projectileYSpeed * projectileGravityY >= 0 && 
			   (abs(x - projectileStartPoint[0]) <= 5  && abs(y - projectileStartPoint[1]) <= 5))
			{
				projectileDestroyOffScreen = true;	
			}
			break;
			#endregion
	}
}

function projectileTypePreset(type, lvl) {
	
	sprite_index = spr_weapon;
	image_index = type;
	projectileType = type;
	projectileLevel = lvl;
	projectileActive = true;
	projectileInvulnerabilityFrames = noone;
	projectileDestroyOffScreen = false;
	
	switch (type) {
		#region Knife
		case 0:
			//knife 
			//unchanging stuff
			projectileDestroyOffScreen = true;
			projectileDuration = 600;
			
			
			//Base lvl 0 stats
			projectileDamage = 1;
			projectileExtraAmount = 0;
			projectilePiercing = 1;
			projectileMoveSpeed = 10;
			projectileCooldown = 60;
			projectileKnockback = 5;
			projectileTimeBetweenShots = 15;
			
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
			#endregion
		#region Axe
		case 1:
			//axe 
			//unchanging stuff
			projectileDestroyOffScreen = true;
			projectileDuration = 600;
			projectileGravity = .3;
			projectileXSpeed = random_range(-3, 3);
			projectileYSpeed = -10;
			projectileYMax = 20;
			projectileRotationSpeed = 6;
			
			//Base lvl 0 stats
			projectileDamage = 1;
			projectileExtraAmount = 0;
			projectilePiercing = 1;
			projectileMoveSpeed = 10;
			projectileCooldown = 60;
			projectileKnockback = 20;
			projectileTimeBetweenShots = 10;
			
			if (lvl >= 1) projectileDamage += 5;
			if (lvl >= 2) projectilePiercing += 1;
			if (lvl >= 3) projectileExtraAmount += 1;
			if (lvl >= 4) projectileDamage += 5;
			if (lvl >= 5) projectileDamage += 5;
			if (lvl >= 6) projectileExtraAmount += 1;
			if (lvl >= 7) projectileDamage += 5;
			if (lvl >= 8) projectilePiercing += 1;
			if (lvl >= 9) projectileExtraAmount += 1;
			if (lvl >= 10) {
				projectileDamage += 10;
				projectileExtraAmount += 1;
				projectilePiercing += 1;
				projectileMoveSpeed += 1;
			}
			break;
			#endregion		
		#region HolyWater
		case 2:
			//holyWater 
			//unchanging stuff
			projectileDuration = 200;
			projectileXSpeed = 3;
			projectileYSpeed = -10;
			projectileRotationSpeed = 6;
			projectileActive = false;
			projectileInvulnerabilityFrames = 25;
			
			//Positioning
			x = random_range(obj_Player.x - 700, obj_Player.x + 400);
			y = random_range(obj_Player.y - 300, obj_Player.y - 1300);
			projectileYStart = y;
			projectileFallDistance = 1000;
			
			//Base lvl 0 stats
			projectileDamage = 2;
			projectileExtraAmount = 0;
			projectilePiercing = 9999;
			projectileCooldown = 60;
			projectileKnockback = 0;
			projectileTimeBetweenShots = 10;
			projectilePoolArea = 3;
			
			if (lvl >= 1) projectileDamage += 1;
			if (lvl >= 2) projectilePoolArea += 1;
			if (lvl >= 3) projectileExtraAmount += 1;
			if (lvl >= 4) projectileDamage += 1;
			if (lvl >= 5) projectileDamage += 1;
			if (lvl >= 6) projectileExtraAmount += 1;
			if (lvl >= 7) projectileDamage += 1;
			if (lvl >= 8) projectilePoolArea += 1;
			if (lvl >= 9) projectileExtraAmount += 1;
			if (lvl >= 10) {
				projectileDamage += 1;
				projectileExtraAmount += 1;
				projectilePoolArea += 1;
			}
			break;
			#endregion
		#region Cross
		case 3:
			//cross 
			//unchanging stuff
			projectileDuration = 600;
			projectileMoveSpeed = 10;
			projectileXSpeed = random_range(projectileMoveSpeed * -1, projectileMoveSpeed);
			projectileXSpeed = clamp(projectileXSpeed, sign(projectileXSpeed) * projectileMoveSpeed / 2, sign(projectileXSpeed) * projectileMoveSpeed);
			projectileYSpeed = random_range(projectileMoveSpeed * -1, projectileMoveSpeed);
			projectileYSpeed = clamp(projectileYSpeed, sign(projectileYSpeed) * projectileMoveSpeed / 2, sign(projectileYSpeed) * projectileMoveSpeed);
			projectileGravityX = 0.015 * projectileXSpeed;
			projectileGravityY = 0.015 * projectileYSpeed;
			projectileStartPoint = [x,y];
			projectileMaxSpeed = 20;
			projectileRotationSpeed = 6;
			
			//Base lvl 0 stats
			projectileDamage = 1;
			projectileExtraAmount = 0;
			projectilePiercing = 9999;
			projectileCooldown = 60;
			projectileKnockback = 5;
			projectileTimeBetweenShots = 10;
			
			if (lvl >= 1) projectileDamage += 5;
			if (lvl >= 2) projectileMoveSpeed += 1;
			if (lvl >= 3) projectileExtraAmount += 1;
			if (lvl >= 4) projectileDamage += 5;
			if (lvl >= 5) projectileDamage += 5;
			if (lvl >= 6) projectileExtraAmount += 1;
			if (lvl >= 7) projectileDamage += 5;
			if (lvl >= 8) projectileMoveSpeed += 1;
			if (lvl >= 9) projectileExtraAmount += 1;
			if (lvl >= 10) {
				projectileDamage += 10;
				projectileExtraAmount += 1;
				projectileMoveSpeed += 1;
			}
			break;	
			#endregion
	}
}