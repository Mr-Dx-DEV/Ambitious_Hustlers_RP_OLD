-- this is the locales for mapping to show on the ui.
Config.EvidenceMappings = {
    ["casing"] = "Casing",
    ["vehiclefragment"] = "Vehicle Fragment",
    ["projectile"] = "Projectile",
    ["blood"] = "Blood",
    ["casing_car"] = "Car Casings",
    ["blood_car"] = "Car Blood",
    ["fingerprint_car"] = "Car Fingerprints",
    ["image"] = "Image",
    ["fingerprintevidence"] = "Fingerprint",
    ["weapon"] = "Weapons"
}

Config.EvidenceColors = {
    ["casing"] = { r = 255, g = 0, b = 0 },
    ["vehiclefragment"] = { r = 0, g = 255, b = 0 },
    ["projectile"] = { r = 0, g = 0, b = 255 },
    ["blood"] = { r = 255, g = 255, b = 0 },
    ["casing_car"] = { r = 255, g = 165, b = 0 },
    ["blood_car"] = { r = 128, g = 0, b = 128 },
    ["image"] = { r = 255, g = 20, b = 147 },
    ["fingerprintevidence"] = { r=0,g=255,b=127},
    ["fingerprint_car"] = { r=0,g=255,b=127}
}

-- do not touch isSearchable. You can only change label here
Config.EvidenceInfoMapping = {
    { id= 'fingerprint', label= "Fingerprints", isSearchable= true }, 
    { id= 'dna', label= "DNA", isSearchable= true },
    { id = "modelLabel", label = "Vehicle Name"},
    { id = "weaponserial", label = "Serial No", isSearchable= false},
    { id = "weaponlabel", label = "Weapon Label", isSearchable= false},
    { id = "ammoname", label = "Ammo Caliber", isSearchable = false},
    
}

Locales = {
    ["photo_taken"] = "Image taken. You can check it in your evidence menu.",
    ["no_evidence_found"] = "No evidence found",
    ["car_evidence_title"] = "Car Evidence",
    ["cleanup_g"] = "[G] Cleanup",
    ["projectile_e"] = "[E] Projectile",
    ["projectile"] = "Projectile",
    ["casing_e"] = "[E] Casing",
    ["casing"] = "Casing",
    ["blood_e"] = "[E] Blood",
    ["blood"] = "Blood",
    ["vehiclefragment_e"] = "[E] Vehicle Fragment",
    ["vehiclefragment"] = "Vehicle Fragment",
    ["failed_to_create"] = "Failed to create Crime Scene",
    ['evidence_already_picked'] = "Evidence already picked",
    ['evidence_already_cleaned'] = "Evidence already cleaned",
    ["blood_3d_text"] = "Blood \n DNA: %s",
    ["casing_3d_text"] = "Casing \n Serial: %s",
    ["projectile_3d_text"] = "Projectile \n Serial: %s",
    ["vehiclefragment_3d_text"] = "Vehicle Fragment \n Model: %s",

    ["casing_in_car_string"] = 'Casing in Car: %s',
    ["blood_in_car_string"] = 'Blood in Car: %s',

    ["no_evidence_for_crime_scene"] = "No Evidence For Crime Scene",
    ["no_nearby_players"] = "No Nearby Players",
    ["dna_already_taken"] = "DNA already taken",
    ["dna_taken"] = "Your DNA has been collected",
    
    ["no_perm_camera"] = "No Permission to access camera",
    ["no_access"] = "No Access To Evidence System",
    ["access_tool_no_access"] = "You do not have access to this tool",
    ["not_near_location"] = "You are not near the designated location",
    ["no_nearby_car"] = "No Cars Found Nearby",
    ["access_tool_success"] = "Car Successfully unlocked. Keys Given",

    ["inventory_full"] = "Inventory full",
    ["evidence_pouch_label"] = "Evidence Pouch",

    ["nearby_scene_cleared"] = "Nearby Scene has been cleared",
    ["cant_use_camera_in_recreate_menu"] = "You cannot use the camera in the recreate menu",

    ["fingerprint_e"] = "[E] Fingerprint",
    ["fingerprint"] = "Fingerprint",
    ["fingerprint_3d_text"] = "Fingerprint \n FingerprintId: %s",
    
    -- added after 14th March 2025
    ["gsr_cleaned"] = "GSR has been cleaned",
    ["gsr_positive"] = "Person is GSR postive",
    ["gsr_negative"] = "No GSR found on the person",
    ["missing_item"] = "You are missing item to pick up the evidence",

        -- Added after 5th April 2025
    ["press_evidence"] = "[E] Evidence",
    ["failed_to_edit"] = "Failed to edit Crime Scene",

    -- Added after 19th May 2025
    ["serial_label_text"] = "Serial No",
    ["dna_label_text"] = "DNA",
    ["model_label_text"] = "Model",
    ["fingerprint_label_text"] = "Fingerprint",
    ["custom_label"] = "Label",


    -- Added after 15th June 2025
    ["no_perms_to_remove"] = "You do not have permission to remove evidence",
    
    
    -- Added after 19th June
    ["no_serial"] = "No Serial",
    
    -- added after 6th Sept
    ["weapon_fingerprint_label_on_ui"] = "Weapon Fingerprint",
}