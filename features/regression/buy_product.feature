# encoding: UTF-8

Feature: Amazon sayfasından urun alma, satiscilar arasindaki fiyat karsilastirmasini yapma

  @senaryo-1
  Scenario: Amazon en dusuk fiyatli urunu satin alma
    Given Amazon sayfasına gidersem
    Then Arama alanına "Iphone " yazarsam
    And önerilerde gelen Iphone x ürününü seçersem
    Then sayfada "Aranan ürün:" yazısının geldiğini görürüm
    And aranan ürünün isminin "iphone x" olduğunu görürüm

    And sayfada listelenen ilk iphone ürününü seçersem
    Then "Apple iPhone X, 64 GB, Uzay Gri (Apple Türkiye Garantili)" ürünün geldiğini görürüm
    And sağ paneldeki "Amazon'daki Diğer Satıcılar" sekmesindeki fiyatlarla karşılaştırırsam ve en düşük fiyatlı olanı sepete eklersem
    Then ürünün sepete eklendiğini ve "1" olarak gösterildiğini görürüm








