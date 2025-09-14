WebhookURL = "WEBHOOK" -- Webhook to send logs to discord

function beforeBuyMarket(source,market_id,price)
	-- Here you can do any verification when a player is buying a market, like if player has the permission to that or anything else you want to check before buy the market. return true or false
	return true
end

function afterBuyMarket(source,market_id,price)
	-- Here you can run any code right after the player purchase a business
end

function beforeBuyItem(source,market_id,item_id,amount,total_price,metadata)
	-- This function allows you to add checks before a player buys an item from a market. For example, you can verify whether the player has the necessary permissions or licenses to buy the item.
	-- You can also change the item's metadata here. For instance, by removing the comment from the next line, you will add a new metadata to the item called "purchased_at":
	-- metadata.purchased_at = "Owned stores"
	-- This function must return 'true' to allow the purchase, or 'false' to block it, based on your conditions.
	return true
end

function afterBuyItem(source,market_id,item_id,amount,total_price,account)
	-- Here you can run any code just after the player purchased any item, like government taxes or anything else
end

function beforeHireEmployee(source,market_id,employee_id)
	-- Here you can do any verification when a player is being hired to a store by the owner. return true or false
	return true
end

function afterHireEmployee(source,market_id,employee_id)
	-- Here you can run any code right after the a employee was hired
end