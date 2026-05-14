USE YemekSiparişDB;
GO

-- Musteri Tablosu
CREATE TABLE Musteri(
    MusteriID INT PRIMARY KEY IDENTITY(1,1),
    Ad NVARCHAR(50) NOT NULL,
    Soyad NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100) UNIQUE NOT NULL,
    Telefon NVARCHAR(15) UNIQUE NOT NULL,
    IsActive BIT DEFAULT 1
);


-- Restoran Tablosu
CREATE TABLE Restoran (
    RestoranID INT PRIMARY KEY IDENTITY(1,1),
    Ad NVARCHAR(100) NOT NULL,
    Adres NVARCHAR(200),
    RestoranPuani INT CHECK (RestoranPuani BETWEEN 1 AND 5),
    IsActive BIT DEFAULT 1
);


-- Kurye Tablosu
CREATE TABLE Kurye (
    KuryeID INT PRIMARY KEY IDENTITY(1,1),
    Ad NVARCHAR(50),
    Soyad NVARCHAR(50),
    Telefon NVARCHAR(15) UNIQUE NOT NULL,
    IsActive BIT DEFAULT 1
);


-- Urun Tablosu
CREATE TABLE Urun (
    UrunID INT PRIMARY KEY IDENTITY(1,1),
    RestoranID INT FOREIGN KEY REFERENCES Restoran(RestoranID),
    UrunAdi NVARCHAR(100) NOT NULL,
    Fiyat DECIMAL(10,2) CHECK (Fiyat > 0),
    IsActive BIT DEFAULT 1
);


-- Siparis Tablosu
CREATE TABLE Siparis (
    SiparisID INT PRIMARY KEY IDENTITY(1,1),
    MusteriID INT FOREIGN KEY REFERENCES Musteri(MusteriID),
    RestoranID INT FOREIGN KEY REFERENCES Restoran(RestoranID),
    KuryeID INT FOREIGN KEY REFERENCES Kurye(KuryeID),
    SiparisTarihi DATETIME DEFAULT GETDATE(),
    Durum NVARCHAR(50) DEFAULT 'Hazırlanıyor',
    SiparisTutari DECIMAL(10,2) CHECK (SiparisTutari > 0)
);


-- SiparisDetay Tablosu
CREATE TABLE SiparisDetay (
    DetayID INT PRIMARY KEY IDENTITY(1,1),
    SiparisID INT FOREIGN KEY REFERENCES Siparis(SiparisID),
    UrunID INT FOREIGN KEY REFERENCES Urun(UrunID),
    Adet INT CHECK (Adet > 0),
    ToplamTutar DECIMAL(10,2) -- Trigger ile hesaplanacak
);
GO

-- Trigger: SiparisDetay eklendiğinde ToplamTutar otomatik hesaplanır
CREATE TRIGGER trg_CalcToplamTutar
ON SiparisDetay
AFTER INSERT
AS
BEGIN
    UPDATE sd
    SET ToplamTutar = sd.Adet * u.Fiyat
    FROM SiparisDetay sd
    INNER JOIN Urun u ON sd.UrunID = u.UrunID
    WHERE sd.DetayID IN (SELECT DetayID FROM inserted);
END;
GO

-- AskidaYemek Tablosu
CREATE TABLE AskidaYemek (
    BagisID INT PRIMARY KEY IDENTITY(1,1),
    MusteriID INT FOREIGN KEY REFERENCES Musteri(MusteriID),
    BagisTuru NVARCHAR(20) CHECK (BagisTuru IN ('Yemek','Bakiye')),
    Tutar DECIMAL(10,2) CHECK (Tutar > 0),
    BagisTarihi DATETIME DEFAULT GETDATE(),
    IsActive BIT DEFAULT 1
);
