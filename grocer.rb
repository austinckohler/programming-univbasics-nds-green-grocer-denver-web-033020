def find_item_by_name_in_collection(name, collection)
counter = 0 
while counter < collection.length do 
if collection[counter][:item] == name
  return collection[counter]
end
  counter += 1
end
end

# def consolidate_cart(cart)
#   new_cart = [] # (items in the new cart)
#   counter = 0 
#   while counter < cart.length 
#   new_cart_item = find_item_by_name_in_collection(cart[counter][:item], new_cart)
#   if new_cart_item #(if new cart item is not NIL the new cart items count should be increased by 1) 
#     new_cart_item[:count] += 1
#   else 
#     new_cart_item = {
#       :item => cart[counter][:item],
#       :price => cart[counter][:price],
#       :clearance => cart[counter][:clearance],
#       :count => 1 
#     }
#     new_cart << new_cart_item
#   end 
#   counter += 1
# end
# new_cart
# end

# # need to return a [{:item => "", :count => Integer}]
# # item {:item => "", :count => Integer}
# # need to know if the item already exist in the new cart or not 

# def apply_coupons(cart, coupons)
#   counter = 0 
#   while counter < coupons.length 
#   cart_item = find_item_by_name_in_collection(coupons[counter][:item], cart) #will either be an item name or nil
#   couponed_item_name = "#{coupons[counter][:item]} W/COUPON" #items name with the string w/coupon following it 
#   cart_item_with_coupon = find_item_by_name_in_collection(couponed_item_name, cart)#want to check to see if this item w/coupon already exist in the cart if it does we want to increase the count. will either be an item name w/ coupon or nil 
#     if cart_item && cart_item[:count] >= coupons[counter][:num]#this if statement checks if the cart_item exists in the cart and also checks if the cart_items count is largerthan or equal to the number of that item on our coupon. if those things are both true then we want to make sure that one of two things happens.
#       if cart_item_with_coupon#cart_item with coupon already exists then we want to increase the count of that. if not we want to add that cart_item_with_coupon to the cart. 
#         cart_item_with_coupon[:count] += coupons[counter][:num]
#         cart_item[:count] -= coupons[counter][:num]
#       else 
#         cart_item_with_coupon = {
#           :item => couponed_item_name,
#           :price => coupons[counter][:cost] / coupons[counter][:num], #taking cost of items on coupon and divdie by the number on item 
#           :count => coupons[counter][:num],
#           :clearance => cart_item[:clearance]
#         }
#         cart << cart_item_with_coupon
#         cart_item[:count] -= coupons[counter][:num]
#       end 
#     end
#   counter += 1
#   end
#   cart 
# end
  

# def apply_clearance(cart)
# counter = 0 
# while counter < cart.length
# if cart[counter][:clearance] 
#   cart[counter][:price] = (cart[counter][:price] - (cart[counter][:price] * 0.20)).round(2)
# end
# counter += 1 
# end 
# cart 
# end

# def checkout(cart, coupons)
# consolidated_cart = consolidate_cart(cart) #this consolidates cart 
# couponed_cart = apply_coupons(consolidated_cart, coupons) #take consoldated cart AND APPLYS coupons
# final_cart = apply_clearance(couponed_cart) #takes couponedcart  and applies clearnace 

# total = 0 
# counter = 0 
# while counter < final_cart.length 
#   total += final_cart[counter][:price] = final_cart[counter][:count] #add to total cart the price of item and count 
#   counter += 1 
# end 
# if total > 100 
#   total -= (total * 0.10)
# end
# total
# end 

def consolidate_cart(cart)
 

end

def apply_coupons(cart, coupons)
  coupCart = cart
  count = 0
  while coupons[count] do
    if cart[coupons[count][:item]]
      if cart[coupons[count][:item]][:count] >= coupons[count][:num]
        coupCart[coupons[count][:item]][:count] = coupCart[coupons[count][:item]][:count] - coupons[count][:num]
        coupItem = "#{coupons[count][:item]} W/COUPON"
        coupPrice = coupons[count][:cost] / coupons[count][:num]
        if coupCart[coupItem]
          coupCount = coupCart[coupItem][:count] + coupons[count][:num]
        else
          coupCount = coupons[count][:num]
        end
        coupCart[coupItem] = {:price => coupPrice, :clearance => coupCart[coupons[count][:item]][:clearance], :count => coupCount}
        count += 1
      else
        count += 1
      end
    else
      count += 1
    end
  end
  coupCart
end

def apply_clearance(cart)
count = 0
  while cart.keys[count]
    item = cart.keys[count]
    if cart[item][:clearance]
      cart[item][:price] = (cart[item][:price] * 0.8).round(2)
      count += 1
    else
      count += 1
    end
  end
  cart
end

def checkout(cart, coupons)
consCart = consolidate_cart(cart)

  coupCart = apply_coupons(consCart, coupons)

  clearCart = apply_clearance(coupCart)

  total = 0
  count = 0
  while clearCart.keys[count]
    item = clearCart.keys[count]
    total += clearCart[item][:price] * clearCart[item][:count]
    count += 1
  end
  puts total
  if total > 100
    total *= 0.9
  end
  total
end
