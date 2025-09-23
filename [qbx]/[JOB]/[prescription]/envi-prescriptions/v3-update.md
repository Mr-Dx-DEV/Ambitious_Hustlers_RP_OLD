`# Envi-Prescriptions v3.0 Update

Hello everyone! We're excited to bring you the 3.0 update for Envi-Prescriptions. 
This update adds several new features to enhance your medical roleplay experience and give your EMS more to do in their downtime.

## New Features

### 🏥 Medical Insurance System
- **Different Plans**: Players can now choose between different insurance plans (None, Basic, Standard, Premium)
- **Cost Savings**: Insurance plans give discounts on medication prices
- **Down-Payment System**: Players pay a smaller fee (downpayment) when their insurance covers medications
- **Claim History**: Players can view their insurance claim history
- **Automatic Payments**: Insurance fees are charged automatically on a schedule
- **Insurance Brokers**: EMS can now sell insurance plans to players and earn commission

### 📦 Pharmacy Supplies System
- **Limited Supplies**: Pharmacies will still always have the medication you need, but keeping them stocked up means the society will earn money
- **Restock Missions**: EMS can go on missions to restock the pharmacy
- **Supply Delivery**: Drive a van to pick up and deliver medical supplies
- **Low Supply Alerts**: EMS workers get notifications when pharmacy supplies are running low
- **Supply Management**: Pharmacy staff can manage inventory and order new supplies

### 🚨 Shoplifting System
- **Item Theft**: Players can try to steal items from pharmacy shelves
- **Ban System**: Players caught shoplifting (in the Pharmacist's Field Of Vision or Randomly by CCTV) will be banned from the pharmacy
- **Escalating Punishments**: The more times you get banned - the longer the punishment!
- **Permanent Bans**: After multiple bans, players can be permanently banned

### 🗣️ Better NPC Interactions
- **Improved Dialogue**: Pharmacists now have more realistic conversations
- **Improved Responses**: NPCs respond differently based on the situation
- **Better Animations**: Cleaner animation handling during prescription pick-up

### 💊 Improved Medication System
- **Better Collection Process**: Collecting medications now shows medication and insurance info
- **Society Payments**: Money from prescriptions goes to your EMS/Doctor society
- **Cost Per Dose**: Medications now have a base price plus a cost per dose

### 📝 Prescriptions UI
- **Realistic UI For Viewing Prescriptions**: A nice extra touch of realism!
- **Detailed Information**: Shows prescription ID, patient details, medication info, doctor signature and expiry date
- **OX Metadata Integration**: Prescription info now auto-appears in item description automatically

### 🥤 Lean Improvements
- **Better Animations**: More detailed animations drinking lean

### 💵 Pharmacy Job
- **Dedicated Role**: New job specifically for pharmacy staff (or leave to 'ambulance' to give EMS more to do!)
- **Grade Requirements**: Different features unlock based on job grade
- **Employee Computer**: Staff can access prescription records, check for flagged prescriptions, and more
- **Panic Button**: Call the feds on pesky unwanted customers!

## Exports and Integration

### Medication System Exports

#### Client Side Exports

##### `StartOverdose()`
Forces a player to start overdosing. Useful for custom drug scripts or medical scenarios.

```lua
exports['envi-prescriptions']:StartOverdose()
```

##### `StopOverdose()`
Forces a player to stop overdosing. Useful for custom drug scripts or medical scenarios.

```lua
exports['envi-prescriptions']:StopOverdose()
```

##### `DrugTaken(amount)`
Adds to the drug taken count - which will trigger overdosing when taken too much

```lua
exports['envi-prescriptions']:DrugTaken(1)
```

#### Server Side Exports

For server developers who want to integrate with this script:

##### `GiveRandomMeds(source)`
Gives a player a RANDOM medication with randomly generated patient information. Great for 'finding' or stealing them in other scripts.

```lua
exports['envi-prescriptions']:GiveRandomMeds(source)
```

##### `GiveMedicationWithRandomData(source, item, doses)`
Gives a player SPECIFIC medication with randomly generated patient information. Great for 'finding' or stealing them in other scripts.

```lua
-- Give medication to a player
local item = 'oxy'
local doses = 5

exports['envi-prescriptions']:GiveMedicationWithRandomData(source, item, doses)
```

##### `GivePlayerMedication(source, item, doses)`
Gives medication using the player's actual character information.

```lua
-- Give medication using player's character info
local item = 'adrenaline'
local doses = 5
exports['envi-prescriptions']:GivePlayerMedication(source, item, doses)
```

### Pharmacy Supply System Exports

#### Server Side Exports

##### `reducePharmacySupplies(pharmacyId)`
Reduces the supplies at a pharmacy when medications are given out. Returns true if supplies were available and reduced, false otherwise.
```lua
local hasSupplies = exports['envi-prescriptions']:reducePharmacySupplies(1)
```

#### Client Side Exports

##### `OpenPharmacySuppliesMenu()`
Opens the pharmacy supplies management menu for staff.
```lua
exports['envi-prescriptions']:OpenPharmacySuppliesMenu()
```

##### `OpenPharmacyEmployeeMenu()`
Opens the pharmacy employee computer interface.
```lua
exports['envi-prescriptions']:OpenPharmacyEmployeeMenu()
```

### Insurance System Exports

#### Server Side Exports

##### `HasMedicalInsurance(source)`
Returns a boolean indicating if the player has any active insurance plan.

```lua
-- Check if player has insurance
local hasInsurance = exports['envi-prescriptions']:HasMedicalInsurance(source)
if hasInsurance then
    -- Player has insurance coverage
    print("Player has medical insurance")
