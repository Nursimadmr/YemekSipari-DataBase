--  Gelişmiş Nesneler (View, Trigger, Index)

-------------------------------------------------
-- 1. VIEW: Aktif restoran menüleri
-------------------------------------------------
CREATE VIEW vw_AktifRestoranMenuleri AS
SELECT r.Ad AS RestoranAdi, u.UrunAdi, u.Fiyat
FROM dbo.Urun u
JOIN dbo.Restoran r ON u.RestoranID = r.RestoranID
WHERE u.IsActive = 1;
GO

-------------------------------------------------
-- 2. VIEW: Askıda Yemek havuz durumu
-------------------------------------------------
CREATE VIEW vw_AskidaYemekHavuzDurumu AS
SELECT SUM(Tutar) AS ToplamBagis, COUNT(*) AS BagisSayisi
FROM dbo.AskidaYemek
WHERE IsActive = 1;
GO

-------------------------------------------------
-- 3. TRIGGER: Sipariş teslim edildiğinde restoran cirosunu güncelle
-------------------------------------------------
CREATE TRIGGER trg_SiparisTeslim
ON dbo.Siparis
AFTER UPDATE
AS
BEGIN
    IF UPDATE(Durum)
    BEGIN
        UPDATE r
        SET r.ToplamCiro = r.ToplamCiro + x.SiparisTutari
        FROM dbo.Restoran r
        JOIN inserted i ON r.RestoranID = i.RestoranID
        JOIN (
            SELECT s.SiparisID, SUM(sd.Adet * u.Fiyat) AS SiparisTutari
            FROM dbo.Siparis s
            JOIN dbo.SiparisDetay sd ON s.SiparisID = sd.SiparisID
            JOIN dbo.Urun u ON sd.UrunID = u.UrunID
            GROUP BY s.SiparisID
        ) x ON i.SiparisID = x.SiparisID
        WHERE i.Durum = 'Teslim Edildi';
    END
END;
GO

-------------------------------------------------
-- 4. TRIGGER: Askıda Yemek kullanıldığında havuz bakiyesini düşür
-------------------------------------------------
CREATE TRIGGER trg_AskidaYemekKullanildi
ON dbo.Siparis
AFTER INSERT
AS
BEGIN
    UPDATE a
    SET a.Tutar = a.Tutar - x.SiparisTutari
    FROM dbo.AskidaYemek a
    JOIN inserted i ON i.IsAskidaYemek = 1
    JOIN (
        SELECT s.SiparisID, SUM(sd.Adet * u.Fiyat) AS SiparisTutari
        FROM dbo.Siparis s
        JOIN dbo.SiparisDetay sd ON s.SiparisID = sd.SiparisID
        JOIN dbo.Urun u ON sd.UrunID = u.UrunID
        GROUP BY s.SiparisID
    ) x ON i.SiparisID = x.SiparisID;
END;
GO

-------------------------------------------------
-- 5. INDEX: Müşteri e-posta için
-------------------------------------------------
CREATE UNIQUE INDEX IX_Musteri_Email ON dbo.Musteri(Email);
GO

-------------------------------------------------
-- 6. INDEX: Sipariş tarihine
-------------------------------------------------
CREATE INDEX IX_Siparis_Tarih ON dbo.Siparis(SiparisTarihi);
GO


