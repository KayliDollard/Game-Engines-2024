// Script: attack_player

// Get the player instance
var player = instance_find(oCharacter, 0); // Assuming oCharacter is the player

if (player != noone) {
    // Collect oHealth instances above the player
    var range = 100; // Adjust range as needed
    var oHealth_instances = instance_place_list(player.x, player.y - range, oHealth, [], true);

    // Check if there are health instances in the list
    if (array_length(oHealth_instances) > 0) {
        // Destroy the first health instance found
        var health_instance = oHealth_instances[0];
        instance_destroy(health_instance);
    }
}
