if Config.Phone ~= "lb" then return end

function GetPlayerPhoneNumber(id)
   return exports["lb-phone"]:GetEquippedPhoneNumber(id) or nil 
end