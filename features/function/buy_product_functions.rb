def comparison_three_seller_price
  if split_first_price <= split_second_price && split_first_price <= split_third_price
    print(split_first_price, "is the lowest price")
    find_by_id("mbc-buybutton-addtocart-1-announce").click

  elsif split_second_price <= split_first_price && split_second_price <= split_third_price
    print(split_second_price, "is the lowest price")
    find_by_id("mbc-buybutton-addtocart-2-announce").click

  else
    print(split_third_price, "is the lowest price")
    find_by_id("mbc-buybutton-addtocart-3-announce").click
  end
end

def comparison_two_seller_price
  if split_first_price < split_second_price
    print(split_first_price, "is the lowest price")
    find_by_id("mbc-buybutton-addtocart-1-announce").click

  else
    split_second_price < split_first_price
    print(split_second_price, "is the lowest price")
    find_by_id("mbc-buybutton-addtocart-2-announce").click
  end
end