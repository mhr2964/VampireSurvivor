enemyUpdateTarget();
enemyMovement();

//Invulnerability Logic
enemyInvulnerabilityTimer -= 1;

//Death
if (enemyHealth <= 0)
{
	enemyDeath();	
}