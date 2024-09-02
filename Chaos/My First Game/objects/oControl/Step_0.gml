// Step Event of oControl

// Handle the player's turn
if (current_turn == "player") {
    if (mouse_check_button_pressed(mb_left)) {
        // Change the character sprite's frame to the second slide
        with (oCharacter) {
            if (!animation_changed) {
                image_index = 1; // Switch to the second frame in the sprite strip
                animation_changed = true; // Set the flag to indicate the animation has changed

                // Set an alarm to revert back to neutral after a short delay
                alarm[0] = room_speed; // This sets the alarm to trigger after 1 second (room_speed frames)
            }
        }

        // Destroy one of the oSlimeHealth instances
        var slime = instance_find(oSlime, 0); // Find the slime instance
        if (slime != noone) {
            // Collect oSlimeHealth instances above the slime
            var slime_health_list = ds_list_create();
            instance_place_list(slime.x, slime.y - 100, oSlimeHealth, slime_health_list, true);
            
            // Check if there are any oSlimeHealth instances in the list
            if (ds_list_size(slime_health_list) > 0) {
                // Destroy the first oSlimeHealth instance found
                var slime_health_instance = ds_list_find_value(slime_health_list, 0);
                instance_destroy(slime_health_instance);
            }
            
            ds_list_destroy(slime_health_list); // Clean up the DS list
        }

        // End the player's turn and start the slime's turn
        current_turn = "slime";
        start_slime_turn(); // Call the global function to start the slime's turn
    }
}

// Handle the slime's turn
if (current_turn == "slime") {
    var slime = instance_find(oSlime, 0);
    if (slime != noone) {
        switch (slime.state) {
            case "moving":
                // Slime movement code
                break;

            case "attacking":
                // Slime attack code
                break;

            case "returning":
                // Slime return code
                break;
        }
    }
}
