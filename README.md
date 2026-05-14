# Çevrimiçi Yemek Sipariş Platformu Veritabanı

## Proje Amacı
Gerçek dünya senaryosuna uygun, ölçeklenebilir ve 3NF’e uygun bir veritabanı tasarlamak.  
Müşteri, restoran, kurye ve bağış modüllerini kapsayan bir sistem geliştirilmiştir.

## Tablolar
- **Musteri**: Müşteri bilgileri (MusteriID,Ad, Soyad, Email, Telefon, IsActive)
- **Restoran**: Restoran bilgileri (RestoranID,Ad, Adres, RestoranPuani, ToplamCiro,IsActive)
- **Kurye**: Siparişi teslim eden kişi (KuryeID,Ad,Soyad, Telefon,IsActive)
- **Urun**: Restoran menüsündeki ürünler (UrunAdi, Fiyat, IsActive)
- **Siparis**: Müşteri + Restoran + Kurye ilişkisi (SiparisTarihi, Durum, SiparisTutari, IsAskidaYemek)
- **SiparisDetay**: Siparişin ürünleri (Adet, ToplamTutar)
- **AskidaYemek**: Bağış havuzu (BagisTuru, Tutar, BagisTarihi, IsActive)

## Özel Modül: Askıda Yemek
Müşteriler bağış yapabilir, ihtiyaç sahipleri ücretsiz sipariş verebilir.  
Bağışlar `AskidaYemek` tablosunda tutulur, trigger ile bakiye otomatik düşer.

## SQL Dosyaları
- **CreateTable.sql** → Tabloları oluşturur
- **InsertData.sql** → Test verilerini ekler
- **03_Raporlar.sql** → JOIN, GROUP BY, Subquery sorguları
- **04_GelişmişNesneler.sql** → View, Trigger, Index

## ER Diyagramı
Tüm tablolar ve ilişkiler SSMS Database Diagram özelliği ile çizilmiş, PNG olarak eklenmiştir.

## Yapay Zeka Kullanım Beyanı
SQL hatalarını çözmek ve rapor sorgularını geliştirmek için Microsoft Copilot’tan destek aldım.  
Kodları kendim inceledim ve projeye uygun hale getirdim.
