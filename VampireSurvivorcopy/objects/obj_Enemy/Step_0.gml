enemyUpdateTarget();
enemyMovement();

//Invulnerability Logic
if (enemyInvulnerabilityTimer > 0)
{enemyInvulnerabilityTimer -= 1;}
else{
enemyCollision();
}

//Death
if (enemyHealth <= 0)
{
	enemyDeath();	
}

