// Check if the left mouse button is pressed on oAttack
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

    // Call the global function to start the slime's turn
    start_slime_turn();
}
