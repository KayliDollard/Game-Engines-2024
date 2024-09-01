// Create Event of oSlime

// Initialize the DS list for managing health instances
health_list = ds_list_create();

// Store the slime's original position
original_x = x;
original_y = y;

// Initialize movement and attack variables
moving = false;
moving_to_player = false;
attack_delay = room_speed * 2; // 2 seconds delay before attacking

// Set initial state
state = "neutral";