else
    -- Player doesn't have insurance
    print("Player has no insurance coverage")
end
```

##### `GetPlayerInsurance(source)`
Returns complete insurance details for a player.

```lua
-- Get player's insurance data
local insuranceData = exports['envi-prescriptions']:GetPlayerInsurance(source)
if insuranceData and insuranceData.plan ~= 'none' then
    print("Player has " .. insuranceData.planName .. " plan")
    print("Discount rate: " .. insuranceData.discount .. "%")
    print("Down-Payment amount: $" .. insuranceData.downpayment)
end
```

##### `GetInsuranceClaimHistory(source)`
Returns a player's insurance claim history.

```lua
-- Get claim history
local claimHistory = exports['envi-prescriptions']:GetInsuranceClaimHistory(source)
for _, claim in ipairs(claimHistory) do
    print("Claim for " .. claim.medication .. " on " .. claim.formatted_date)
    print("Amount covered: $" .. claim.covered_amount)
    print("Status: " .. claim.status)
end
```

##### `PurchaseInsurance(source, planId)`
Attempts to purchase an insurance plan for a player. Returns true on success, false otherwise.

```lua
-- Purchase 'premium' plan for player
local success = exports['envi-prescriptions']:PurchaseInsurance(source, 'premium')
if success then
    print("Insurance plan purchased successfully")
else
    print("Failed to purchase insurance plan")
end
```

##### `CancelInsurance(source)`
Cancels a player's current insurance plan. Returns true on success, false otherwise.

```lua
-- Cancel player's insurance
local success = exports['envi-prescriptions']:CancelInsurance(source)
if success then
    print("Insurance cancelled successfully")
else
    print("Failed to cancel insurance")
end
```

##### `SellInsuranceThroughBroker(brokerId, customerId, planId)`
Allows a broker (insurance salesperson) to sell insurance to another player. Returns true if successful.

```lua
-- Insurance broker sells premium plan to customer
local success = exports['envi-prescriptions']:SellInsuranceThroughBroker(source, targetId, 'premium')
if success then
    print("Insurance sold successfully through broker")
else
    print("Failed to sell insurance through broker")
end
```

##### `IsPlayerBannedFromInsurance(citizenid)`
Checks if a player is banned from purchasing insurance.

```lua
local isBanned = exports['envi-prescriptions']:IsPlayerBannedFromInsurance(citizenid)
if isBanned then
    print("Player is banned from purchasing insurance")
else
    print("Player is eligible for insurance")
end
```

#### Client Side Exports

##### `HasMedicalInsurance()`
Returns a bool - if the player has any active insurance plan.

```lua
-- Check if player has insurance
local hasInsurance = exports['envi-prescriptions']:HasMedicalInsurance()
if hasInsurance then
    -- Has insurance, offer discount
    SetDiscountRate(25)
end
```

##### `GetInsuranceDetails()`
Returns complete insurance details for the player.

```lua
-- Get insurance details
local insuranceData = exports['envi-prescriptions']:GetInsuranceDetails()
if insuranceData and insuranceData.plan ~= 'none' then
    -- Use the insurance details
    local discountRate = insuranceData.discount
    ShowNotification("You have " .. insuranceData.planName .. " insurance with " .. discountRate .. "% discount")
end
```

##### `OpenInsuranceMenu()`
Opens the insurance menu for the player.

```lua
-- Open insurance menu from another script
RegisterCommand('checkinsurance', function()
    exports['envi-prescriptions']:OpenInsuranceMenu()
end, false)
```

##### `GetClaimHistory()`
Returns the player's insurance claim history.

```lua
-- Get player's claim history
local claims = exports['envi-prescriptions']:GetClaimHistory()
if #claims > 0 then
    DisplayClaimsList(claims)
else
    ShowNotification("You have no insurance claims")
end
```

##### `OpenInsuranceBrokerMenu()`
Opens the insurance broker menu for selling insurance to other players.

```lua
-- Open broker menu from another script
exports['envi-prescriptions']:OpenInsuranceBrokerMenu()
```

### Prescription Records Exports

#### Server Side Exports

##### `FlagPrescriptionRecord(recordId, reason, source)`
Flags a prescription record for review.

```lua
exports['envi-prescriptions']:FlagPrescriptionRecord(123, "Possible misuse", source)
```

##### `GetDoctorPrescriptionRecords(doctorIdentifier)`
Gets all prescription records for a specific doctor.

```lua
local records = exports['envi-prescriptions']:GetDoctorPrescriptionRecords(doctorIdentifier)
```

## Test Commands

When in test mode (`Config.TestMode = true`), you can use these commands:

- `/testmeds [medication] [doses]` - Test giving specific medication with random 'NPC' data
- `/testmeds2 [medication] [doses]` - Test giving player medication
- `testmeds3` - Test giving player random medication with random 'NPC' data 
- `/testinsurance` - Open the insurance menu
- `/testrestock` - Test the pharmacy restock system
- `/testemployee` - Test the pharmacy employee computer
