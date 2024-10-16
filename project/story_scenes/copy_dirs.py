import os
import shutil

# Path to the template file
template_file = "template/template.tscn"

# List of directory names
directory_names = [
    "01_the_player_starts_on_main_menu_character_creation",
    "02_the_cat_gets_adopted",
    "02_the_player_can_create_a_character",
    "03_cat_gets_in_trouble_on_her_first_day_home",
    "04_cat_must_make_a_trip_to_the_vet",
    "05_owner_is_mad_after_vet_and_cat_is_set_free",
    "06_the_player_can_respawn_at_vet",
    "07_cat_is_flattened_at_the_construction_site",
    "08_racoon_fight_rabies",
    "09_rabies_test_rabies",
    "10_calls_animal_control_euthanized",
    "11_left_at_pound_euthanized",
    "12_coyote_at_night_coyote",
    "13_laundromat_dryer",
    "14_bakery_blender",
    "15_standing_still_carried_off",
    "15_cat_dies_in_the_bakery",
    "16_pregnant",
    "17_fishing_big_fish",
    "18_true_death"
]

# Create each directory, copy and rename the template file
for name in directory_names:
    try:
        # Create the directory if it doesn't exist
        os.makedirs(name, exist_ok=True)
        
        # Define the destination file path
        destination_file = os.path.join(name, f"{name}.tscn")
        
        # Copy the template file and rename it
        shutil.copy(template_file, destination_file)
        print(f"Created directory and copied template as: {destination_file}")
    except Exception as e:
        print(f"Error processing {name}: {e}")
