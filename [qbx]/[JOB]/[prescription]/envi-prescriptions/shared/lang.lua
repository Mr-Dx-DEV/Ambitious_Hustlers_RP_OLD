Config.Lang = {

    ['no_patient_nearby'] = 'No patient nearby',
    ['failed_to_get_patient_info'] = 'Failed to get patient info',
    ['no_medication_selected'] = 'No medication selected',
    ['not_a_doctor'] = 'You are not a doctor!',
    ['prescription_written'] = 'Prescription for %s has been written for %s',
    ['prescription_expired'] = 'Your prescription has expired',
    ['prescription_ready'] = 'Your prescription is ready.',
    ['select_medication_confirm'] = 'You must select a medication and dosage before confirming.',

    -- Prescription Menu
    ['prescriptions_menu_title'] = '🧾 Prescriptions Menu 🧾',
    ['unique_prescription_id'] = 'Unique Prescription ID',
    ['citizen_gov_name'] = 'Citizen\'s Government Name',
    ['citizen_dob'] = 'Citizen\'s Date of Birth',
    ['prescription_number'] = '🔢 Prescription #: %s',
    ['patient_name'] = '🧑 Patient Name: %s',
    ['patient_dob'] = '📆 Patient DOB: %s',
    ['prescribed_medication'] = '💊 Prescribed Medication 💊',
    ['select_medication'] = 'Select the medication to be prescribed.',
    ['signed'] = '🖋️ Signed - %s %s',
    ['confirm_selection'] = '✅ [ Confirm Selection ] ✅',
    ['confirm_your_selection'] = 'Confirm your selected medication and sign the prescription.',
    ['choose_meds'] = 'Pick your Poison..',

    -- Dosage Information
    ['prescribed_doses'] = '💊 Prescribed Doses 💊',
    ['select_dose'] = 'Select the amount of doses to be prescribed.',
    ['no_dose_selected'] = 'You must select a dosage!',
    ['cant_do_that_much'] = 'You can\'t prescribe that many doses of this drug! Max: ',

    -- Medication Effects
    ['narkan_use'] = 'Someone had administered Narkan to you!',
    ['narkan_use2'] = 'You\'re starting to come back around!',
    ['narkan_use3'] = 'You start to feel better!',
    ['used_narcan'] = 'You have administered Narkan!',
    ['you_dont_feel_good'] = 'You don\'t feel too good!',
    ['you_feel_more_sick'] = 'You feel more sick!',
    ['ran_out_of'] = 'Looks like you\'re all out of',
    ['you_took'] = 'You\'ve taken',
    ['amount_remaining'] = 'Doses Left: ',

    -- Lean Crafting
    ['missing_lean_items'] = 'You need a cup, cough syrup and sprunk to make lean!',
    ['spilled_lean'] = 'You spilled your lean on the floor!',
    ['took_sip_lean'] = 'You took a sip of lean!',
    ['all_out_lean'] = 'All out of lean!',

    -- Metadata
    ['metadata_description'] =
    '**Prescription #:** *%s* | **Patient DOB:** *%s* | **Prescribed Medication:** *%s* | **Signed by:** *%s %s* | **Expires:** *%s*',
    ['med_metadata_description'] =
    '**Batch ID #:** *%s* | | **Patient DOB:** *%s* *Take 4 times per day or as otherwise directed.* **⚠️ DO NOT EXCEED MAXIMUM DOSAGE ⚠️**',

    -- Inventory Metadata (QB)
    ['metadata_prescription'] = '%s ',
    ['metadata_patient_name'] = '%s ',
    ['metadata_patient_dob'] = '%s ',
    ['metadata_prescribed_medication'] = '%s ',
    ['metadata_signed_by'] = '%s - %s',
    ['metadata_expires'] = '%s ',
    ['metadata_warning'] = 'DO NOT EXCEED MAXIMUM DOSAGE',
    ['metadata_take4timesperday'] = 'Take 4 times per day or as otherwise directed.',

    -- =============================================
    -- PHARMACY SYSTEM
    -- =============================================
    -- Pharmacy Notifications
    ['collect_medication_start'] =
    'You here to collect your prescription? Please allow me a moment to check my records..',
    ['collect_medication_processing'] = 'Please wait a moment we process your prescription. Feel free to take a seat!',
    ['collect_medication_ready'] =
    'Here you go, your prescription is ready for collection. Take care of yourself and have a nice day!',
    ['collect_medication_no_prescription'] =
    'Sorry, it looks like we don\'t have any prescriptions pending under your name..',
    ['no_money'] = 'You don\'t have enough money to pay for the medication!',

    -- Target Label
    ['target_collect_medication'] = 'Collect Medication',

    -- Webhook Info
    ['prescription_collected'] = 'Prescription Collected',
    ['player_medication_batchid_patientdob'] =
    '**Player:** %s\n**Medication:** %s\n**Batch ID #:** %s\n**Patient DOB:** %s',
    ['prescription_written_hook'] = 'Prescription Written',
    ['doctor_medication_information_expirydate'] =
    '**Doctor:** %s\n**Medication:** %s\n**Information:** %s\n**Expiry Date:** %s',

    -- =============================================
    -- INSURANCE SYSTEM
    -- =============================================
    -- Insurance General
    ['insurance_purchase_success'] = 'You have successfully subscribed to %s insurance plan.',
    ['insurance_purchase_failed'] = 'Unable to purchase insurance plan. Insufficient funds.',
    ['insurance_already_subscribed'] = 'You are already subscribed to %s insurance plan.',
    ['insurance_cancelled'] = 'Your insurance plan has been cancelled.',
    ['insurance_payment_due'] = 'Your %s insurance payment of $%s is due soon.',
    ['insurance_payment_successful'] = 'Your %s insurance payment of $%s has been processed.',
    ['insurance_payment_failed'] = 'Failed to process payment for %s insurance. Your coverage has been suspended.',
    ['medication_downpayment'] = 'You paid a down-payment of $%s',

    -- Insurance Claims
    ['insurance_not_covered'] = 'This medication is not covered by your insurance plan.',
    ['insurance_claim_rejected'] = 'Your insurance claim has been rejected for this medication.',
    ['insurance_claim_accepted'] = 'Your %s insurance covered %s%% of the cost.',

    -- Insurance Menu
    ['insurance_menu_title'] = '🏥 Medical Insurance',
    ['current_plan'] = '📋 Current Plan: %s',
    ['no_insurance'] = '📋 Current Status: No Insurance',
    ['no_insurance_description'] = 'You currently have no medical insurance',
    ['cancel_plan'] = '❌ Cancel Current Plan',
    ['cancel_plan_description'] = 'Cancel your insurance subscription',
    ['cancel_insurance_header'] = 'Cancel Insurance?',
    ['cancel_insurance_content'] =
    'Are you sure you want to cancel your %s plan? You will be charged a cancelation fee of $%s.',
    ['insurance_cancelation_failed'] = 'You have insufficient funds to cancel your %s insurance plan.',
    ['available_plans'] = '───────── Available Plans ─────────',
    ['plan_benefits'] = '%s - Benefits',
    ['covered_medications'] = 'Covered Medications',
    ['purchase_plan'] = '💵 Purchase Plan',
    ['purchase_plan_description'] = 'Subscribe to %s',
    ['confirm_purchase_header'] = 'Confirm Purchase',
    ['confirm_purchase_content'] = 'Subscribe to %s for $%s per %s days?',

    -- Insurance Claim History
    ['view_claim_history'] = '📊 View Claim History',
    ['view_claim_history_description'] = 'See your recent insurance claims',
    ['insurance_claim_history'] = 'Insurance Claim History',
    ['no_claims_found'] = 'No Claims Found',
    ['no_claims_description'] = 'You have no insurance claim history',
    ['plan_benefits_title'] = '✅ Plan Benefits',
    ['plan_benefits_description'] = 'Your current insurance benefits',
    ['insurance_plan_details'] = 'Insurance Plan Details',
    ['monthly_premium'] = 'Monthly Premium: $%s',
    ['plan_description'] = 'Plan Description',
    ['plan_status'] = 'Plan Status',
    ['benefits_list'] = 'Benefits List',
    ['original_cost'] = 'Original Cost',
    ['covered_amount'] = 'Covered Amount',
    ['you_paid'] = 'You Paid',
    ['claim_status'] = 'Status',
    ['claim_date'] = 'Claim Date',

    -- Insurance Broker System
    ['insurance_broker_menu'] = '🏢 Insurance Broker Panel',
    ['sell_insurance'] = '💼 Sell Insurance Plan',
    ['sell_insurance_description'] = 'Sell an insurance plan to a nearby customer',
    ['no_customers_nearby'] = 'No customers nearby to sell insurance to',
    ['broker_view_claim_history'] = '📊 View Customer Claim History',
    ['broker_view_claim_history_description'] = 'Check insurance claims for a customer',
    ['customer_no_insurance'] = 'This customer does not have insurance',
    ['customer_insurance_info'] = 'Customer Insurance Information',
    ['select_plan_to_sell'] = 'Select a plan to offer the customer',
    ['insurance_commission'] = 'You will earn a commission of $%s',
    ['insurance_offer_sent'] = 'Insurance offer for %s sent to customer',
    ['insurance_offer_received'] = '%s is offering you %s insurance for $%s',
    ['insurance_purchase_through_broker'] = 'You purchased %s insurance through broker %s',
    ['insurance_sold_success'] = 'You sold %s insurance to %s and earned $%s commission',
    ['insurance_offer_rejected'] = 'The customer rejected your insurance offer',
    ['insurance_sale_canceled'] = 'Insurance sale was canceled',
    ['broker_menu'] = 'Insurance Broker Menu',
    ['customer_claim_history'] = 'Customer Claim History',
    ['current_patient_insurance'] = 'Current Patient Insurance',
    ['current_patient_plan'] = 'Current Plan',
    ['insurance_requires_broker'] =
    'This insurance office now requires you to speak with an insurance broker. Please find an agent to assist you.',

    -- Insurance Broker
    ['request_insurance_title'] = '💼 Request Insurance',
    ['request_insurance_desc'] = 'Offer insurance to a nearby customer',
    ['view_commission_title'] = '💰 View Commission History',
    ['view_commission_desc'] = 'Check your insurance sales commission',
    ['view_all_claims_title'] = '📋 View All Claims',
    ['view_all_claims_desc'] = 'See all insurance claims',
    ['search_claims_customer_title'] = '🔍 Search Claims by Customer',
    ['search_claims_customer_desc'] = 'Find claims for a specific customer',
    ['search_claims_medication_title'] = '💊 Search Claims by Medication',
    ['search_claims_medication_desc'] = 'Find claims for a specific medication',
    ['manage_customer_access_title'] = '👤 Manage Customer Access',
    ['manage_customer_access_desc'] = 'Ban or unban customers from insurance',
    ['view_recent_bans_title'] = '🚫 View Recent Bans',
    ['view_recent_bans_desc'] = 'See recently banned customers',
    ['view_top_performers_title'] = '🏆 View Top Performers',
    ['view_top_performers_desc'] = 'See top performing insurance brokers',
    ['insurance_broker_menu_title'] = 'Insurance Broker Menu',

    -- Insurance Broker Error Messages
    ['unable_retrieve_insurance_customer'] = 'Unable to retrieve insurance information for this customer',
    ['unable_retrieve_insurance_info'] = 'Unable to retrieve insurance information',
    ['choose_plan_offer'] = 'Choose a plan to offer this customer',
    ['invalid_customer_info'] = 'Invalid customer information',
    ['failed_to_get_claims'] = 'Failed to retrieve customer claims',
    ['invalid_search_term'] = 'Please enter a valid search term',
    ['search_failed'] = 'Search failed to return results',
    ['adjuster_banned'] = 'You are banned from processing insurance claims',
    ['adjuster_ban_success'] = 'Adjuster has been banned from processing claims',
    ['adjuster_unban_success'] = 'Adjuster can now process insurance claims',
    ['insurance_banned'] = 'You are banned from accessing insurance services. Reason: ',

    -- Insurance Access
    ['access_insurance_broker_office'] = 'Access Insurance Broker Office',
    ['access_insurance_office'] = 'Access Insurance Office',

    -- Insurance Labels
    ['discount'] = 'Discount',
    ['down_payment'] = 'Down-Payment',
    ['commission'] = 'Commission',
    ['no_insurance_text'] = 'No Insurance',
    ['coverage_status_not_covered'] = 'Not Covered',
    ['coverage_status_covered'] = 'Covered',
    ['coverage_status_rejected'] = 'Claim Rejected',
    ['status_approved'] = '🟢',
    ['status_rejected'] = '🔴',
    ['status_pending'] = '🟡',
    ['customer'] = 'Customer',
    ['plan'] = 'Plan',
    ['premium'] = 'Premium',
    ['medication_discount'] = 'Medication Discount',
    ['down_payment_fee'] = 'Down-Payment Fee',
    ['customer_paid'] = 'Customer Paid',
    ['coverage_percentage'] = 'Coverage Percentage',
    ['none'] = 'None',
    ['all_medications'] = 'ALL MEDICATIONS',
    ['all_medications_text'] = 'All Medications',
    ['none_available'] = 'NONE AVAILABLE',
    ['no_insurance_available'] = 'No insurance coverage available.',
    ['total_cost'] = 'TOTAL COST: $%s',

    -- Prescription Records System [ NEW FOR 3.0 ] --
    ['prescription_records'] = 'Prescription Records',
    ['doctor_records'] = 'Doctor Records',
    ['patient_records'] = 'Patient Records',
    ['all_records'] = 'All Records',
    ['medication_records'] = 'Medication Records',
    ['no_records'] = 'No records found',
    ['flag_record'] = 'Flag Record',
    ['unflag_record'] = 'Remove Flag',
    ['flag_reason'] = 'Reason for flagging',
    ['flag_success'] = 'Record has been flagged',
    ['unflag_success'] = 'Flag has been removed',
    ['prescription_id'] = 'Prescription ID',
    ['doctor'] = 'Doctor',
    ['patient'] = 'Patient',
    ['medication'] = 'Medication',
    ['doses'] = 'Doses',
    ['date'] = 'Date',
    ['expiry'] = 'Expiry',
    ['status'] = 'Status',
    ['flagged'] = 'Flagged',
    ['flag_reason_label'] = 'Flag Reason',
    ['flag_date'] = 'Flag Date',
    ['view_details'] = 'View Details',
    ['record_details'] = 'Record Details',
    ['filter_options'] = 'Filter Options',
    ['search'] = 'Search',
    ['back'] = 'Back',
    ['close'] = 'Close',

    -- Records
    ['view_prescription_records'] = '🔍 View Prescription Records',
    ['prescription_records_description'] = 'View and manage prescription history records',
    ['search_by_doctor'] = '👨‍⚕️ Search by Doctor',
    ['search_by_doctor_description'] = 'View prescriptions written by a specific doctor',
    ['search_by_patient'] = '👤 Search by Patient',
    ['search_by_patient_description'] = 'View prescriptions for a specific patient',
    ['search_by_medication'] = '💊 Search by Medication',
    ['search_by_medication_description'] = 'View prescriptions for a specific medication',
    ['view_flagged_prescriptions'] = '⚠️ View Flagged Prescriptions',
    ['view_flagged_description'] = 'View prescriptions that have been flagged for review',
    ['no_records_found'] = 'No Records Found',
    ['no_records_match'] = 'No prescription records match your search criteria',
    ['flagged_status'] = ' ⚠️ FLAGGED',
    ['flag_this_prescription'] = '⚠️ Flag this Prescription',
    ['flag_description'] = 'Mark this prescription for review',
    ['flag_reason_prompt'] = 'Enter the reason for flagging this prescription',
    ['prescription_flagged'] = 'Prescription has been flagged for review',
    ['remove_flag'] = '✅ Remove Flag',
    ['remove_flag_description'] = 'Remove the flag from this prescription',
    ['flag_removed'] = 'Flag removed from prescription record',

    -- Records Pages
    ['all_prescriptions_title'] = '📋 All Prescription Records',
    ['flagged_prescriptions_title'] = 'Flagged Prescriptions',
    ['flagged_prescriptions_description'] = 'View all flagged prescription records',
    ['view_all_prescriptions'] = '📋 View All Prescription History',
    ['view_all_prescriptions_description'] = 'View all prescription records',
    ['pages_title'] = '📋 All Prescription Records (Page %s of %s)',
    ['showing_results'] = 'Showing %s results',
    ['no_records_available'] = 'No prescription records available',
    ['page_navigation'] = '📄 Page Navigation',
    ['current_page'] = 'Current Page: %s of %s',
    ['previous_page'] = '⬅️ Previous Page',
    ['go_to_page'] = 'Go to page %s',
    ['next_page'] = '➡️ Next Page',
    ['jump_to_page'] = '🔢 Jump to Page',
    ['jump_to_page_description'] = 'Go to a specific page',
    ['enter_page_number'] = 'Enter a page number (1-%s)',
    ['invalid_page_number'] = 'Invalid page number',

    -- Flag Analytics
    ['actions_section_title'] = '🔍 Actions',
    ['actions_section_description'] = 'Actions for this flagged prescription',
    ['view_doctor_prescriptions_title'] = '🔍 View Doctor\'s Prescriptions',
    ['view_doctor_prescriptions_description'] = 'See all prescriptions written by %s',
    ['view_patient_prescriptions_title'] = '🔍 View Patient\'s Prescriptions',
    ['view_patient_prescriptions_description'] = 'See all prescriptions for %s',
    ['view_medication_prescriptions_title'] = '🔍 View Medication Prescriptions',
    ['view_medication_prescriptions_description'] = 'See all prescriptions for %s',
    ['flagged_prescription_details_title'] = 'Flagged Prescription Details',
    ['flagged_prescription_details_desc'] = 'Detailed flagged prescription information',
    ['flagged_by_doctor_title'] = '👨‍⚕️ Flagged Prescriptions by Doctor',
    ['flagged_by_doctor_description'] = 'Doctor frequency analysis',
    ['flagged_count_format'] = 'Flagged Prescriptions: %d',
    ['doctor_flag_analysis_title'] = 'Doctor Flag Analysis',
    ['flagged_by_patient_title'] = '👤 Flagged Prescriptions by Patient',
    ['flagged_by_patient_description'] = 'Patient frequency analysis',
    ['patient_flag_analysis_title'] = 'Patient Flag Analysis',
    ['flagged_by_medication_title'] = '💊 Flagged Prescriptions by Medication',
    ['flagged_by_medication_description'] = 'Medication frequency analysis',
    ['medication_flag_analysis_title'] = 'Medication Flag Analysis',
    ['showing_flagged_count'] = 'Showing %d flagged prescriptions',
    ['prescription_flagged_date'] = 'Prescription #%s | Flagged: %s',
    ['flagged_prescriptions'] = 'Flagged Prescriptions',
    ['related_records_title'] = '🔍 Related Records',
    ['related_records_description'] = 'View other related prescriptions',
    ['prescription_details'] = 'Prescription Details',

    -- Permission and Flagging
    ['insufficient_permissions'] = 'You do not have permission to perform this action',
    ['already_flagged'] = 'This prescription is already flagged',
    ['prescription_details_title'] = 'Prescription #%s',
    ['prescription_details_desc'] = 'Detailed prescription information',
    ['doctor_information'] = '👨‍⚕️ Doctor Information',
    ['patient_information'] = '👤 Patient Information',
    ['medication_details'] = '💊 Medication Details',
    ['record_information'] = '📅 Record Information',
    ['created_date'] = 'Created: %s',
    ['flag_information'] = '⚠️ Flag Information',
    ['flag_information_desc'] = 'This prescription has been flagged',
    ['no_reason_provided'] = 'No reason provided',
    ['unknown_date'] = 'Unknown',
    ['flag_reason_title'] = '⚠️ Flag Reason',

    -- Flag Metadata
    ['reason'] = 'Reason',
    ['doctor_prefix'] = 'Doctor: ',
    ['patient_prefix'] = 'Patient: ',
    ['medication_prefix'] = 'Medication: ',
    ['flagged_prescriptions_by_reason'] = 'Flagged Prescriptions: ',
    ['view_by_medication_title'] = '💊 View by Medication',
    ['view_by_medication_description'] = 'See which medications are most frequently flagged',
    ['flag_analytics_title'] = '📊 Flag Analytics',
    ['flag_analytics_description'] = 'Analyze patterns in flagged prescriptions',
    ['view_by_doctor_title'] = '👨‍⚕️ View by Doctor',
    ['view_by_doctor_description'] = 'See which doctors have the most flagged prescriptions',
    ['view_by_patient_title'] = '👤 View by Patient',
    ['view_by_patient_description'] = 'See which patients have the most flagged prescriptions',
    ['flag_warning_prefix'] = '⚠️ ',
    ['ban_date'] = 'Date: ',
    ['ban_date_label'] = 'Ban Date',
    ['expiration'] = 'Expiration',
    ['prescription_details_date'] = 'Prescription #%s | %s',
    ['count'] = 'Count',
    ['active'] = 'Active',

    -- Dialog Titles
    ['search_by_doctor_dialog'] = 'Search by Doctor',
    ['doctor_name_label'] = 'Doctor Name',
    ['enter_doctor_name'] = 'Enter the doctor\'s name',
    ['search_by_patient_dialog'] = 'Search by Patient',
    ['patient_name_label'] = 'Patient Name',
    ['enter_patient_name'] = 'Enter the patient\'s name',
    ['search_by_medication_dialog'] = 'Search by Medication',
    ['medication_label'] = 'Medication',
    ['flag_prescription_dialog'] = 'Flag Prescription',
    ['reason_label'] = 'Reason',
    ['jump_to_page_dialog'] = 'Jump to Page',
    ['page_number_label'] = 'Page Number',

    -- Shoplifting [ NEW FOR 3.0 ] --
    ['shopkeeper_busy'] = 'The shopkeeper is busy and will be with you shortly!',
    ['you_are_banned'] = 'You are banned from this pharmacy!',
    ['you_are_banned_from_pharmacy_for'] = 'You have been banned from this pharmacy for ',
    ['days'] = ' days!',
    ['try_somewhere_else'] = 'Try somewhere else!',
    ['attempt_shoplifting'] = 'Try to Shoplift',
    ['you_are_permanently_banned_from_pharmacy'] = 'You have been permanently banned from this pharmacy!',
    ['spotted_by_cctv'] = 'You got spotted by the CCTV!',
    ['pharmacist_did_not_see'] = 'The Pharmacist Did Not See You!',
    ['stolen_items'] = 'You have stolen %s %s from the pharmacy.',

    -- Pharmacy Supplies System [ NEW FOR 3.0 ] --
    ['supplies_low_notification'] = '%s is running low on supplies! Current supplies remaining: ',
    ['pharmacy_supplies_menu'] = '📦 Pharmacy Supplies',
    ['current_supplies'] = '📊 Current Supplies: %s/%s',
    ['start_restock_mission'] = '🚚 Start Restock Mission',
    ['restock_mission_description'] = 'Begin a supply run to restock the pharmacy inventory',
    ['restock_mission_active'] = 'A restock mission is already in progress',
    ['restock_mission_started'] = 'Supply run started! Go to the marked location to pick up the supplies',
    ['supplies_full'] = 'The pharmacy is already fully stocked',
    ['restock_cooldown'] = 'You must wait %s more minutes before doing another restock run',
    ['collect_supplies'] = 'Collect Supplies',
    ['load_supplies'] = 'Load Supplies',
    ['unload_supplies'] = 'Unload Supplies',
    ['complete_restock'] = 'Complete Restock',
    ['restock_complete'] = 'Restock completed! Added %s supplies to the pharmacy',
    ['restock_reward'] = 'You received $%s for completing the restock mission',
    ['return_to_pharmacy'] = 'Return to the pharmacy with the supplies',
    ['supplies_in_vehicle'] = 'Return to the pharmacy and unload the supplies',
    ['load_in_vehicle'] = 'Load the supplies into the vehicle',
    ['unload_supplies_instruction'] = 'Unload the supplies from the back of the vehicle and return to the pharmacy',
    ['deliver_to_pharmacy'] = 'Deliver the supplies to the pharmacy storage',
    ['no_active_mission'] = 'You don\'t have an active restock mission',
    ['job_grade_too_low'] = 'Your job grade is too low to access pharmacy supplies',
    ['wrong_job'] = 'You do not have the correct job to manage pharmacy supplies',
    ['wrong_vehicle'] = 'What are you doing back without the supplies?! Where is the van?',
    ['mission_failed_dead'] = 'Mission failed: You died during the restock mission',
    ['mission_failed_vehicle'] = 'Mission failed: Supply vehicle was destroyed',
    ['mission_failed_timeout'] = 'Mission failed: You took too long to complete the mission',
    ['current_supplies_description'] = 'Current pharmacy inventory supplies level',
    ['complete_restock_description'] = 'Complete the pharmacy restock',
    ['medical_supplies_vehicle'] = 'Medical Supplies Vehicle',
    ['medical_supplies_pickup'] = 'Medical Supplies Pickup',
    ['restock_mission_active_description'] = 'Someone is already restocking this pharmacy',
    ['restock_cooldown_description'] = 'Wait before starting another restock mission',
    ['supplies_full_description'] = 'This pharmacy has maximum supplies',
    ['med_supplies_vehicle_plate'] = 'MEDSUPPL',
    ['unload_supplies_first'] = 'You need to unload the supplies from the vehicle first',

    -- Employee Computer Menu [ NEW FOR 3.0 ] --
    ['pharmacy_employee_menu_title'] = '👨‍⚕️ Pharmacy Employee Menu',
    ['pharmacy_employee_menu_description'] = 'Manage customer interactions at the pharmacy counter',
    ['pharmacy_employee_dashboard'] = 'Pharmacy Employee Dashboard',
    ['shoploading_menu'] = 'Pharmacy Shoplifting Detection',
    ['check_ban_history_title'] = '🚫 Check Ban History',
    ['check_ban_history_description'] = 'View a patient\'s pharmacy ban history',
    ['process_prescription_title'] = '💊 Process Prescription',
    ['process_prescription_description'] = 'Help a patient process their prescription for a reward',
    ['ban_history_title'] = '🚫 Ban History: %s',
    ['ban_history_description'] = 'Review this patient\'s ban history at this pharmacy',
    ['no_ban_records_found'] = 'No Ban Records Found',
    ['no_ban_records_description'] = 'This patient has no ban history at this pharmacy',
    ['patient_ban_history'] = 'Patient Ban History',
    ['pharmacy_out_of_supplies'] =
    'This pharmacy is out of supplies! Restock the pharmacy before processing prescriptions.',
    ['prescriptions_for_patient'] = '💊 Prescriptions: %s',
    ['process_patient_prescriptions'] = 'Process this patient\'s prescriptions',
    ['patient_prescriptions'] = 'Patient Prescriptions',
    ['request_prescription_header'] = 'Request Prescription',
    ['request_prescription_content'] = 'Ask the patient to hand over their prescription for processing?',
    ['requested_prescription_from'] = 'Requested prescription from %s',
    ['received_prescription'] = 'You received prescription #%s from %s',
    ['prescription_received_header'] = 'Prescription Received',
    ['prepare_medication_instructions'] = 'Go to the medication storage area to prepare this prescription.',
    ['error_drug_collection_location'] = 'Error: Could not find drug collection location for this pharmacy',
    ['prepare_medication'] = 'Prepare Medication',
    ['go_to_medicine_cabinet'] = 'Go to the medicine cabinet to prepare the medication',
    ['no_prescription_to_process'] = 'No prescription to process',
    ['no_longer_have_prescription'] = 'You no longer have the prescription',
    ['preparing_medication'] = 'Preparing medication...',
    ['medication_ready_header'] = 'Medication Ready',
    ['medication_ready_content'] = 'Medication has been prepared. Return to the patient to complete the transaction.',
    ['process_prescription_header'] = 'Process Prescription',
    ['process_prescription_confirm'] =
    'Process this prescription for the patient?\n\nYou will receive %s%% of the payment as a reward.',
    ['use_employee_counter'] = 'Use Employee Counter',
    ['prescription_request_header'] = 'Prescription Request',
    ['prescription_request_content'] = '%s is requesting your prescription. Hand it over?',
    ['transferring_prescription'] = 'Transferring prescription to pharmacist...',
    ['declined_prescription_transfer'] = 'You declined to hand over your prescription',
    ['patient_declined_prescription'] = 'Patient declined to hand over their prescription',
    ['patient_no_prescriptions'] = 'Patient has no prescriptions',
    ['patient_no_ban_records'] = 'Patient has no ban records at this pharmacy',

    ['insurance_offer_header'] = '# 🏥 Insurance Offer',
    ['insurance_offer_declined'] = 'You declined the insurance offer',

    ['panic_button_title'] = '🚨 Panic Button',
    ['panic_button_description'] = 'Press the panic button to alert the police',
    ['panic_button_already_pressed'] = 'The panic button has already been pressed!',

    -- =============================================
    -- FORMATTING TEMPLATES
    -- =============================================
    ['plan_icon'] = '📝',
    ['benefit_bullet_point'] = '• ',

    ['prescription_info_template'] = [[
  # 📋 PRESCRIPTION INFORMATION

  💊 Medication: %s

  🔢 Number of Doses: %s

  💵 Medication Cost: $%s

  - - - - - - - - - - - - - -
  ]],

    ['insurance_info_template'] = [[

  # 🏥 INSURANCE INFORMATION

  📝 Medical Plan: %s

  ]],

    ['insurance_details_template'] = [[
  ✅ Coverage Status: %s

  📊 Discount Rate: %s%%

  💰 Discount Amount: $%s

  💲 Down-Payment: $%s

  💊 Covered Medications:
  %s

  - - - - - - - - - - - - - - - -

  💵 FINAL COST: $%s

  ]],

    ['insurance_you_save_template'] = [[
  💸 You save: $%s

  ]],

    ['no_insurance_details_template'] = [[

  ❌ No insurance coverage available.
  ## 💵 TOTAL COST: $%s

  ]],

    -- Insurance Offer Template
    ['insurance_offer_detailed'] = [[

  ## 👤 Agent: %s

  - - - - - - - - - - - - - - -

  📝 Plan: %s

  💵 Monthly Premium: $%s

  💯 Medication Discount: %s%%

  💲 Down-Payment Fee: $%s

  - - - - - - - - - - - - - - -

  ✅ Benefits:
  %s

  💊 Covered Medications:
  %s

  - - - - - - - - - - - - - - -

  ]],
}
