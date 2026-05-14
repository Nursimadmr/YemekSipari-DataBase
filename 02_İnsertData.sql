USE YemekSiparişDB;
GO
insert into Musteri (Ad,Soyad,Email,Telefon) values ('Ayşe','Kaya','Ayse@gmail.com','05676899887'),
('Mehmet', 'Öz', 'mehmet@gmail.com', '05003334455'),
('Fatma', 'Çelik', 'fatma@gmail.com', '05004445566'),
('Zehra','Demir','zhra@gmail.com','5098073443'),
('Ahmet', 'Şahin', 'ahmet@gmail.com', '05005556677'),
('Ali','Yıldız','ali.yildiz@gmail.com','05001112233'),
('Elif','Aydın','elif.aydin@gmail.com','05002223344'),
('Burak','Koç','burak.koc@gmail.com','05003335577'),
('Zeynep','Arslan','zeynep.arslan@gmail.com','05004446688'),
('Emre','Kurt','emre.kurt@gmail.com','05005557799'),
('Merve','Şimşek','merve.simsek@gmail.com','05006668811'),
('Can','Polat','can.polat@gmail.com','05007779922'),
('Derya','Aslan','derya.aslan@gmail.com','05008881133'),
('Onur','Güneş','onur.gunes@gmail.com','05009992244'),
('Selin','Aksoy','selin.aksoy@gmail.com','05101113355'),
('Hakan','Yavuz','hakan.yavuz@gmail.com','05102224466'),
('Esra','Kılıç','esra.kilic@gmail.com','05103335577'),
('Tolga','Çetin','tolga.cetin@gmail.com','05104446688'),
('Seda','Bozkurt','seda.bozkurt@gmail.com','05105557799'),
('Kaan','Erdoğan','kaan.erdogan@gmail.com','05106668800'),
('Melis','Doğan','melis.dogan@gmail.com','05107779911');

INSERT INTO Restoran (Ad, Adres, RestoranPuani) VALUES
('Pizza House', 'İstanbul Kadıköy', 5),
('Burger World', 'Ankara Çankaya', 4),
('Kebapçı Ali', 'Adana Seyhan', 5),
('Sushi Master', 'İzmir Konak', 4),
('Tatlı Dünyası', 'Bursa Osmangazi', 3);

INSERT INTO Urun (RestoranID, UrunAdi, Fiyat) VALUES
(1, 'Kaşarlı Pizza', 85),
(1, 'Tavuklu Pizza', 90),
(1, 'Karışık Pizza', 100),
(1, 'Mantarlı Pizza', 88),
(1, 'Sucuklu Kaşarlı Pizza', 95),

(2, 'Klasik Hamburger', 65),
(2, 'Tavuk Burger', 60),
(2, 'Izgara Köfte Burger', 75),
(2, 'Patates Kızartması', 30),
(2, 'Soğan Halkası', 35),

(3, 'Adana Kebap', 80),
(3, 'Urfa Kebap', 75),
(3, 'Tavuk Şiş', 65),
(3, 'Kuzu Şiş', 95),
(3, 'İskender', 100),

(4, 'Mercimek Çorbası', 40),
(4, 'Ezogelin Çorbası', 45),
(4, 'Tavuk Suyu Çorba', 50),
(4, 'Yayla Çorbası', 35),
(4, 'Domates Çorbası', 38),

(5, 'Baklava', 60),
(5, 'Künefe', 70),
(5, 'Sütlaç', 45),
(5, 'Kazandibi', 50),
(5, 'Revani', 40),

(3, 'Karışık Izgara', 120),
(2, 'Çıtır Tavuk', 70),
(1, 'Sebzeli Pizza', 85),
(4, 'Tarhana Çorbası', 42),
(5, 'Tulumba Tatlısı', 38),

(3, 'Beyti Kebap', 110),
(2, 'Double Hamburger', 90),
(1, 'Acılı Pizza', 92),
(4, 'Mantar Çorbası', 45),
(5, 'Dondurma', 35),

(1, 'Margarita Pizza', 80),
(1, 'Sucuklu Pizza', 95),
(1, 'Vejetaryen Pizza', 85),
(2, 'Cheeseburger', 60),
(2, 'Double Burger', 85),

(2, 'Patates Kızartması', 25),
(3, 'Adana Kebap', 70),
(3, 'Urfa Kebap', 65),
(3, 'Lahmacun', 30),
(4, 'California Roll', 120),

(4, 'Salmon Nigiri', 150),
(4, 'Miso Çorbası', 40),
(5, 'Baklava', 50),
(5, 'Kazandibi', 45),
(5, 'Sütlaç', 35);

INSERT INTO Kurye (Ad, Soyad, Telefon) VALUES
('Murat', 'Koç', '05006667788'),
('Selin', 'Arslan', '05007778899'),
('Emre', 'Yıldız', '05008889900');
 

-- Sipariş ekleme
INSERT INTO Siparis (MusteriID, RestoranID, KuryeID, SiparisTutari, Durum)
VALUES (1, 1, 1, 175, 'Teslim Edildi'),
(2, 2, 2, 145, 'Hazırlanıyor'),
(3, 3, 1, 70, 'Teslim Edildi');

-- Sipariş 1 detayları
INSERT INTO SiparisDetay (SiparisID, UrunID, Adet)
VALUES (1, 1, 1),  
       (1, 2, 1); 

-- Sipariş 2 detayları
INSERT INTO SiparisDetay (SiparisID, UrunID, Adet)
VALUES (2, 4, 2),  
       (2, 6, 1);  

-- Sipariş 3 detayları
INSERT INTO SiparisDetay (SiparisID, UrunID, Adet)
VALUES (3, 7, 1);  


-- Örnek bağışlar
INSERT INTO AskidaYemek (MusteriID, BagisTuru, Tutar)
VALUES 
(1, 'Bakiye', 100),   -- Ayşe 100 TL bakiye bağışladı
(2, 'Yemek', 1),      -- Mehmet 1 yemek bağışladı
(3, 'Bakiye', 50),    -- Fatma 50 TL bağışladı
(4, 'Yemek', 2),      -- Zehra 2 yemek bağışladı
(5, 'Bakiye', 200);   -- Ahmet 200 TL bağışladı

UPDATE AskidaYemek
SET IsActive = 0
WHERE BagisID = 2;  -- Ayşe'nin yemek bağışı pasif hale getirildi

SELECT * FROM SiparisDetay; 
SELECT * FROM Urun;
