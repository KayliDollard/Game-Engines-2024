// Function to start the slime's attack sequence
function start_attack_sequence() {
    // Move slime towards the player
    moving = true;
    direction = point_direction(x, y, oCharacter.x, oCharacter.y);
    speed = 4; // Adjust speed as needed

    // Set an alarm to stop the movement and perform the attack
    alarm[1] = 30; // Duration for moving towards the character (adjust as needed)
}
