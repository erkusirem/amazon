Given(/^Amazon sayfasına gidersem$/) do
  safe_visit 'http://amazon.com.tr/'

  #Sayfa Açıldıktan Sonra Amazon Logosunu Görme
  expect(page).to have_selector("#nav-logo")
end

Then(/^Arama alanına "([^"]*)" yazarsam$/) do |product|
  find_by_id("twotabsearchtextbox").set product

  #Arama Önerilerini Görme
  expect(page).to have_selector("#suggestions-template")
end

And(/^önerilerde gelen Iphone x ürününü seçersem$/) do
  find('div[data-keyword="iphone x"]').click
end

Then(/^sayfada "([^"]*)" yazısının geldiğini görürüm$/) do |message|
  top_text = find("div.a-section.a-spacing-small.a-spacing-top-small", match: :first).text
  expect(top_text).to include message
end

And(/^aranan ürünün isminin "([^"]*)" olduğunu görürüm$/) do |product|
  product_name = find("span.a-color-state.a-text-bold").text
  expect(product_name).to include product
end

And(/^sayfada listelenen ilk iphone ürününü seçersem$/) do
  find("div.a-section.a-spacing-medium", match: :first).find("div.a-section.a-spacing-none", match: :first).click
end

Then(/^"([^"]*)" ürünün geldiğini görürüm$/) do |product|
  #Seçilen ilk ürünün isminin geldiğini görme
  product_title = find_by_id("productTitle").text
  expect(product_title).to eq product
end

Then(/^sağ paneldeki "([^"]*)" sekmesindeki fiyatlarla karşılaştırırsam ve en düşük fiyatlı olanı sepete eklersem$/) do |arg|
  #Diğer Satıcılar yazısını görme
  expect(page).to have_selector("div.a-box.a-text-center", text: arg)

  #Sayfada Görüntülenen Kaç tane satıcı var
  number_of_seller = find_by_id("mbc-action-panel-wrapper").all("span.a-button-inner").size
  p number_of_seller
  expect(number_of_seller).to be > 0

  def split_first_price
    first_price = find_by_id("mbc-price-1").text
    split_first_price = first_price.split('₺')[1].split(',')[0].to_f
    p split_first_price
  end

  def split_second_price
    second_price = find_by_id("mbc-price-2").text
    split_second_price = second_price.split('₺')[1].split(',')[0].to_f
    p split_second_price
  end

  def split_third_price
    third_price = find_by_id("mbc-price-3").text
    split_third_price = third_price.split('₺')[1].split(',')[0].to_f
    p split_third_price
  end

  #Diğer satıcıların fiyatlarını karşılaştırabilir hale getiriyorum
  if number_of_seller == 3
    #Diğer satıcıların fiyatlarını karşılaştırabilir hale getiriyorum
    split_first_price
    split_second_price
    split_third_price

    #Üç satıcı arasındaki fiyatları karlışatırıp, en düşük fiyatlı ürünü sepete ekliyorum
    comparison_three_seller_price

  elsif number_of_seller == 2
    #Diğer satıcıların fiyatlarını karşılaştırabilir hale getiriyorum
    split_first_price
    split_second_price

    #İki satıcı arasındaki fiyatları karlışatırıp, en düşük fiyatlı ürünü sepete ekliyorum
    comparison_two_seller_price

  elsif number_of_seller == 1
    split_first_price
    find_by_id("mbc-buybutton-addtocart-1-announce").click
  end

  #Ekran Görüntüsü için bir örnek, her senaryo çalıştıktan sonra After do döngüsüne de eklenebilir
  page.save_screenshot('screenshot.png')
end

Then(/^ürünün sepete eklendiğini ve "([^"]*)" olarak gösterildiğini görürüm$/) do |number_of_product|
  count = find_by_id("nav-cart-count").text
  expect(count).to eq number_of_product
end