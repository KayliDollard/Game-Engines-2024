// Step Event of oSlime

switch (state) {
    case "moving":
        var player = instance_find(oCharacter, 0); // Find the player
        
        if (player != noone) {
            // Calculate direction and distance
            var angle_to_player = point_direction(x, y, player.x, player.y);
            var move_distance = 10; // Move 10 pixels per step (adjust as needed)
            
            x += lengthdir_x(move_distance, angle_to_player);
            y += lengthdir_y(move_distance, angle_to_player);
            
            if (point_distance(x, y, player.x, player.y) <= 10) {
                state = "attacking";
            }
        }
        break;

    case "attacking":
        var player = instance_find(oCharacter, 0);
        if (player != noone) {
            // Destroy one oHealth instance above the player
            var range = 100; // Adjust range as needed
            var health_instance = instance_place(player.x, player.y - range, oHealth);
            if (health_instance != noone) {
                instance_destroy(health_instance);
            }
        }
        state = "returning";
        break;

    case "returning":
        var angle_to_original = point_direction(x, y, original_x, original_y);
        
        x += lengthdir_x(move_speed, angle_to_original);
        y += lengthdir_y(move_speed, angle_to_original);

        if (point_distance(x, y, original_x, original_y) <= 10) {
            state = "neutral";
        }
        break;

    case "neutral":
        // Check if there are no more oSlimeHealth instances above the slime
        var health_list = ds_list_create(); // Create a new DS list
        instance_place_list(x, y - 100, oSlimeHealth, health_list, true); // Collect oSlimeHealth instances into the list

        if (ds_list_size(health_list) == 0) {
            // Stop any ongoing movement
            state = "stopped";

            // Change the slime's color to red
            image_blend = c_red;
            image_alpha = 1;

            // Set an alarm to destroy the slime after 2 seconds
            alarm[3] = room_speed * 2; // 2 seconds

            // Clean up the DS list
            ds_list_destroy(health_list);
        } else {
            ds_list_destroy(health_list); // Clean up the DS list if there are still health instances
        }
        break;
        
    case "stopped":
        // Slime has turned red and is waiting to be destroyed
        // No further actions needed here
        break;
}
