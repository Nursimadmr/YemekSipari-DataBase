--  İleri Sorgular ve Raporlar

-------------------------------------------------
-- 1. Sipariş Fişi (JOIN ile tüm detaylar)
-------------------------------------------------
SELECT 
    s.SiparisID,
    m.Ad AS MusteriAdi,
    r.Ad AS RestoranAdi,
    k.Ad AS KuryeAdi,
    u.UrunAdi,
    sd.Adet,
    u.Fiyat
FROM dbo.Siparis s
JOIN dbo.Musteri m ON s.MusteriID = m.MusteriID
JOIN dbo.Restoran r ON s.RestoranID = r.RestoranID
JOIN dbo.Kurye k ON s.KuryeID = k.KuryeID
JOIN dbo.SiparisDetay sd ON s.SiparisID = sd.SiparisID
JOIN dbo.Urun u ON sd.UrunID = u.UrunID;

-------------------------------------------------
-- 2. En Çok Sipariş Alan Restoran (GROUP BY)
-------------------------------------------------
SELECT 
    r.Ad AS RestoranAdi,
    COUNT(s.SiparisID) AS SiparisSayisi
FROM dbo.Siparis s
JOIN dbo.Restoran r ON s.RestoranID = r.RestoranID
GROUP BY r.Ad
ORDER BY SiparisSayisi DESC;

-------------------------------------------------
-- 3. Askıda Yemek Bağışı Yapmayan Müşteriler (Subquery)
-------------------------------------------------
SELECT 
    m.MusteriID,
    m.Ad AS MusteriAdi
FROM dbo.Musteri m
WHERE m.MusteriID NOT IN (
    SELECT DISTINCT MusteriID FROM dbo.AskidaYemek
);

-------------------------------------------------
-- 4. Son 1 Ayda Siparişler (Tarih filtresi)
-------------------------------------------------
SELECT 
    s.SiparisID,
    m.Ad AS MusteriAdi,
    s.SiparisTarihi,
    SUM(sd.Adet * u.Fiyat) AS ToplamTutar
FROM dbo.Siparis s
JOIN dbo.Musteri m ON s.MusteriID = m.MusteriID
JOIN dbo.SiparisDetay sd ON s.SiparisID = sd.SiparisID
JOIN dbo.Urun u ON sd.UrunID = u.UrunID
WHERE s.SiparisTarihi >= DATEADD(MONTH, -1, GETDATE())
GROUP BY s.SiparisID, m.Ad, s.SiparisTarihi;

