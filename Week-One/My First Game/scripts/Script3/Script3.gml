// Global script: start_slime_turn
function start_slime_turn() {
    var slime = instance_find(oSlime, 0); // Find the slime instance
    if (slime != noone) {
        slime.state = "moving"; // Set the slime's state to moving
    }
}
