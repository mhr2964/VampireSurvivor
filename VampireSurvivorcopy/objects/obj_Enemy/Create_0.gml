//Default Constructor
function EnemyDefault(){
	//EnemySystemVariables
	enemyDir = 0;
	
	enemyHspd = 0;
	enemyVspd = 0;
	enemyInvulnerabilityTimer = 0;
	enemyTarget = 0;
	x = 0;
	y = 0;
	
	//StatVariables
	enemyContactDamage = 10;
	enemyInvulnerabilityFrames = 45;
	enemyMaxHealth = 5;
	enemyHealth = enemyMaxHealth;
	enemySpeed = 1;
	
	//MiscVariables
	enemyDropTable = ds_list_create();
	ds_list_add(enemyDropTable, 35);
	ds_list_add(enemyDropTable, 15);
	ds_list_add(enemyDropTable, 5);
	ds_list_add(enemyDropTable, 20);
	ds_list_add(enemyDropTable, 10);
	ds_list_add(enemyDropTable, 0);
	ds_list_add(enemyDropTable, 0);
	ds_list_add(enemyDropTable, 0);
	ds_list_add(enemyDropTable, 15)
}

//Initializing this Enemy's variables
EnemyDefault();


//Parameterized Constructor
function EnemyParam(eX, eY, eHealth, eMaxHealth, eContactDamage, eInvulnerabilityFrames, eSpeed, eDir, eDropTable){
	//EnemySystemVariables
	enemyDir = eDir;
	enemyHealth = eHealth;
	enemyHspd = 0;
	enemyVspd = 0;
	enemyInvulnerabilityTimer = 0;
	enemyTarget = 0;
	x = eX;
	y = eY;
	
	//StatVariables
	enemyContactDamage = eContactDamage;
	enemyInvulnerabilityFrames = eInvulnerabilityFrames;
	enemyMaxHealth = eMaxHealth;
	enemySpeed = eSpeed;
	
	//MiscVariables
	enemyDropTable = eDropTable;
}

function enemyDeath() {
	//Should also reference 
	randomize();
	var randomnum = irandom_range(1, 100);
	var val = 0;
	for (var i = 0; i < ds_list_size(enemyDropTable); i++) {
		val += ds_list_find_value(enemyDropTable, i);
		if (val >= randomnum) break;
			
	}
	var pickup = scr_createPickup(i);
	instance_destroy();
}

function enemyHeal(healAmount) {
	enemyHealth += healAmount;
	if (enemyHealth > enemyMaxHealth)
	{
		enemyHealth = enemyMaxHealth;	
	}
}

function enemyMovement()
{
	enemyDir = point_direction(x, y, obj_Player.x + enemyTarget, obj_Player.y + enemyTarget);
	enemyHspd = lengthdir_x(enemySpeed, enemyDir);
	enemyVspd = lengthdir_y(enemySpeed, enemyDir);

	x += enemyHspd;
	y += enemyVspd;
	
	//Sprite stuff
	if (sign(enemyHspd) != 0) {
		image_speed = 1;
		image_xscale = sign(enemyHspd)
	} else {
		image_speed = 0;		
		image_index = 0;
	}
}

function enemyInitializeTarget(enemyTargetOffset)
{
	if (point_distance(x, y, obj_Player.x - enemyTargetOffset, obj_Player.y - enemyTargetOffset) 
	  > point_distance(x, y, obj_Player.x + enemyTargetOffset, obj_Player.y + enemyTargetOffset))
	{
		enemyTarget = enemyTargetOffset;
	}
	else
	{
		enemyTarget = enemyTargetOffset  * -1;
	}
}
enemyInitializeTarget(20);

function enemyUpdateTarget()
{
	if (point_distance(x, y, obj_Player.x + enemyTarget, obj_Player.y + enemyTarget) < 10)
	{
		enemyTarget *= -1;
	}
}

function enemyTakeDamage(damage, frames)
{
	enemyHealth -= damage;
	enemyInvulnerabilityTimer = frames;
}

function enemyCollision() 
{
	//Projectile Collision
	if (place_meeting(x, y, obj_Projectile)) {
		var projRef = instance_place(x, y, obj_Projectile);
		if (projRef.projectileActive)
		{
			if (projRef.projectileInvulnerabilityFrames != noone)
			{
				enemyTakeDamage(projRef.projectileDamage, projRef.projectileInvulnerabilityFrames)
			}
			else
			{
				enemyTakeDamage(projRef.projectileDamage, enemyInvulnerabilityFrames);
			}
			//Collision
			var dirr = point_direction(obj_Player.x, obj_Player.y, x, y);
			x += lengthdir_x(projRef.projectileKnockback, dirr);
			y += lengthdir_y(projRef.projectileKnockback, dirr);
		
			//Deal with projectile piercing
			with (projRef) {
				if (projectilePiercing - 1 < 0) projectileOnEnd();
				else projectilePiercing -= 1;	
			}
		}
		
	}
}