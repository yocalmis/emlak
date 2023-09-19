-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Anamakine: localhost:3306
-- Üretim Zamanı: 06 Eyl 2023, 16:19:55
-- Sunucu sürümü: 5.6.38
-- PHP Sürümü: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `aktmetal_emlak`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `alt_kategori`
--

CREATE TABLE `alt_kategori` (
  `alt_kategori_id` int(11) NOT NULL,
  `kategori_adi` varchar(225) NOT NULL,
  `ebeveyn` int(11) NOT NULL,
  `seo_adi` varchar(225) NOT NULL,
  `kategori_adi_ar` varchar(225) NOT NULL,
  `kategori_adi_frs` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `ayar`
--

CREATE TABLE `ayar` (
  `id` int(11) NOT NULL,
  `facebook` varchar(225) DEFAULT NULL,
  `twitter` varchar(225) DEFAULT NULL,
  `google` varchar(550) NOT NULL,
  `instagram` varchar(225) NOT NULL,
  `linkedin` varchar(225) NOT NULL,
  `pinterest` varchar(225) NOT NULL,
  `youtube` varchar(225) NOT NULL,
  `email` varchar(225) DEFAULT NULL,
  `email_2` varchar(550) NOT NULL,
  `tel_1` varchar(22) DEFAULT NULL,
  `whatsapp` varchar(225) NOT NULL,
  `tel_2` varchar(22) DEFAULT NULL,
  `fax` varchar(22) DEFAULT NULL,
  `adress` varchar(550) DEFAULT NULL,
  `company_name` varchar(500) DEFAULT NULL,
  `seo_keywords` text,
  `maps` varchar(850) NOT NULL,
  `harita_lat` varchar(225) NOT NULL,
  `harita_lon` varchar(225) NOT NULL,
  `kisa_aciklama` varchar(255) NOT NULL,
  `uzun_aciklama` text NOT NULL,
  `ana_arkaplan` varchar(225) NOT NULL,
  `ana_arkaplan_yazi` varchar(225) NOT NULL,
  `adress_ar` varchar(550) DEFAULT NULL,
  `kisa_aciklama_ar` varchar(550) DEFAULT NULL,
  `uzun_aciklama_ar` text,
  `tel_1_ar` varchar(550) DEFAULT NULL,
  `whatsapp_ar` varchar(225) NOT NULL,
  `tel_2_ar` varchar(550) DEFAULT NULL,
  `fax_ar` varchar(550) DEFAULT NULL,
  `ana_arkaplan_yazi_ar` varchar(225) NOT NULL,
  `anasayfa_description` varchar(255) NOT NULL,
  `anasayfa_description_ar` varchar(255) NOT NULL,
  `contact_description` varchar(255) NOT NULL,
  `contact_description_ar` varchar(255) NOT NULL,
  `proje_description` varchar(255) NOT NULL,
  `proje_description_ar` varchar(255) NOT NULL,
  `news_description` varchar(255) NOT NULL,
  `news_description_ar` varchar(255) NOT NULL,
  `anasayfa_title` varchar(255) NOT NULL,
  `anasayfa_title_ar` varchar(255) NOT NULL,
  `contact_title` varchar(255) NOT NULL,
  `contact_title_ar` varchar(255) NOT NULL,
  `proje_title` varchar(255) NOT NULL,
  `proje_title_ar` varchar(255) NOT NULL,
  `news_title` varchar(255) NOT NULL,
  `news_title_ar` varchar(255) NOT NULL,
  `adress_frs` varchar(550) NOT NULL,
  `kisa_aciklama_frs` varchar(550) NOT NULL,
  `tel_1_frs` varchar(225) NOT NULL,
  `whatsapp_frs` varchar(225) NOT NULL,
  `tel_2_frs` varchar(225) NOT NULL,
  `fax_frs` varchar(225) NOT NULL,
  `ana_arkaplan_yazi_frs` varchar(225) NOT NULL,
  `anasayfa_description_frs` varchar(225) NOT NULL,
  `contact_description_frs` varchar(225) NOT NULL,
  `proje_description_frs` varchar(225) NOT NULL,
  `news_description_frs` varchar(225) NOT NULL,
  `anasayfa_title_frs` varchar(225) NOT NULL,
  `contact_title_frs` varchar(225) NOT NULL,
  `proje_title_frs` varchar(225) NOT NULL,
  `news_title_frs` varchar(225) NOT NULL,
  `uzun_aciklama_frs` text NOT NULL,
  `try_euro` decimal(15,3) NOT NULL,
  `try_dolar` decimal(15,3) NOT NULL,
  `try_ruble` decimal(15,3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `ayar`
--

INSERT INTO `ayar` (`id`, `facebook`, `twitter`, `google`, `instagram`, `linkedin`, `pinterest`, `youtube`, `email`, `email_2`, `tel_1`, `whatsapp`, `tel_2`, `fax`, `adress`, `company_name`, `seo_keywords`, `maps`, `harita_lat`, `harita_lon`, `kisa_aciklama`, `uzun_aciklama`, `ana_arkaplan`, `ana_arkaplan_yazi`, `adress_ar`, `kisa_aciklama_ar`, `uzun_aciklama_ar`, `tel_1_ar`, `whatsapp_ar`, `tel_2_ar`, `fax_ar`, `ana_arkaplan_yazi_ar`, `anasayfa_description`, `anasayfa_description_ar`, `contact_description`, `contact_description_ar`, `proje_description`, `proje_description_ar`, `news_description`, `news_description_ar`, `anasayfa_title`, `anasayfa_title_ar`, `contact_title`, `contact_title_ar`, `proje_title`, `proje_title_ar`, `news_title`, `news_title_ar`, `adress_frs`, `kisa_aciklama_frs`, `tel_1_frs`, `whatsapp_frs`, `tel_2_frs`, `fax_frs`, `ana_arkaplan_yazi_frs`, `anasayfa_description_frs`, `contact_description_frs`, `proje_description_frs`, `news_description_frs`, `anasayfa_title_frs`, `contact_title_frs`, `proje_title_frs`, `news_title_frs`, `uzun_aciklama_frs`, `try_euro`, `try_dolar`, `try_ruble`) VALUES
(1, 'https://www.facebook.com', 'https://www.twitter.com', 'https://google.com', 'https://www.instagram.com', 'https://www.linkedin.com', 'http://www.pinterest.com', 'https://www.youtube.com', 'info@xyz.com', '', '232133131223', '232133131223', '232133131223', NULL, 'Deneme Mahalles xyz sokak trt ap. no 66/4 Sarıyer/İstanbul', 'Yetkili Kişi', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3012.2721492084097!2d28.678553215413086!3d', '37.975707', '23.680678', 'Xyz for sale in Turkey, Cheap Apartments in Alanya - Deneme Firma', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n', '27203-anasayfa-background.png', 'Where Dream Comes Home', 'Deneme Mahallesi, Leylak Sokak, Villa No: 14,  Sarıyer- Istanbul', 'Kısa Açıklama ', '<p>Uzun A&ccedil;ıklama</p>\r\n', '+90535 543 3445', '+90535 543 3445', '+90535 543 3445', '+90535 543 3445', 'türkçe', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has su', '', '', '', '', '', '', '', 'Xyz for sale in Turkey, Cheap Apartments in Alanya - Deneme Firma', '', '', '', '', '', '', '', 'Deneme Mahallesi, Leylak Sokak, Villa No: 14,  Sarıyer - Istanbul', 'Deneme Açıklama Rusça', '+90534 356 45 22', '+90534 356 45 22', '+90534 356 45 22', '+90534 356 45 22', 'rusça', '', '', '', '', '', '', '', '', '<p>Rus&ccedil;aRus&ccedil;aRus&ccedil;aRus&ccedil;aRus&ccedil;aRus&ccedil;aRus&ccedil;a</p>\r\n\r\n<p>Rus&ccedil;aRus&ccedil;aRus&ccedil;aRus&ccedil;aRus&ccedil;aRus&ccedil;aRus&ccedil;aRus&ccedil;aRus&ccedil;aRus&ccedil;a</p>\r\n\r\n<p>Rus&ccedil;aRus&ccedil;aRus&ccedil;aRus&ccedil;aRus&ccedil;aRus&ccedil;aRus&ccedil;aRus&ccedil;aRus&ccedil;aRus&ccedil;aRus&ccedil;aRus&ccedil;a</p>\r\n', '0.049', '0.053', '3.640');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `dil`
--

CREATE TABLE `dil` (
  `id` int(11) NOT NULL,
  `adi` varchar(225) NOT NULL,
  `en` varchar(225) NOT NULL,
  `ar` varchar(225) NOT NULL,
  `frs` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `dil`
--

INSERT INTO `dil` (`id`, `adi`, `en`, `ar`, `frs`) VALUES
(1, 'menu_1', 'TURKEY PROPERTIES', 'TÜRKİYE EMLAK', 'НЕДВИЖИМОСТЬ В ТУРЦИИ'),
(2, 'menu_2', 'ABOUT US', 'HAKKIMIZDA', 'О НАС'),
(3, 'menu_3', 'BUYER GUIDE', 'ALICI REHBERİ', 'РУКОВОДСТВО ПОКУПАТЕЛЯ'),
(4, 'menu_4', 'NEWS', 'HABERLER', 'НОВОСТИ'),
(5, 'menu_5', 'CONTACT US', 'İLETİŞİM', 'КОНТАКТ'),
(6, 'menu_6', 'CONTACT US', 'İLETİŞİM', 'КОНТАКТ'),
(7, 'ana_manset', 'Where Dream Comes Home', 'HAYALLERİNİZ GERÇEĞE DÖNÜŞÜYOR', 'ВАШИ МЕЧТЫ ПРЕВРАЩАЮТСЯ В РЕАЛЬНОСТЬ'),
(8, 'search_1', 'SEARCH PROJECTS', 'PROJE ARA', 'ПОИСК ПРОЕКТА'),
(9, 'search_2', 'CITY', 'ŞEHİR', 'ГОРОД'),
(10, 'search_3', 'PROPERTY TYPE', 'ÖZELLİK TİPİ', 'ТИП НЕДВИЖИМОСТИ'),
(11, 'search_4', 'UNIT TYPE', 'ÜNİTE TİPİ', 'ТИП БЛОКА'),
(12, 'search_5', 'FEATURES', 'ÖZELLİKLER', 'ОСОБЕННОСТИ'),
(13, 'search_6', 'SEARCH', 'ARA', 'ПОИСК'),
(14, 'ana_fav_prj', 'FAVORITE PROJECTS', 'FAVORİ PROJELER', 'ЛЮБИМЫЕ ПРОЕКТЫ'),
(15, 'ana_services', 'SERVICES', 'HİZMETLER', 'СЕРВИСЫ'),
(16, 'ana_prj', 'PROJECTS', 'PROJELER', 'ПРОЕКТЫ'),
(17, 'ana_yorum', 'SALES', 'SATIŞTAKİLER', 'В ПРОДАЖЕ'),
(18, 'ana_new_prj', 'NEW PROJECTS', 'YENİ PROJELER', 'НОВЫЕ ПРОЕКТЫ'),
(19, 'ana_new_prj_yazi', 'LATEST REAL ESTATE PROJECTS IN TURKEY', 'SON EMLAK PROJELERİ', 'ПОСЛЕДНИЕ ПРОЕКТЫ НЕДВИЖИМОСТИ В ТУРЦИИ'),
(20, 'lets_call', 'LET\'S CALL YOU', 'SİZİ ARAYALIM', ' ПОЗВОНИМ ВАМ'),
(21, 'lets_call_aciklama', 'Please fill in the form below and we will get in touch with you shortly', 'Lütfen iletişim formunu doldurun, sizinle en kısa sürede iletişime geçeceğiz.', 'Пожалуйста, заполните форму ниже, и мы свяжемся с вами в ближайшее время'),
(22, 'msg_1', 'FULL NAME', 'TAM ADI', 'ФИО'),
(23, 'msg_2', 'EMAIL ADRESS', 'EMAİL ADRESİ', 'ЭЛЕКТРОННЫЙ АДРЕС'),
(24, 'msg_3', 'PHONE NUMBER', 'TELEFON NUMARASI', 'НОМЕР ТЕЛЕФОНА'),
(25, 'msg_4', 'SEND', 'GÖNDER', 'ОТПРАВИТЬ'),
(26, 'msg_5', 'MESSAGE', 'MESAJ', 'СООБЩЕНИЕ'),
(27, 'call_center', 'CALL CENTER', 'ÇAĞRI MERKEZİ', 'КОЛЛ-ЦЕНТР'),
(28, 'call_center_aciklama', 'Here are the numbers you can directly reach us', 'Direk ulaşabileceğiniz iletişim numaramız', 'номера, по которым вы можете напрямую связаться с нами'),
(29, 'phone_number', 'PHONE NUMBER', 'TELEFON NUMARASI', 'НОМЕР ТЕЛЕФОНА'),
(30, 'whatsapp_help', 'WHATSHAPP HELP', 'WHATSAPP YARDIM', 'ПОМОЩЬ ПО ВАТСАП'),
(31, 'footer_1', 'QUICK LINKS', 'HIZLI LİNKLER', 'БЫСТРЫЕ ССЫЛКИ'),
(32, 'footer_2', 'USEFUL LINKS', 'KULLANIŞLI LİNKLER', 'ПОЛЕЗНЫЕ ССЫЛКИ'),
(33, 'about_manset_yazi', 'Where Dream Comes Home', 'Hayalleriniz gerçeğe dönüşüyor', 'Ваши мечты сбываются'),
(34, 'about_why', 'WHY CHOOSE US?', 'NEDEN BİZİ SEÇMELİSİNİZ?', 'ПОЧЕМУ НУЖНО ВЫБРАТЬ НАС?'),
(35, 'contact_1', 'SPOKEN LANGUAGES', 'KONUŞULAN DİLLER', 'РАЗГОВОРНЫЕ ЯЗЫКИ'),
(36, 'contact_manset', 'Where Dream Comes Home', 'Hayalleriniz gerçeğe dönüşüyor', 'Ваши мечты сбываются'),
(37, 'kategori_1', 'SHOW MORE', 'DAHA FAZLA', 'ПОКАЗАТЬ БОЛЬШЕ'),
(38, 'kategori_manset_yazi', 'Where Dream Comes Home', 'Hayalleriniz gerçeğe dönüşüyor', 'Ваши мечты сбываются'),
(39, 'haber_manset_yazi', 'Where Dream Comes Home', 'Hayalleriniz gerçeğe dönüşüyor', 'Ваши мечты сбываются'),
(40, 'maps', 'In View Maps Location:', 'Harita Konumu', 'Местоположение на картах просмотра'),
(41, 'proje_1', 'PROJECT TYPES', 'PROJE ÖZELLİKLERİ', 'ОСОБЕННОСТИ ПРОЕКТА'),
(42, 'proje_2', 'AVAILABLE UNIT TYPES', 'UYGUN ÖZELLİKLER', 'ДОСТУПНЫЕ ТИПЫ УСТАНОВОК'),
(43, 'proje_3', 'PROJECT OVERVIEW', 'AÇIKLAMA', 'ОПИСАНИЕ'),
(44, 'proje_4', 'DELIVERY DATE', 'TESLİM TARİHİ', 'ДАТА ДОСТАВКИ'),
(45, 'proje_5', 'MIN PRICE', 'MİNİMUM FİYAT', 'МИНИМАЛЬНАЯ ЦЕНА'),
(46, 'proje_6', 'MAX PRICE', 'MAKSİMUM FİYAT', 'МАКСИМАЛЬНАЯ ЦЕНА'),
(47, 'proje_7', 'PROJECT STATUS', 'DURUMU', 'СТАТУС ПРОЕКТА'),
(48, 'proje_8', 'TOTAL APARTMENTS', 'TOPLAM DAİRE', 'ВСЕГО КВАРТИР'),
(49, 'proje_9', 'TOTAL CAR PARK', 'OTOPARK KAPASİTESİ', 'ПАРКОВКА'),
(50, 'proje_10', 'TOTAL LAND SIZE', 'TOPLAM ARSA ALANI', 'ОБЩАЯ ПЛОЩАДЬ ЗЕМЛИ'),
(51, 'proje_11', 'MIN M²', 'MİNİMUM M2', 'МИНИМУМ М2'),
(52, 'proje_12', 'MAX M² ', 'MAKSİMUM M2', 'МАКСИМУМ М2'),
(53, 'proje_13', 'DESCRIPTION', 'AÇIKLAMA', 'ОПИСАНИЕ'),
(54, 'proje_14', 'FEATURES', 'ÖZELLİKLER', 'ОСОБЕННОСТИ'),
(55, 'proje_15', 'LOCATION', 'KONUM', 'РАСПОЛОЖЕНИЕ'),
(56, 'proje_air', 'AIRPORT', 'HAVALİMANI', 'АЭРОПОРТ'),
(57, 'proje_avm', 'AVM SHOPPING', 'AVM', 'торговый центр'),
(58, 'proje_e5', 'E5 HIGHWAY', 'OTOYOL', 'АВТОМАГИСТРАЛЬ'),
(59, 'proje_hos', 'HOSPITAL', 'HASTANE', 'БОЛЬНИЦА'),
(60, 'proje_metro', 'METRO STATION', 'METRO', 'МЕТРО'),
(61, 'proje_par', 'PARKING', 'OTOPARK', 'АВТОПАРК'),
(62, 'proje_station', 'STATION', 'TREN İSTASYONU', 'ЖЕЛЕЗНОДОРОЖНАЯ СТАНЦИЯ'),
(63, 'proje_uni', 'UNIVERSITY', 'ÜNİVERSİTE', 'УНИВЕРСИТЕТ'),
(64, 'proje_similar', 'SIMILAR PROJECTS', 'BENZER PROJELER', 'ПОХОЖИЕ ПРОЕКТЫ'),
(65, 'haber_similar', 'SIMILAR NEWS', 'BENZER HABERLER', 'ПОХОЖИЕ НОВОСТИ'),
(66, 'ana_all_view', 'VIEW ALL', 'TÜMÜNÜ GÖR', 'УВИДЕТЬ ВСЕ'),
(68, 'home', 'HOME', 'ANASAYFA', 'ГЛАВНАЯ СТРАНИЦА'),
(69, 'footer_alt', 'EMLAK DANIŞMANLIĞI', 'EMLAK DANIŞMANLIĞI', 'КОНСАЛТИНГ ПО НЕДВИЖИМОСТИ'),
(70, 'footer_alt', 'EMLAK DANIŞMANLIĞI', 'EMLAK DANIŞMANLIĞI', 'КОНСАЛТИНГ ПО НЕДВИЖИМОСТИ'),
(71, 'mission', 'OUR MISSION', 'MİSYONUMUZ', 'НАША МИССИЯ'),
(72, 'vision', 'OUR VISION', 'VİZYONUMUZ', 'НАШ ВЗГЛЯД'),
(73, 'prev', 'Previous', 'Geri', 'Назад'),
(74, 'next', 'next', 'İleri', 'Вперед'),
(75, 'proje_loc_det', 'LOCATION DETAILS', 'KONUM DETAYLARI', 'ДЕТАЛИ МЕСТОПОЛОЖЕНИЯ'),
(76, 'details', 'DETAILS', 'DETAYLAR', 'ДЕТАЛИ'),
(77, 'kategori_baslik_1', 'ALL REAL ESTATE PROJECTS', 'TÜM EMLAK İLANLARI', 'ВСЕ ОБЪЯВЛЕНИЯ О НЕДВИЖИМОСТИ'),
(78, 'kategori_baslik_2', 'IN TURKEY', 'TÜRKİYE\'DE', 'В ТУРЦИИ'),
(79, 'buyer_guide', 'BUYER GUIDE', 'REHBER', 'СПРАВОЧНИК'),
(80, 'buyer_guide_seo', 'buyer_guide', 'buyer_guide', '\'Руководство покупателя'),
(81, 'buyer_guide_kucuk', 'Buyer Guide', 'Rehber', 'Руководство покупателя'),
(82, 'real_est', 'REAL ESTATE TURKEY', 'EMLAK TÜRKİYE', 'НЕДВИЖИМОСТЬ В ТУРЦИИ'),
(83, 'bread_ana', 'HOME', 'ANASAYFA', 'ГЛАВНАЯ СТРАНИЦА'),
(84, 'bread_abo', 'ABOUT US', 'HAKKIMIZDA', 'О НАС'),
(85, 'bread_iletisim', 'CONTACT', 'İLETİŞİM', 'КОНТАКТ'),
(86, 'bread_projects', 'PROJECTS', 'PROJELER', 'ПРОЕКТЫ'),
(87, 'bread_news', 'NEWS', 'HABERLER', 'НОВОСТИ'),
(88, 'arama_manset', 'Where Dream Comes Home', 'Hayalleriniz gerçeğe dönüşüyor', 'Ваши мечты сбываются'),
(89, 'arama_search', 'SEARCH', 'ARA', 'ПОИСК'),
(90, 'arama_filter', 'PROJECT FILTER', 'PROJE FİLTRELE', 'ФИЛЬТР ПРОЕКТОВ'),
(91, 'arama_city', 'CITY', 'ŞEHİR', 'ГОРОД'),
(92, 'arama_tip', 'PROJECT TYPE', 'TİPİ', 'ТИП ПРОЕКТА'),
(93, 'arama_region', 'UNIT TYPE', 'ODA', 'ТИП БЛОКА'),
(94, 'arama_feat', 'FEATURES', 'ÖZELLİKLER', 'ОСОБЕННОСТИ'),
(95, 'ana_prj_kck', 'Projects', 'PROJELER', 'ПРОЕКТЫ'),
(96, 'search_7', 'MIN BEDROOM', 'MİNİMUM YATAK ODASI', 'МИНИМАЛЬНАЯ СПАЛЬНЯ'),
(97, 'search_8', 'MAX PRICE', 'MAKSİMUM FİYAT', 'МАКСИМАЛЬНАЯ ЦЕНА'),
(98, 'price', 'STARTING PRICE', 'BAŞLANGIÇ FİYATI', 'СТАРТОВАЯ ЦЕНА'),
(99, 'kat_baslik_alan_1', '', '', 'этаж-заголовок-область'),
(100, 'kat_baslik_alan_2', 'ALL REAL ESTATE PROJECTS IN', 'TÜRKİYE\'DE Kİ TÜM EMLAK İLANLARI', 'ВСЕ ОБЪЯВЛЕНИЯ О НЕДВИЖИМОСТИ В ТУРЦИИ'),
(101, 'footer_3', 'TURKISH CITIZENSHIP', 'VATANDAŞLIK', 'ГРАЖДАНСТВО'),
(102, 'menu_7', 'FOR RENT', 'KİRALA', 'АРЕНДА'),
(103, 'menu_8', 'FOR SALE', 'SATIN AL', 'ПРОДАЕТСЯ'),
(104, 'menu_9', 'APARTMENT', 'DAİRE', 'КВАРТИРА'),
(105, 'menu_10', 'VILLA', 'VİLLA', 'ВИЛЛА'),
(106, 'menu_11', 'PROJECT', 'PROJE', 'ПРОЕКТ'),
(107, 'menu_12', 'LAND', 'ARSA', 'ЗЕМЕЛЬНЫЕ УЧАСТКИ'),
(108, 'menu_13', 'CITIES', 'ŞEHİRLER', 'ГОРОДА'),
(109, 'ana_aprt', 'APARTMENTS', 'DAİRE', 'КВАРТИРЫ'),
(110, 'ana_new_eml', 'New Estates', 'Yeni İlanlar', 'НОВЫЕ ПОМЕСТЬЯ'),
(111, 'proje_emlak', 'ESTATES OF PROJECT', 'PROJENİN EMLAKLARI', 'НЕДВИЖИМОСТИ ПРОЕКТА'),
(112, 'proje_indir_buyuk', 'DOWNLOAD', 'İNDİR', 'СКАЧАТЬ'),
(113, 'proje_indir_kucuk', 'download', 'indir', 'СКАЧАТЬ'),
(114, 'kat_sayisi', 'FLOOR NUMBER', 'KAT SAYISI', 'НОМЕР ЭТАЖА'),
(115, 'balkon', 'BALCONY', 'BALKON', 'БАЛКОН'),
(116, 'prc', 'PRICE', 'FİYAT', 'ЦЕНА'),
(117, 'm_2', 'm2', 'm2', 'm2'),
(118, 'ana_services_2', 'THE SERVICES PROVIDED BY US', 'TARAFIMIZDAN VERİLEN HİZMETLER', 'УСЛУГИ, ПРЕДОСТАВЛЯЕМЫЕ НАМИ');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `haber`
--

CREATE TABLE `haber` (
  `haber_id` int(11) NOT NULL,
  `baslik` varchar(225) NOT NULL,
  `icerik` text NOT NULL,
  `kategori_id` int(11) NOT NULL,
  `seo_adi` varchar(225) NOT NULL,
  `tarih` date NOT NULL,
  `tarih_ar` date NOT NULL,
  `resim` varchar(225) NOT NULL,
  `banner_1` varchar(225) NOT NULL,
  `banner_2` varchar(225) NOT NULL,
  `resim_alt` varchar(225) NOT NULL,
  `resim_title` varchar(225) NOT NULL,
  `banner_1_alt` varchar(225) NOT NULL,
  `banner_1_title` varchar(225) NOT NULL,
  `banner_2_alt` varchar(225) NOT NULL,
  `banner_2_title` varchar(225) NOT NULL,
  `baslik_ar` varchar(550) DEFAULT NULL,
  `icerik_ar` text,
  `manset` int(11) NOT NULL,
  `haber_sayfa_manset` int(11) NOT NULL,
  `haber_sayfa_manset_buyuk` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `description_ar` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `title_ar` varchar(255) NOT NULL,
  `tarih_frs` date NOT NULL,
  `baslik_frs` varchar(225) NOT NULL,
  `icerik_frs` text NOT NULL,
  `description_frs` varchar(225) NOT NULL,
  `title_frs` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `haber`
--

INSERT INTO `haber` (`haber_id`, `baslik`, `icerik`, `kategori_id`, `seo_adi`, `tarih`, `tarih_ar`, `resim`, `banner_1`, `banner_2`, `resim_alt`, `resim_title`, `banner_1_alt`, `banner_1_title`, `banner_2_alt`, `banner_2_title`, `baslik_ar`, `icerik_ar`, `manset`, `haber_sayfa_manset`, `haber_sayfa_manset_buyuk`, `description`, `description_ar`, `title`, `title_ar`, `tarih_frs`, `baslik_frs`, `icerik_frs`, `description_frs`, `title_frs`) VALUES
(325, 'BaŞLIK', '<p>İngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erik</p>\r\n\r\n<p>İngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erik</p>\r\n\r\n<p>İngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erik</p>\r\n', 9, 'baslik', '2022-12-21', '2022-12-21', '34ef2-hb1.jpg', '31c0c-hb2.jpg', 'a376b-hb3.jpg', '', '', '', '', '', '', 'bAŞLIK TR', '<p>t&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erik</p>\r\n\r\n<p>t&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erik</p>\r\n\r\n<p>t&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erik</p>\r\n', 1, 1, 1, '', '', '', '', '2022-12-21', 'Başlık Rusça', '<p>İ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;a</p>\r\n\r\n<p>İ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;a</p>\r\n\r\n<p>İ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;a</p>\r\n\r\n<p>İ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;a</p>\r\n', '', ''),
(327, 'BaŞLIK 2', '<p>İngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erik</p>\r\n\r\n<p>İngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erik</p>\r\n\r\n<p>İngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erik</p>\r\n', 9, 'basliK-2', '2022-12-21', '2022-12-21', '34ef2-hb1.jpg', '31c0c-hb2.jpg', 'a376b-hb3.jpg', '', '', '', '', '', '', 'bAŞLIK TR', '<p>t&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erik</p>\r\n\r\n<p>t&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erik</p>\r\n\r\n<p>t&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erik</p>\r\n', 1, 1, 1, '', '', '', '', '2022-12-21', 'Başlık Rusça', '<p>İ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;a</p>\r\n\r\n<p>İ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;a</p>\r\n\r\n<p>İ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;a</p>\r\n\r\n<p>İ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;a</p>\r\n', '', ''),
(328, 'BaŞLIK 3', '<p>İngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erik</p>\r\n\r\n<p>İngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erik</p>\r\n\r\n<p>İngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erik</p>\r\n', 9, 'baslik-3', '2022-12-21', '2022-12-21', '34ef2-hb1.jpg', '31c0c-hb2.jpg', 'a376b-hb3.jpg', '', '', '', '', '', '', 'bAŞLIK TR', '<p>t&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erik</p>\r\n\r\n<p>t&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erik</p>\r\n\r\n<p>t&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erik</p>\r\n', 1, 1, 1, '', '', '', '', '2022-12-21', 'Başlık Rusça', '<p>İ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;a</p>\r\n\r\n<p>İ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;a</p>\r\n\r\n<p>İ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;a</p>\r\n\r\n<p>İ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;a</p>\r\n', '', ''),
(329, 'BaŞLIK 4', '<p>İngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erik</p>\r\n\r\n<p>İngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erik</p>\r\n\r\n<p>İngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erik</p>\r\n', 9, 'baslik-4', '2022-12-21', '2022-12-21', '34ef2-hb1.jpg', '31c0c-hb2.jpg', 'a376b-hb3.jpg', '', '', '', '', '', '', 'bAŞLIK TR', '<p>t&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erik</p>\r\n\r\n<p>t&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erik</p>\r\n\r\n<p>t&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erik</p>\r\n', 1, 1, 1, '', '', '', '', '2022-12-21', 'Başlık Rusça', '<p>İ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;a</p>\r\n\r\n<p>İ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;a</p>\r\n\r\n<p>İ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;a</p>\r\n\r\n<p>İ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;a</p>\r\n', '', ''),
(330, 'BaŞLIK 5', '<p>İngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erik</p>\r\n\r\n<p>İngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erik</p>\r\n\r\n<p>İngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erik</p>\r\n', 9, 'baslik-5', '2022-12-21', '2022-12-21', '34ef2-hb1.jpg', '31c0c-hb2.jpg', 'a376b-hb3.jpg', '', '', '', '', '', '', 'bAŞLIK TR', '<p>t&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erik</p>\r\n\r\n<p>t&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erik</p>\r\n\r\n<p>t&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erik</p>\r\n', 1, 1, 1, '', '', '', '', '2022-12-21', 'Başlık Rusça', '<p>İ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;a</p>\r\n\r\n<p>İ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;a</p>\r\n\r\n<p>İ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;a</p>\r\n\r\n<p>İ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;a</p>\r\n', '', ''),
(331, 'BaŞLIKK ', '<p>İngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erik</p>\r\n\r\n<p>İngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erik</p>\r\n\r\n<p>İngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erik</p>\r\n', 11, 'baslikk', '2022-12-21', '2022-12-21', '34ef2-hb1.jpg', '31c0c-hb2.jpg', 'a376b-hb3.jpg', '', '', '', '', '', '', 'bAŞLIK TR', '<p>t&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erik</p>\r\n\r\n<p>t&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erik</p>\r\n\r\n<p>t&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erik</p>\r\n', 1, 1, 1, '', '', '', '', '2022-12-21', 'Başlık Rusça', '<p>İ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;a</p>\r\n\r\n<p>İ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;a</p>\r\n\r\n<p>İ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;a</p>\r\n\r\n<p>İ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;a</p>\r\n', '', ''),
(332, 'BaŞLIKK 2', '<p>İngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erik</p>\r\n\r\n<p>İngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erik</p>\r\n\r\n<p>İngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erik</p>\r\n', 11, 'baslikk-2', '2022-12-21', '2022-12-21', '34ef2-hb1.jpg', '31c0c-hb2.jpg', 'a376b-hb3.jpg', '', '', '', '', '', '', 'bAŞLIK TR', '<p>t&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erik</p>\r\n\r\n<p>t&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erik</p>\r\n\r\n<p>t&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erik</p>\r\n', 1, 1, 1, '', '', '', '', '2022-12-21', 'Başlık Rusça', '<p>İ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;a</p>\r\n\r\n<p>İ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;a</p>\r\n\r\n<p>İ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;a</p>\r\n\r\n<p>İ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;a</p>\r\n', '', ''),
(333, 'BaŞLIKK 3', '<p>İngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erik</p>\r\n\r\n<p>İngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erik</p>\r\n\r\n<p>İngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erik</p>\r\n', 11, 'baslikk-3', '2022-12-21', '2022-12-21', '34ef2-hb1.jpg', '31c0c-hb2.jpg', 'a376b-hb3.jpg', '', '', '', '', '', '', 'bAŞLIK TR', '<p>t&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erik</p>\r\n\r\n<p>t&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erik</p>\r\n\r\n<p>t&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erik</p>\r\n', 1, 1, 1, '', '', '', '', '2022-12-21', 'Başlık Rusça', '<p>İ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;a</p>\r\n\r\n<p>İ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;a</p>\r\n\r\n<p>İ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;a</p>\r\n\r\n<p>İ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;a</p>\r\n', '', ''),
(334, 'BaŞLIKK 4', '<p>İngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erik</p>\r\n\r\n<p>İngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erik</p>\r\n\r\n<p>İngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erik</p>\r\n', 11, 'baslikk-4', '2022-12-21', '2022-12-21', '34ef2-hb1.jpg', '31c0c-hb2.jpg', 'a376b-hb3.jpg', '', '', '', '', '', '', 'bAŞLIK TR', '<p>t&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erik</p>\r\n\r\n<p>t&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erik</p>\r\n\r\n<p>t&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erik</p>\r\n', 1, 1, 1, '', '', '', '', '2022-12-21', 'Başlık Rusça', '<p>İ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;a</p>\r\n\r\n<p>İ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;a</p>\r\n\r\n<p>İ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;a</p>\r\n\r\n<p>İ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;a</p>\r\n', '', ''),
(335, 'BaŞLIKK 5', '<p>İngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erik</p>\r\n\r\n<p>İngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erik</p>\r\n\r\n<p>İngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erik</p>\r\n', 11, 'baslikk-5', '2022-12-21', '2022-12-21', '34ef2-hb1.jpg', '31c0c-hb2.jpg', 'a376b-hb3.jpg', '', '', '', '', '', '', 'bAŞLIK TR', '<p>t&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erik</p>\r\n\r\n<p>t&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erik</p>\r\n\r\n<p>t&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erik</p>\r\n', 1, 1, 1, '', '', '', '', '2022-12-21', 'Başlık Rusça', '<p>İ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;a</p>\r\n\r\n<p>İ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;a</p>\r\n\r\n<p>İ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;a</p>\r\n\r\n<p>İ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;a</p>\r\n', '', ''),
(336, 'BaŞLIKKk ', '<p>İngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erik</p>\r\n\r\n<p>İngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erik</p>\r\n\r\n<p>İngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erik</p>\r\n', 12, 'baslikkk', '2022-12-21', '2022-12-21', '34ef2-hb1.jpg', '31c0c-hb2.jpg', 'a376b-hb3.jpg', '', '', '', '', '', '', 'bAŞLIK TR', '<p>t&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erik</p>\r\n\r\n<p>t&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erik</p>\r\n\r\n<p>t&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erik</p>\r\n', 1, 1, 1, '', '', '', '', '2022-12-21', 'Başlık Rusça', '<p>İ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;a</p>\r\n\r\n<p>İ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;a</p>\r\n\r\n<p>İ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;a</p>\r\n\r\n<p>İ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;a</p>\r\n', '', ''),
(337, 'BaŞLIKKk 2', '<p>İngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erik</p>\r\n\r\n<p>İngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erik</p>\r\n\r\n<p>İngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erik</p>\r\n', 12, 'baslikkk-2', '2022-12-21', '2022-12-21', '34ef2-hb1.jpg', '31c0c-hb2.jpg', 'a376b-hb3.jpg', '', '', '', '', '', '', 'bAŞLIK TR', '<p>t&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erik</p>\r\n\r\n<p>t&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erik</p>\r\n\r\n<p>t&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erik</p>\r\n', 1, 1, 1, '', '', '', '', '2022-12-21', 'Başlık Rusça', '<p>İ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;a</p>\r\n\r\n<p>İ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;a</p>\r\n\r\n<p>İ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;a</p>\r\n\r\n<p>İ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;a</p>\r\n', '', ''),
(338, 'BaŞLIKKk 3', '<p>İngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erik</p>\r\n\r\n<p>İngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erik</p>\r\n\r\n<p>İngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erik</p>\r\n', 12, 'baslikkk-3', '2022-12-21', '2022-12-21', '34ef2-hb1.jpg', '31c0c-hb2.jpg', 'a376b-hb3.jpg', '', '', '', '', '', '', 'bAŞLIK TR', '<p>t&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erik</p>\r\n\r\n<p>t&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erik</p>\r\n\r\n<p>t&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erik</p>\r\n', 1, 1, 1, '', '', '', '', '2022-12-21', 'Başlık Rusça', '<p>İ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;a</p>\r\n\r\n<p>İ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;a</p>\r\n\r\n<p>İ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;a</p>\r\n\r\n<p>İ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;a</p>\r\n', '', ''),
(339, 'BaŞLIKKk 4', '<p>İngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erik</p>\r\n\r\n<p>İngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erik</p>\r\n\r\n<p>İngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erik</p>\r\n', 12, 'baslikkk-4', '2022-12-21', '2022-12-21', '34ef2-hb1.jpg', '31c0c-hb2.jpg', 'a376b-hb3.jpg', '', '', '', '', '', '', 'bAŞLIK TR', '<p>t&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erik</p>\r\n\r\n<p>t&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erik</p>\r\n\r\n<p>t&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erik</p>\r\n', 1, 1, 1, '', '', '', '', '2022-12-21', 'Başlık Rusça', '<p>İ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;a</p>\r\n\r\n<p>İ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;a</p>\r\n\r\n<p>İ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;a</p>\r\n\r\n<p>İ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;a</p>\r\n', '', ''),
(340, 'BaŞLIKKk 5', '<p>İngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erik</p>\r\n\r\n<p>İngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erik</p>\r\n\r\n<p>İngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erik</p>\r\n', 12, 'baslikkk-5', '2022-12-21', '2022-12-21', '34ef2-hb1.jpg', '31c0c-hb2.jpg', 'a376b-hb3.jpg', '', '', '', '', '', '', 'bAŞLIK TR', '<p>t&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erik</p>\r\n\r\n<p>t&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erik</p>\r\n\r\n<p>t&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erik</p>\r\n', 1, 1, 1, '', '', '', '', '2022-12-21', 'Başlık Rusça', '<p>İ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;a</p>\r\n\r\n<p>İ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;a</p>\r\n\r\n<p>İ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;a</p>\r\n\r\n<p>İ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;a</p>\r\n', '', ''),
(341, 'BaŞLIKKkk ', '<p>İngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erik</p>\r\n\r\n<p>İngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erik</p>\r\n\r\n<p>İngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erik</p>\r\n', 13, 'baslikkkk', '2022-12-21', '2022-12-21', '34ef2-hb1.jpg', '31c0c-hb2.jpg', 'a376b-hb3.jpg', '', '', '', '', '', '', 'bAŞLIK TR', '<p>t&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erik</p>\r\n\r\n<p>t&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erik</p>\r\n\r\n<p>t&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erik</p>\r\n', 1, 1, 1, '', '', '', '', '2022-12-21', 'Başlık Rusça', '<p>İ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;a</p>\r\n\r\n<p>İ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;a</p>\r\n\r\n<p>İ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;a</p>\r\n\r\n<p>İ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;a</p>\r\n', '', ''),
(342, 'BaŞLIKKkk 2', '<p>İngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erik</p>\r\n\r\n<p>İngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erik</p>\r\n\r\n<p>İngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erik</p>\r\n', 13, 'baslikkkk-2', '2022-12-21', '2022-12-21', '34ef2-hb1.jpg', '31c0c-hb2.jpg', 'a376b-hb3.jpg', '', '', '', '', '', '', 'bAŞLIK TR', '<p>t&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erik</p>\r\n\r\n<p>t&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erik</p>\r\n\r\n<p>t&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erik</p>\r\n', 1, 1, 1, '', '', '', '', '2022-12-21', 'Başlık Rusça', '<p>İ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;a</p>\r\n\r\n<p>İ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;a</p>\r\n\r\n<p>İ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;a</p>\r\n\r\n<p>İ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;a</p>\r\n', '', ''),
(343, 'BaŞLIKKkk 3', '<p>İngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erik</p>\r\n\r\n<p>İngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erik</p>\r\n\r\n<p>İngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erik</p>\r\n', 13, 'baslikkkk-3', '2022-12-21', '2022-12-21', '34ef2-hb1.jpg', '31c0c-hb2.jpg', 'a376b-hb3.jpg', '', '', '', '', '', '', 'bAŞLIK TR', '<p>t&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erik</p>\r\n\r\n<p>t&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erik</p>\r\n\r\n<p>t&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erik</p>\r\n', 1, 1, 1, '', '', '', '', '2022-12-21', 'Başlık Rusça', '<p>İ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;a</p>\r\n\r\n<p>İ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;a</p>\r\n\r\n<p>İ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;a</p>\r\n\r\n<p>İ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;a</p>\r\n', '', ''),
(344, 'BaŞLIKKkk 4', '<p>İngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erik</p>\r\n\r\n<p>İngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erik</p>\r\n\r\n<p>İngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erik</p>\r\n', 13, 'baslikkkk-4', '2022-12-21', '2022-12-21', '34ef2-hb1.jpg', '31c0c-hb2.jpg', 'a376b-hb3.jpg', '', '', '', '', '', '', 'bAŞLIK TR', '<p>t&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erik</p>\r\n\r\n<p>t&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erik</p>\r\n\r\n<p>t&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erik</p>\r\n', 1, 1, 1, '', '', '', '', '2022-12-21', 'Başlık Rusça', '<p>İ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;a</p>\r\n\r\n<p>İ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;a</p>\r\n\r\n<p>İ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;a</p>\r\n\r\n<p>İ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;a</p>\r\n', '', ''),
(345, 'BaŞLIKKkk 5', '<p>İngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erik</p>\r\n\r\n<p>İngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erik</p>\r\n\r\n<p>İngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erik</p>\r\n', 13, 'baslikkkk-5', '2022-12-21', '2022-12-21', '34ef2-hb1.jpg', '31c0c-hb2.jpg', 'a376b-hb3.jpg', '', '', '', '', '', '', 'bAŞLIK TR', '<p>t&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erik</p>\r\n\r\n<p>t&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erik</p>\r\n\r\n<p>t&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erik</p>\r\n', 1, 1, 1, '', '', '', '', '2022-12-21', 'Başlık Rusça', '<p>İ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;a</p>\r\n\r\n<p>İ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;a</p>\r\n\r\n<p>İ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;a</p>\r\n\r\n<p>İ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;a</p>\r\n', '', ''),
(346, 'BaŞLKK ', '<p>İngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erik</p>\r\n\r\n<p>İngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erik</p>\r\n\r\n<p>İngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erik</p>\r\n', 14, 'baslkkkk', '2022-12-21', '2022-12-21', '34ef2-hb1.jpg', '31c0c-hb2.jpg', 'a376b-hb3.jpg', '', '', '', '', '', '', 'bAŞLIK TR', '<p>t&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erik</p>\r\n\r\n<p>t&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erik</p>\r\n\r\n<p>t&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erik</p>\r\n', 1, 1, 1, '', '', '', '', '2022-12-21', 'Başlık Rusça', '<p>İ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;a</p>\r\n\r\n<p>İ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;a</p>\r\n\r\n<p>İ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;a</p>\r\n\r\n<p>İ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;a</p>\r\n', '', ''),
(347, 'BaŞLKK 2', '<p>İngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erik</p>\r\n\r\n<p>İngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erik</p>\r\n\r\n<p>İngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erik</p>\r\n', 14, 'baslkkkk-2', '2022-12-21', '2022-12-21', '34ef2-hb1.jpg', '31c0c-hb2.jpg', 'a376b-hb3.jpg', '', '', '', '', '', '', 'bAŞLIK TR', '<p>t&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erik</p>\r\n\r\n<p>t&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erik</p>\r\n\r\n<p>t&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erik</p>\r\n', 1, 1, 1, '', '', '', '', '2022-12-21', 'Başlık Rusça', '<p>İ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;a</p>\r\n\r\n<p>İ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;a</p>\r\n\r\n<p>İ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;a</p>\r\n\r\n<p>İ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;a</p>\r\n', '', '');
INSERT INTO `haber` (`haber_id`, `baslik`, `icerik`, `kategori_id`, `seo_adi`, `tarih`, `tarih_ar`, `resim`, `banner_1`, `banner_2`, `resim_alt`, `resim_title`, `banner_1_alt`, `banner_1_title`, `banner_2_alt`, `banner_2_title`, `baslik_ar`, `icerik_ar`, `manset`, `haber_sayfa_manset`, `haber_sayfa_manset_buyuk`, `description`, `description_ar`, `title`, `title_ar`, `tarih_frs`, `baslik_frs`, `icerik_frs`, `description_frs`, `title_frs`) VALUES
(348, 'BaŞLKK 3', '<p>İngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erik</p>\r\n\r\n<p>İngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erik</p>\r\n\r\n<p>İngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erik</p>\r\n', 14, 'baslkkkk-3', '2022-12-21', '2022-12-21', '34ef2-hb1.jpg', '31c0c-hb2.jpg', 'a376b-hb3.jpg', '', '', '', '', '', '', 'bAŞLIK TR', '<p>t&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erik</p>\r\n\r\n<p>t&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erik</p>\r\n\r\n<p>t&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erik</p>\r\n', 1, 1, 1, '', '', '', '', '2022-12-21', 'Başlık Rusça', '<p>İ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;a</p>\r\n\r\n<p>İ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;a</p>\r\n\r\n<p>İ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;a</p>\r\n\r\n<p>İ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;a</p>\r\n', '', ''),
(349, 'BaŞLKK 4', '<p>İngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erik</p>\r\n\r\n<p>İngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erik</p>\r\n\r\n<p>İngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erik</p>\r\n', 14, 'baslkkkk-4', '2022-12-21', '2022-12-21', '34ef2-hb1.jpg', '31c0c-hb2.jpg', 'a376b-hb3.jpg', '', '', '', '', '', '', 'bAŞLIK TR', '<p>t&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erik</p>\r\n\r\n<p>t&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erik</p>\r\n\r\n<p>t&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erik</p>\r\n', 1, 1, 1, '', '', '', '', '2022-12-21', 'Başlık Rusça', '<p>İ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;a</p>\r\n\r\n<p>İ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;a</p>\r\n\r\n<p>İ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;a</p>\r\n\r\n<p>İ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;a</p>\r\n', '', ''),
(350, 'BaŞLKK 5', '<p>İngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erik</p>\r\n\r\n<p>İngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erik</p>\r\n\r\n<p>İngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erik</p>\r\n', 14, 'baslkkkk-5', '2022-12-21', '2022-12-21', '34ef2-hb1.jpg', '31c0c-hb2.jpg', 'a376b-hb3.jpg', '', '', '', '', '', '', 'bAŞLIK TR', '<p>t&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erik</p>\r\n\r\n<p>t&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erik</p>\r\n\r\n<p>t&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erikt&Uuml;RK&Ccedil;E İ&ccedil;erik</p>\r\n', 1, 1, 1, '', '', '', '', '2022-12-21', 'Başlık Rusça', '<p>İ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;a</p>\r\n\r\n<p>İ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;a</p>\r\n\r\n<p>İ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;a</p>\r\n\r\n<p>İ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;aİ&ccedil;erik Rus&ccedil;a</p>\r\n', '', '');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `haber_kategori`
--

CREATE TABLE `haber_kategori` (
  `haber_kategori_id` int(11) NOT NULL,
  `kategori_adi` varchar(225) NOT NULL,
  `ebeveyn` int(11) NOT NULL,
  `seo_adi` varchar(225) NOT NULL,
  `kategori_adi_ar` varchar(550) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `title_ar` varchar(255) NOT NULL,
  `description_ar` varchar(255) NOT NULL,
  `kategori_adi_frs` varchar(225) NOT NULL,
  `title_frs` varchar(225) NOT NULL,
  `description_frs` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `haber_kategori`
--

INSERT INTO `haber_kategori` (`haber_kategori_id`, `kategori_adi`, `ebeveyn`, `seo_adi`, `kategori_adi_ar`, `title`, `description`, `title_ar`, `description_ar`, `kategori_adi_frs`, `title_frs`, `description_frs`) VALUES
(9, 'Category', 0, 'category', 'Kategori', 'Category title', 'Category description', 'Kategori Title', 'Kategori Description', 'Category Rus', 'Category Title Rus', 'Category Des Rus'),
(10, 'Category 2', 0, 'category-2', 'Kategori 2', 'Category 2 Title', 'Category 2 Description', 'Kategori Title 2', 'Kategori Description 2', 'Category Rus 2', 'Category Title Rus 2', 'Category Des Rus 2'),
(11, 'Category 3', 0, 'category-3', 'Kategori 3', 'Category 3 Title', 'Category 3 Description', 'Kategori Title 3', 'Kategori Description 3', 'Category Rus 3', 'Category Title Rus 3', 'Category Des Rus 3'),
(12, 'Category 4', 0, 'category-4', 'Kategori 4', 'Category 4 Title', 'Category 4 Description', 'Kategori Title 4', 'Kategori Description 4', 'Category Rus 4', 'Category Title Rus 4', 'Category Des Rus 4'),
(13, 'Category 5', 0, 'category-5', 'Kategori 5', 'Category 5 Title', 'Category 5 Description', 'Kategori Title 5', 'Kategori Description 5', 'Category Rus 5', 'Category Title Rus 5', 'Category Des Rus 5');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `hakkimizda`
--

CREATE TABLE `hakkimizda` (
  `about_id` int(11) NOT NULL,
  `baslik` varchar(225) NOT NULL,
  `yazi` text NOT NULL,
  `resim` varchar(225) NOT NULL,
  `resim_alt` varchar(225) NOT NULL,
  `resim_title` varchar(225) NOT NULL,
  `misyon` text NOT NULL,
  `vizyon` text NOT NULL,
  `alan_1_baslik` varchar(225) NOT NULL,
  `alan_1_yazi` text NOT NULL,
  `alan_2_baslik` varchar(225) NOT NULL,
  `alan_2_yazi` text NOT NULL,
  `alan_3_baslik` varchar(225) NOT NULL,
  `alan_3_yazi` text NOT NULL,
  `alan_4_baslik` varchar(225) NOT NULL,
  `alan_4_yazi` text NOT NULL,
  `alan_5_baslik` varchar(225) NOT NULL,
  `alan_5_yazi` text NOT NULL,
  `baslik_ar` varchar(550) DEFAULT NULL,
  `yazi_ar` text,
  `misyon_ar` text,
  `vizyon_ar` text,
  `alan_1_baslik_ar` varchar(550) DEFAULT NULL,
  `alan_1_yazi_ar` text,
  `alan_2_baslik_ar` varchar(550) DEFAULT NULL,
  `alan_2_yazi_ar` text,
  `alan_3_baslik_ar` varchar(550) DEFAULT NULL,
  `alan_3_yazi_ar` text,
  `alan_4_baslik_ar` varchar(550) DEFAULT NULL,
  `alan_4_yazi_ar` text,
  `alan_5_baslik_ar` varchar(550) DEFAULT NULL,
  `alan_5_yazi_ar` text,
  `about_description` varchar(255) NOT NULL,
  `about_description_ar` varchar(255) NOT NULL,
  `about_title` varchar(255) NOT NULL,
  `about_title_ar` varchar(255) NOT NULL,
  `baslik_frs` varchar(225) NOT NULL,
  `yazi_frs` text NOT NULL,
  `misyon_frs` text NOT NULL,
  `vizyon_frs` text NOT NULL,
  `alan_1_baslik_frs` varchar(225) NOT NULL,
  `alan_1_yazi_frs` text NOT NULL,
  `alan_2_baslik_frs` varchar(225) NOT NULL,
  `alan_2_yazi_frs` text NOT NULL,
  `alan_3_baslik_frs` varchar(225) NOT NULL,
  `alan_3_yazi_frs` text NOT NULL,
  `alan_4_baslik_frs` varchar(225) NOT NULL,
  `alan_4_yazi_frs` text NOT NULL,
  `alan_5_baslik_frs` varchar(225) NOT NULL,
  `alan_5_yazi_frs` text NOT NULL,
  `about_description_frs` varchar(225) NOT NULL,
  `about_title_frs` varchar(225) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED;

--
-- Tablo döküm verisi `hakkimizda`
--

INSERT INTO `hakkimizda` (`about_id`, `baslik`, `yazi`, `resim`, `resim_alt`, `resim_title`, `misyon`, `vizyon`, `alan_1_baslik`, `alan_1_yazi`, `alan_2_baslik`, `alan_2_yazi`, `alan_3_baslik`, `alan_3_yazi`, `alan_4_baslik`, `alan_4_yazi`, `alan_5_baslik`, `alan_5_yazi`, `baslik_ar`, `yazi_ar`, `misyon_ar`, `vizyon_ar`, `alan_1_baslik_ar`, `alan_1_yazi_ar`, `alan_2_baslik_ar`, `alan_2_yazi_ar`, `alan_3_baslik_ar`, `alan_3_yazi_ar`, `alan_4_baslik_ar`, `alan_4_yazi_ar`, `alan_5_baslik_ar`, `alan_5_yazi_ar`, `about_description`, `about_description_ar`, `about_title`, `about_title_ar`, `baslik_frs`, `yazi_frs`, `misyon_frs`, `vizyon_frs`, `alan_1_baslik_frs`, `alan_1_yazi_frs`, `alan_2_baslik_frs`, `alan_2_yazi_frs`, `alan_3_baslik_frs`, `alan_3_yazi_frs`, `alan_4_baslik_frs`, `alan_4_yazi_frs`, `alan_5_baslik_frs`, `alan_5_yazi_frs`, `about_description_frs`, `about_title_frs`) VALUES
(1, 'İngilizce Başlık', '<p>İngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erik</p>\r\n\r\n<p>İngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erik</p>\r\n\r\n<p>İngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erik</p>\r\n\r\n<p>İngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erik</p>\r\n\r\n<p>İngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erik</p>\r\n', 'e58b5-about.png', 'Alt', 'Title', '<p>İngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erik</p>\r\n\r\n<p>İngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erik</p>\r\n\r\n<p>&nbsp;</p>\r\n', '<p>İngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erik</p>\r\n\r\n<p>İngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erik</p>\r\n\r\n<p>&nbsp;</p>\r\n', 'LONGEVITY', '<p>İngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erik</p>\r\n\r\n<p>İngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erik</p>\r\n\r\n<p>&nbsp;</p>\r\n', 'RESOURCEFUL', '<p>İngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erik</p>\r\n\r\n<p>İngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erik</p>\r\n\r\n<p>&nbsp;</p>\r\n', 'EXCELLENT REPUTATION', '<p>İngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erik</p>\r\n\r\n<p>İngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erik</p>\r\n\r\n<p>&nbsp;</p>\r\n', 'SERVICES', '<p>İngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erik</p>\r\n\r\n<p>İngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erik</p>\r\n\r\n<p>&nbsp;</p>\r\n', 'OUR TEAM', '<p>İngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erik</p>\r\n\r\n<p>İngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erikİngilizce İ&ccedil;erik</p>\r\n', 'Türkçe Başlık', '<p>T&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erik</p>\r\n\r\n<p>T&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erik</p>\r\n', '<p>T&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erik</p>\r\n\r\n<p>T&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erik</p>\r\n', '<p>T&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erik</p>\r\n\r\n<p>T&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erik</p>\r\n', 'Türkçe Başlık', '<p>T&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erik</p>\r\n\r\n<p>T&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erik</p>\r\n', 'Türkçe Başlık', '<p>T&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erik</p>\r\n\r\n<p>T&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erik</p>\r\n', 'Türkçe Başlık', '<p>T&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erik</p>\r\n\r\n<p>T&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erik</p>\r\n', 'Türkçe Başlık', '<p>T&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erik</p>\r\n\r\n<p>T&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erik</p>\r\n', 'Türkçe Başlık', '<p>T&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erik</p>\r\n\r\n<p>T&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erik</p>\r\n', '', '', '', '', 'Rusça Başlık', '<p>Rus&ccedil;a i&ccedil;erikRus&ccedil;a i&ccedil;erikRus&ccedil;a i&ccedil;erikRus&ccedil;a i&ccedil;erikRus&ccedil;a i&ccedil;erik Rus&ccedil;a i&ccedil;erikRus&ccedil;a i&ccedil;erikRus&ccedil;a</p>\r\n\r\n<p>i&ccedil;erikRus&ccedil;a i&ccedil;erikRus&ccedil;a i&ccedil;erikRus&ccedil;a i&ccedil;erikRus&ccedil;a i&ccedil;erik Rus&ccedil;a i&ccedil;erikRus&ccedil;a i&ccedil;erikRus&ccedil;a</p>\r\n\r\n<p>&nbsp;</p>\r\n', '<p>Rus&ccedil;a i&ccedil;erikRus&ccedil;a i&ccedil;erikRus&ccedil;a i&ccedil;erikRus&ccedil;a i&ccedil;erikRus&ccedil;a i&ccedil;erik Rus&ccedil;a i&ccedil;erikRus&ccedil;a i&ccedil;erikRus&ccedil;a</p>\r\n\r\n<p>i&ccedil;erikRus&ccedil;a i&ccedil;erikRus&ccedil;a i&ccedil;erikRus&ccedil;a i&ccedil;erikRus&ccedil;a i&ccedil;erik Rus&ccedil;a i&ccedil;erikRus&ccedil;a i&ccedil;erikRus&ccedil;a</p>\r\n', '<p>Rus&ccedil;a i&ccedil;erikRus&ccedil;a i&ccedil;erikRus&ccedil;a i&ccedil;erikRus&ccedil;a i&ccedil;erikRus&ccedil;a i&ccedil;erik Rus&ccedil;a i&ccedil;erikRus&ccedil;a i&ccedil;erikRus&ccedil;a</p>\r\n\r\n<p>i&ccedil;erikRus&ccedil;a i&ccedil;erikRus&ccedil;a i&ccedil;erikRus&ccedil;a i&ccedil;erikRus&ccedil;a i&ccedil;erik Rus&ccedil;a i&ccedil;erikRus&ccedil;a i&ccedil;erikRus&ccedil;a</p>\r\n', 'Rusça Başlık', '<p>Rus&ccedil;a i&ccedil;erikRus&ccedil;a i&ccedil;erikRus&ccedil;a i&ccedil;erikRus&ccedil;a i&ccedil;erikRus&ccedil;a i&ccedil;erik Rus&ccedil;a i&ccedil;erikRus&ccedil;a i&ccedil;erikRus&ccedil;a</p>\r\n\r\n<p>i&ccedil;erikRus&ccedil;a i&ccedil;erikRus&ccedil;a i&ccedil;erikRus&ccedil;a i&ccedil;erikRus&ccedil;a i&ccedil;erik Rus&ccedil;a i&ccedil;erikRus&ccedil;a i&ccedil;erikRus&ccedil;a</p>\r\n', 'Rusça Başlık', '<p>Rus&ccedil;a i&ccedil;erikRus&ccedil;a i&ccedil;erikRus&ccedil;a i&ccedil;erikRus&ccedil;a i&ccedil;erikRus&ccedil;a i&ccedil;erik Rus&ccedil;a i&ccedil;erikRus&ccedil;a i&ccedil;erikRus&ccedil;a</p>\r\n\r\n<p>i&ccedil;erikRus&ccedil;a i&ccedil;erikRus&ccedil;a i&ccedil;erikRus&ccedil;a i&ccedil;erikRus&ccedil;a i&ccedil;erik Rus&ccedil;a i&ccedil;erikRus&ccedil;a i&ccedil;erikRus&ccedil;a</p>\r\n', 'Rusça Başlık', '<p>Rus&ccedil;a i&ccedil;erikRus&ccedil;a i&ccedil;erikRus&ccedil;a i&ccedil;erikRus&ccedil;a i&ccedil;erikRus&ccedil;a i&ccedil;erik Rus&ccedil;a i&ccedil;erikRus&ccedil;a i&ccedil;erikRus&ccedil;a</p>\r\n\r\n<p>i&ccedil;erikRus&ccedil;a i&ccedil;erikRus&ccedil;a i&ccedil;erikRus&ccedil;a i&ccedil;erikRus&ccedil;a i&ccedil;erik Rus&ccedil;a i&ccedil;erikRus&ccedil;a i&ccedil;erikRus&ccedil;a</p>\r\n', 'Rusça Başlık', '<p>Rus&ccedil;a i&ccedil;erikRus&ccedil;a i&ccedil;erikRus&ccedil;a i&ccedil;erikRus&ccedil;a i&ccedil;erikRus&ccedil;a i&ccedil;erik Rus&ccedil;a i&ccedil;erikRus&ccedil;a i&ccedil;erikRus&ccedil;a</p>\r\n\r\n<p>i&ccedil;erikRus&ccedil;a i&ccedil;erikRus&ccedil;a i&ccedil;erikRus&ccedil;a i&ccedil;erikRus&ccedil;a i&ccedil;erik Rus&ccedil;a i&ccedil;erikRus&ccedil;a i&ccedil;erikRus&ccedil;a</p>\r\n', 'Rusça Başlık', '<p>Rus&ccedil;a i&ccedil;erikRus&ccedil;a i&ccedil;erikRus&ccedil;a i&ccedil;erikRus&ccedil;a i&ccedil;erikRus&ccedil;a i&ccedil;erik Rus&ccedil;a i&ccedil;erikRus&ccedil;a i&ccedil;erikRus&ccedil;a</p>\r\n\r\n<p>i&ccedil;erikRus&ccedil;a i&ccedil;erikRus&ccedil;a i&ccedil;erikRus&ccedil;a i&ccedil;erikRus&ccedil;a i&ccedil;erik Rus&ccedil;a i&ccedil;erikRus&ccedil;a i&ccedil;erikRus&ccedil;a</p>\r\n', '', '');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kategori`
--

CREATE TABLE `kategori` (
  `kategori_id` int(11) NOT NULL,
  `kategori_adi` varchar(225) NOT NULL,
  `kategori_on_yazi` varchar(225) NOT NULL,
  `kategori_aciklama` text NOT NULL,
  `ebeveyn` int(11) NOT NULL,
  `seo_adi` varchar(225) NOT NULL,
  `resim` varchar(225) NOT NULL,
  `resim_alt` varchar(225) NOT NULL,
  `resim_title` varchar(225) NOT NULL,
  `kategori_adi_ar` varchar(550) DEFAULT NULL,
  `kategori_aciklama_ar` text,
  `kategori_on_yazi_ar` varchar(225) NOT NULL,
  `description` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description_ar` varchar(255) NOT NULL,
  `title_ar` varchar(255) NOT NULL,
  `kategori_adi_frs` varchar(225) NOT NULL,
  `kategori_aciklama_frs` text NOT NULL,
  `kategori_on_yazi_frs` varchar(225) NOT NULL,
  `description_frs` varchar(225) NOT NULL,
  `title_frs` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `kategori`
--

INSERT INTO `kategori` (`kategori_id`, `kategori_adi`, `kategori_on_yazi`, `kategori_aciklama`, `ebeveyn`, `seo_adi`, `resim`, `resim_alt`, `resim_title`, `kategori_adi_ar`, `kategori_aciklama_ar`, `kategori_on_yazi_ar`, `description`, `title`, `description_ar`, `title_ar`, `kategori_adi_frs`, `kategori_aciklama_frs`, `kategori_on_yazi_frs`, `description_frs`, `title_frs`) VALUES
(1, 'Istanbul', 'Istanbul, in terms of cultural and historical richness and nature is one of the most important cities of not only Turkey, but the whole world...', '<p>Eastern and Western cultures meet up here.&nbsp;The city has a bosphorus that connects the Black Sea and the Mediterranean. Thousands of tourists come to Istanbul every year for its unique beauties.</p>\n\n<p>Istanbul has been home to the world&#39;s greatest civilizations and has been the center of the world for quite a while, with the saying &quot;All roads come to Istanbul&quot;. There is so much space to see and there is so much to do. Exploring Istanbul is not something that can fit in a few days, weeks or even months. Tourist guides for Istanbul, a list of places to visit, are packed under each stone that you remove, a date that is different from every digger you hit, another story comes to light. These lists, which are generally similar to each other, list the places where tourists who come to Istanbul for sightseeing are able to see in a short time and places of interest.</p>\n\n<p>Living here has always been a sight to everyone, both in terms of luxury life and investment. If you, too, are interested in a<strong>&nbsp;property for sale in Istanbul</strong>, you are at the right place.</p>\n\n<h2><strong>Apartments For Sale In Istanbul European Side</strong></h2>\n\n<p>Shopping facilities, marina and long walks, art works, antique shops, history of thousands of years are just a few things that will bring you joy living in Istanbul European Side. Istanbul European Side has always got the attention of tourists who wanted to become a homeowner in Turkey. Living in this region you get a calm lifestyle and a good investment opportunity in one. Since these are the holiday regions of Istanbul, one can get 10 thousands as a rental income.</p>\n\n<p>&nbsp;The projects are located in the middle of nature and the sea. So, you can smell fresh forest air and look for an extraordinary sea view from the balcony at the same time. You can spend your valuable time with your family in a house better than luxury hotels and villas.</p>\n\n<p>There are lots of options for those who look for properties for sale in Turkey<strong>.&nbsp;</strong>You can find a<strong>&nbsp;<a href=\"https://www.propertytr.com/property-for-sale-in-beylikduzu\" target=\"_blank\">property for sale in Beylikd&uuml;z&uuml;</a></strong>, Gaziosmanpaşa, Esenyurt, Ey&uuml;p, Avcılar.&nbsp;<strong>Different floor plans and sizes of apartments, amazing panoramic views, life in the heart of the city, smart house systems and all the facilities are there</strong>&nbsp;so you will be enjoying your stay here in Istanbul.</p>\n\n<p>You can, as well, find&nbsp;<a href=\"https://www.propertytr.com/property-for-sale-in-basaksehir\" target=\"_blank\">property for sale in Başakşehir</a>, Bağcılar, Kağıthane regions with only few minutes walking distance to&nbsp;important parts of the city. Buildings are built with modern architecture and design plus the prices are affordable. Choose a place where all your dreams come true altogether!</p>\n\n<h3><strong>Apartments For Sale In Istanbul Sea View</strong></h3>\n\n<p>Villa-style apartments, sea view, &nbsp;luxury household goods, excellent place for living with your family, all social facilities that you will need are closer than ever with us. With apartments you buy from the offers we have for you, you will feel the pleasure of waking up to the sea view every day.</p>\n\n<p>Besides living, you can also make a good profit investing in these properties, because of the reason that the projects offered here are all located in touristic parts of the city. Every year thousands of people come to this beautiful city and some of them even buy houses, or decide to spend some of their life here renting a house. This chance is unmissable, since the houses with such advantages won&rsquo;t be staying for long.</p>\n\n<p>To enjoy the harmony of blue and green, get the type of apartment you wish from apartments for sale in Istanbul.</p>\n', 0, 'istanbul', 'e27c9-istanbul.jpg', 'Alt', 'Title', 'Istanbul', '<p>İstanbulİstanbulİstanbulİstanbulİstanbul</p>\r\n\r\n<p>İstanbulİstanbulİstanbulİstanbulİstanbulİstanbulİstanbulİstanbulİstanbul</p>\r\n\r\n<p>İstanbulİstanbulİstanbulİstanbulİstanbulİstanbulİstanbulİstanbulİstanbul</p>\r\n', 'IstanbulIstanbulIstanbulIstanbulIstanbulIstanbulIstanbulIstanbul', '', 'İstanbul', '', '', 'Istanbul', '<p>IstanbulIstanbulIstanbulIstanbulIstanbulIstanbulIstanbulIstanbul</p>\r\n\r\n<p>IstanbulIstanbulIstanbulIstanbulIstanbulIstanbulIstanbulIstanbulIstanbulIstanbulIstanbul</p>\r\n\r\n<p>IstanbulIstanbulIstanbulIstanbulIstanbulIstanbulIstanbulIstanbulIstanbulIstanbulIstanbul</p>\r\n', 'IstanbulIstanbulIstanbulIstanbulIstanbulIstanbulIstanbulIstanbul', '', ''),
(2, 'Yalova', 'Although Yalova is famous for many people with its springs, it should be known by many historical travel points as well...', '<p>Yalova, Turkey is a town that can be traveled for 12 months.&nbsp;It is possible to define this province with different points from the long coastline to the waterfalls, from the pavilions to the arboretum. In the city center you will feel yourself as if you are in Venice.</p>\n\n<p>Yalova is a small coastal town, a lovely little town with clean streets along the seaside of the Marmara Sea, caf&eacute;s with green trees along the coast. Although crowded in recent years, nature tourism, trekking, camping tourism continues to be a popular spot for fans.</p>\n\n<p>Yalova can be reached by 1:30 hour ferry journey to istanbul. You can reach Yenikapı and Pendik with ferryboats by car. In Yalova you can stroll along the sea and in the bushes, stress on natural beauties, waterfalls and forests and springs.</p>\n\n<p>Yalova is known with the most beautiful colors of nature and carries on like a beautiful dress and presents different beauty in every season. It has one of the most beautiful coasts of Marmara and is an important port city in terms of coastal tourism, hunting tourism, thermal tourism and nature tourism. With all these qualities Yalova is very important for&nbsp;<a href=\"https://www.propertytr.com/turkey-real-estate-market\" target=\"_blank\">Turkey real estate market</a>.</p>\n\n<h2><strong>Apartment For Sale In Yalova Turkey</strong></h2>\n\n<p>Finding green and blue, forest and sea together is possible by living in Yalova. If you, too, decide to live in this city, that&rsquo;s the rightest choice of you! Another opportunity you will have by buying a house from the options we give you is that you will be close to the important points of city. Facilities like separated swimming pools, panoramic sea views, sunbathing areas, saunas and Turkish baths will bring you joy and make you spend more time at your home. You won&rsquo;t need to spend additional time going for shopping or relaxing. You and your family will be safe thanks to 24 hour security. Enjoy the fresh air and sea and live a quality life in Yalova.</p>\n\n<p>You will be enjoying with the social facilities offered you, such as Gardens and avenue, Fitness Center, Outdoor swimming pool, Open air cinema, Cafes, Open air sun terrace, Play station rooms, Closed Car Park, Guest houses inside of the complex.</p>\n\n<p>You can invest in a&nbsp;<a href=\"https://www.propertytr.com/property-for-sale-in-turkey\" target=\"_blank\">property for sale in Turkey</a>&nbsp;in any city, but these projects will give you amazing return of investment as that area is called as&nbsp;<strong>holiday</strong><strong>&nbsp;</strong>destination for Turkish and Gulf people which will allow you to collect between 15.000 TL to 22.000 TL rental income during the year.</p>\n\n<h3><strong>Houses For Sale In Yalova Turkey</strong></h3>\n\n<p>Although Yalova comes to minds with its mineral springs, it is also a historical and touristic city. Yalova deserves not only visiting and travelling for a short period; it is worth a stay. There are houses for sale in Yalova in our website; you can check them out. The projects we offer to you have important priviledges.</p>\n\n<p>The compounds are only a few meters away from the sea and famous beach clubs as well as in a few minute walking distance to&nbsp;<strong>ferry stations</strong><strong>&nbsp;</strong>which go to&nbsp;<strong>Istanbul</strong><strong>.&nbsp;</strong>This will give you an excellent opportunity to reach wherever you want to go in a short period of time. Yalova city center and thermal area is only in a few minute driving distance to the projects. &nbsp;The projects&rsquo; location is also unique as being just intersection of the pure green and the authentic blue.</p>\n\n<p>Have you already decided to stay in Yalova? You can trust us with the search. We assure you to get the safest and the rightest information about the&nbsp;<strong>property for sale in Yalova</strong>&nbsp;from our site.</p>\n', 0, 'yalova', 'cff90-yalova.jpg', 'Alt', 'Title', 'yalova', '<p>İstanbulİstanbulİstanbulİstanbulİstanbul</p>\r\n\r\n<p>İstanbulİstanbulİstanbulİstanbulİstanbulİstanbulİstanbulİstanbulİstanbul</p>\r\n\r\n<p>İstanbulİstanbulİstanbulİstanbulİstanbulİstanbulİstanbulİstanbulİstanbul</p>\r\n', 'IstanbulIstanbulIstanbulIstanbulIstanbulIstanbulIstanbulIstanbul', '', 'Yalova', '', '', 'Yalova', '<p>IstanbulIstanbulIstanbulIstanbulIstanbulIstanbulIstanbulIstanbul</p>\r\n\r\n<p>IstanbulIstanbulIstanbulIstanbulIstanbulIstanbulIstanbulIstanbulIstanbulIstanbulIstanbul</p>\r\n\r\n<p>IstanbulIstanbulIstanbulIstanbulIstanbulIstanbulIstanbulIstanbulIstanbulIstanbulIstanbul</p>\r\n', 'IstanbulIstanbulIstanbulIstanbulIstanbulIstanbulIstanbulIstanbul', '', ''),
(3, 'Antalya', 'Antalya is one of the most touristic points of Turkey and there are many places to visit. It is possible to find many beautiful beaches for a holiday which is a seaside city...', '<p>Every year, many tourists are attacking the Antalya for sun, sea and holiday and the city attracts a lot of tourists from all over the world with this feature.</p>\n\n<p>The more free you can be in a city, the more free you can be here. Different people live here in peace, which is also a source of peace for those who live there! Unbelievably beautiful landscapes from day and night will embrace you. The harmony of green and blue, al the landscapes you see will charm you.</p>\n\n<p>Antalya, the pearl of the Mediterranean, always gets the attention of local and foreign tourists. Also it is taking place at the beginning of the most populous cities in Turkey. Due to the fact that it has a Mediterranean climate, tourists from 12 open-air cities in the 12 months of the year choose Antalya for the holiday. &nbsp;Some people even buy holiday houses from this region or stay a while until the season is over renting a house. Mostly, Europeans, Arabs, Scandinavian and&nbsp;Russian people are living&nbsp;as foreigners&nbsp;in the town.</p>\n\n<h2><strong>Apartment For Sale in Antalya Turkey</strong></h2>\n\n<p>Antalya is one of the most touristic points of our country and there are many places to visit. Antalya, which is a seaside city and attracts many tourists from all over the world with this feature, has many beautiful beaches for sea holiday. In addition, the natural and historical areas are also quite impressive and worth seeing. There are many alternatives for night life in the city. It is possible to find clubs, bars and restaurants that appeal to every taste in every province.</p>\n\n<p>Looking at the&nbsp;<strong>property for sale in Antalya</strong>, keep in mind that you will be living with a sea and mountain view in a calm and safe environment. You can choose from 1 bedroom to 5 bedroom apartments all designed uniqely to make you feel the comfort.&nbsp; Outstanding facilities like out-door swimming pool, heated in-door pool, water slides, restaurants, saunas, spas, steam room, fitness center, Turkish bath, game room, wifi at common places, 7/24 security&nbsp;supported installed&nbsp;camera system, playground for kids will welcome you if you decide to buy a property in Antalya. While you will be enjoying the entertainments given to you and the panoramic view with your husband/wife , your kids will be enjoying their fun playground.</p>\n\n<p>Since Alanya is the most famous and touristic part of Antalya, we especially have chosen the&nbsp;&nbsp;<a href=\"https://www.propertytr.com/property-for-sale-in-alanya\" target=\"_blank\">property for sale in Alanya</a>&nbsp;region for you. All imaginations will be changed after you meet with the projects, since they are just like in the dreams.&nbsp;<strong>&nbsp;Exclusive building quality, design, architechture and amazing panoramic sea view will bring you happiness.&nbsp;</strong>The only thing you need to do is to choose&nbsp;which apartment suits you.</p>\n\n<h3><strong>Houses For Sale In Antalya Turkey</strong></h3>\n\n<p>Investment in Antalya is one of the best choices for making a profit. . Antalya has a rich nature and flora, and attracts thousands of people every year, with what it becomes an excellent country for making an investment. Statistics show that the number of foreign property buyers have increased by time, which is also a good evidence of the fact that people buying houses here are happy with their choice. In summer season, people come here to enjoy the sea and in winter &ndash; the ski resorts. Rental incomes are very high in this region, especially in summer, so being a homeowner is always a plus for making a living here. So, why are you not making a step on the way to being successfull investor? Make a search of the best housing projects of Antalya and get the right information.</p>\n\n<p>If you wish to get information about the houses in other cities of Turkey, go to&nbsp;<a href=\"https://www.propertytr.com/property-for-sale-in-turkey\" target=\"_blank\">property for sale in Turkey</a>&nbsp;section or choose the region you want and click the search button.</p>\n', 0, 'antalya', '59a37-antalya.jpg', 'Alt', 'Title', 'antalya', '<p>İstanbulİstanbulİstanbulİstanbulİstanbul</p>\r\n\r\n<p>İstanbulİstanbulİstanbulİstanbulİstanbulİstanbulİstanbulİstanbulİstanbul</p>\r\n\r\n<p>İstanbulİstanbulİstanbulİstanbulİstanbulİstanbulİstanbulİstanbulİstanbul</p>\r\n', 'IstanbulIstanbulIstanbulIstanbulIstanbulIstanbulIstanbulIstanbul', '', 'Antalya', '', 'Antalya', 'Antalya', '<p>IstanbulIstanbulIstanbulIstanbulIstanbulIstanbulIstanbulIstanbul</p>\r\n\r\n<p>IstanbulIstanbulIstanbulIstanbulIstanbulIstanbulIstanbulIstanbulIstanbulIstanbulIstanbul</p>\r\n\r\n<p>IstanbulIstanbulIstanbulIstanbulIstanbulIstanbulIstanbulIstanbulIstanbulIstanbulIstanbul</p>\r\n', 'IstanbulIstanbulIstanbulIstanbulIstanbulIstanbulIstanbulIstanbul', '', ''),
(4, 'Trabzon', 'Trabzon, whish is called as the pearl of Black Sea, is a breathtaking city with its unique beauties...', '<p>Trabzon, which is famous for the rains of all seasons, is surrounded by thousands of different plant species. Due to its rich forest cover, agriculture is the most important source of subsistence for Trabzon. Having different sources in terms of geological formation, the city reveals the miraculous features of nature.</p>\n\n<p>About Trabzon, the Pearl of the Black Sea Region, there is a distinct image in everyone&#39;s mind. Some people remember of hamsiy while being in Trabzon, and some people can not pass through the Monastery of S&uuml;mela. Trabzon sometimes evokes burgundy-blue colors and &nbsp;sometimes Ak&ccedil;aabat k&ouml;fte or its jokes.</p>\n\n<p>It is a privilege to live in Trabzon, which offers many places to visit with its 4,000 year old history with lush nature and immaculate weather.</p>\n\n<h2><strong>Apartment For Sale In Trabzon, Turkey</strong></h2>\n\n<p>If you stay in Trabzon, you will wake up in a different tone of green every morning. You will witness that every part of Trabzon has a distinct beauty. Whichever accommodation option you choose here, we would like to mention that you can start the day safely and comfortably. Those who want plenty of rest, oxygen and green can use their preference in this city.</p>\n\n<p>&nbsp;Buying a<strong>&nbsp;property for sale in Trabzon</strong>, you will have&nbsp;extraordinary sea view from your balcony.&nbsp;Social facilities such as swimming pools, playgrounds for kids, supermarkets, excellent landscapes and many more will make you live relaxed and in peace.</p>\n\n<p>The top 3 Reasons to buy a property from the projects are:</p>\n\n<ul>\n	<li>Ultra luxury and quality materials</li>\n	<li>Social facilities in a rich and wide area</li>\n	<li>Excellent view and closeness to the sea</li>\n</ul>\n\n<p>These particular properties are unique projects which are rare in the real estate market in Turkey.</p>\n\n<p>There are car parking areas that allows you to park your car in the shade, and it is protected by a lockable sliding door in some apartment types. There are also excellent barbecue lots for summer nights. The properties have wonderful winter garden area. If you are looking for a good quality item at a great price, check out the details of projects from our website. These are the unique projects with various style features with Ottoman Architecture and Modern touches.</p>\n\n<p>Trabzon is a superb number-one tourist destination, that is to say, other than living in Trabzon, you can make a profitable investment with the properties for sale in Trabzon we offer you.</p>\n\n<p>&nbsp;In the projects, high rental income is also presented to the investors as well as attractive capital growth as commonly accepted for Turkey by all over the world. Depending on the floors and side, you will have&nbsp;extraordinary sea view from your balcony.&nbsp;</p>\n\n<h3><strong>Houses For Sale In Trabzon Turkey</strong></h3>\n\n<p><a href=\"https://www.propertytr.com/property-for-sale-in-turkey\" target=\"_blank\">Property for sale in Turkey</a>&nbsp;have always got the attention of foreigners. And Trabzon is one of the best priorities of everyone with its nature.</p>\n\n<p>Either you are a foreigner or someone who want to make an investment, check out the Trabzon section of our website to see the offers given you &nbsp;each better than another. Before making a desicion consider all of the facts such as proximity of the location to important points for you, the level of luxury in and outside of the property, the views seen from the house, security system of the compound, the prices and plans of payment, and most importantly, the social facilities that the project has to offer you. We are sure that after considering all of the facts, you will make a choice for living from&nbsp;<a href=\"https://www.propertytr.com/real-estate-istanbul\" target=\"_blank\">real estate in Turkey</a><strong>&nbsp;for foreigners</strong>.</p>\n', 0, 'trabzon', '53e66-trabzon.jpg', 'Alt', 'Title', 'trabzon', '<p>İstanbulİstanbulİstanbulİstanbulİstanbul</p>\r\n\r\n<p>İstanbulİstanbulİstanbulİstanbulİstanbulİstanbulİstanbulİstanbulİstanbul</p>\r\n\r\n<p>İstanbulİstanbulİstanbulİstanbulİstanbulİstanbulİstanbulİstanbulİstanbul</p>\r\n', 'IstanbulIstanbulIstanbulIstanbulIstanbulIstanbulIstanbulIstanbul', '', 'Trabzon', '', 'Trabzon', 'Trabzon', '<p>IstanbulIstanbulIstanbulIstanbulIstanbulIstanbulIstanbulIstanbul</p>\r\n\r\n<p>IstanbulIstanbulIstanbulIstanbulIstanbulIstanbulIstanbulIstanbulIstanbulIstanbulIstanbul</p>\r\n\r\n<p>IstanbulIstanbulIstanbulIstanbulIstanbulIstanbulIstanbulIstanbulIstanbulIstanbulIstanbul</p>\r\n', 'IstanbulIstanbulIstanbulIstanbulIstanbulIstanbulIstanbulIstanbul', '', ''),
(5, 'Bursa', 'Bursa is a city built on the hill; you can find yourself in Uludağ National Park within half an hour by watching the beautiful Bursa scenery from a cable car...', '<p>One of the greatest strains of big cities is that there are no green spaces to breathe in Bursa. The advantage of the city in this respect; are many parks and green spaces in the city center. Four seasons are the rare places you can live together at the same day, and Bursa is one of such cities.</p>\n\n<p>The city is offering a relaxed lifestyle with lots of touristic destinations and natural places that you can visit and spend your&nbsp;time with your&nbsp;family and also with your friends. Green Tomb (Yesil Turbe), The Great Mosque (Ulu Cami),&nbsp;Green Mosque (Yesil Cami),&nbsp;Great Mountain (Uludag), Botanique Park, Historical plane tree (600 years old), Clock Tower&nbsp;and&nbsp;Mudanya are the city&#39;s landmarks.</p>\n\n<p>Moreover, you&nbsp;can find shopping malls, bank branches, schools, bazaars, universities and everything you need is only very short drive distance. Also, Uludag University located in the city is one of most popular university in the country.</p>\n\n<p>Buying a<strong>&nbsp;property for sale in Bursa</strong>, thanks to it economical advantages and beautiful nature has always gotten the attention of tourists and citizens. Once you choose to live in this outstanding city full of history, you are on the right way for living a happy life.</p>\n\n<h2><strong>Apartment For Sale In Bursa Turkey</strong></h2>\n\n<p>Checking Bursa section of our website you can easily find the valuable housing projects in Bursa. These houses are one of the most beautiful&nbsp;<a href=\"https://www.propertytr.com/property-for-sale-in-turkey\" target=\"_blank\">property for sale in Turkey</a>.</p>\n\n<p>Modern residences with uniques architecture and design will welcome you. You can choose from 3 bedroom and 4 bedroom apartments designed in a stylish way. The transportation is very easy in the city, other than that, you can reach most of the main points of the city only by walking or a few minute driving. There are social facilities, like parking lots, swimming pools, playgrounds for children, smart home appliences, fitness centers, supermarkets, excellent landscapes , that will increase the luxury.</p>\n\n<p>Are you still wondering why to invest in the projects? Here are only a few reasons:</p>\n\n<p>You can swim, ski, visit historical places at the city,all social facilities are&nbsp;existing in same neighborhood, good&nbsp;layout plans for the apartments for family living, public transportation just next to the project and so much more.</p>\n\n<p>Look at the photos, read the details, you will deside to buy a property anyways!</p>\n\n<p>Buying a villa doesn&rsquo;t mean that you have to force your pocket. There are houses for every budget and the payment plans are very reasonable at the same time.</p>\n\n<h3><strong>Houses For Sale In Bursa Turkey</strong></h3>\n\n<p>Bursa&nbsp;is also one of the best investment destination who are looking for a smart investment opportunity as the apartment prices are increasing by capital appreciation every single day. Meantime, you can have relax, swim, ski, and visit the historical places at the same time in the city.<a href=\"https://www.propertytr.com/property-developers\" target=\"_blank\">Property developers</a>&nbsp;have thought about detail.</p>\n\n<p>&nbsp;In the project, high rental income is also presented to the investors as well as attractive capital growth, since the area is announced as urban transformation area by the government. By doing so, all of the other neighbourhoods will seem to be designed as postmodern comparing with the project districts of Bursa.</p>\n\n<p>Having a house in touristic city like Bursa, and even at the center of it, is only one click away with us. Choose the project, select the type of apartment or villa and decide on the property you want. That is all that takes you to a happy and luxury life at the beautiful parts of the historical city!</p>\n', 0, 'bursa', 'ab09d-bursa.jpg', 'Alt', 'Title', 'bursa', '<p>İstanbulİstanbulİstanbulİstanbulİstanbul</p>\r\n\r\n<p>İstanbulİstanbulİstanbulİstanbulİstanbulİstanbulİstanbulİstanbulİstanbul</p>\r\n\r\n<p>İstanbulİstanbulİstanbulİstanbulİstanbulİstanbulİstanbulİstanbulİstanbul</p>\r\n', 'IstanbulIstanbulIstanbulIstanbulIstanbulIstanbulIstanbulIstanbul', '', 'Bursa', '', 'Bursa', 'Bursa', '<p>IstanbulIstanbulIstanbulIstanbulIstanbulIstanbulIstanbulIstanbul</p>\r\n\r\n<p>IstanbulIstanbulIstanbulIstanbulIstanbulIstanbulIstanbulIstanbulIstanbulIstanbulIstanbul</p>\r\n\r\n<p>IstanbulIstanbulIstanbulIstanbulIstanbulIstanbulIstanbulIstanbulIstanbulIstanbulIstanbul</p>\r\n', 'IstanbulIstanbulIstanbulIstanbulIstanbulIstanbulIstanbulIstanbul', '', ''),
(6, 'Sakarya', 'Sapanca, a charming district connected to Sakarya, is located to the west of the city. The nature, the air, the greenery, the lake, and the hills promise peace in Sakarya...', '<p>Today, Sapanca is described as a quiet and hidden paradise, with a deep history. Surrounded by forests that stretch all the way to four sides, Sapanca falls into a beauty that fascinates especially in the spring months.&nbsp; It is like a natural film platter with a warm warm breeze in the hot summer months, yellowing leaves covering everywhere in the autumn, and forests with a green twin tone. Every season, it is home to different beauties, and it becomes an outgoing adversary of this heaven on earth.</p>\n\n<p>Sapanca is also known with the fruit garden of Kırkpınar and Kurtk&ouml;y, which adds beauty to the region&#39;s color and beauty. The clarity of the lake water, the diversity of the plant along the coast creates a splendid color rendition. If you want to leave behind the city complex, dive in the mood of birds, daze in fresh air, take a long bike ride through the trees, and sit in one of the lakeside restaurants and eat delicious trout. This beautiful place promises green, peace and silence, and will provide you with a clean and renewable district.</p>\n\n<p>&nbsp;It is a privilege to live in Sapanca, which is a destination of calm and peaceful times, away from city stress, which has a different beauty every season.</p>\n\n<h2><strong>APARTMENT FOR SALE IN SAPANCA TURKEY</strong></h2>\n\n<p>If you, too, are looking for a&nbsp;<strong>property for sale in Sapanca</strong>&nbsp;and want to live in this peaceful place, you can check our websites&rsquo; Sapanca section. Villas, offered you, are of unusual architecture, design and luxury. You may make your choice between the different options given. Everything is designed so that you can enjoy each and every second of your stay with your family here. The property offers in Sakarya are just a few minutes away from the priviledges of the city, in a walking distance.</p>\n\n<p>The houses has both&nbsp;forest and mountain view. So, you can reach the&nbsp;coast where you can relax by&nbsp;breathing fresh air&nbsp;and feel comfortable without stress&nbsp;or viewing amazing Sapanca lake&nbsp;view.</p>\n\n<p>Social&nbsp;<strong>facilities</strong>&nbsp;such as swimming pool,&nbsp;outstanding landcapes with lighting and playground for kids are there to increase the level of comfort and joy. The payment plan is reasonable, that is to say, you won&rsquo;t froce your budget being a villa owner. Short walking and driving distance to important parts of the city is another priviledge.</p>\n\n<h3><strong>HOUSES FOR SALE IN SAPANCA TURKEY</strong></h3>\n\n<p>&nbsp;Sapanca is a heaven for&nbsp;the tourists&nbsp;who prefer to retreat in the nature. There are many boutique hotels in the neighborhood, as luxurious thermal hotels offering&nbsp;retreat and relaxation&nbsp;by positive effects of&nbsp;healing powers which&#39;s resource is underground mineral waters.&nbsp;It is preferred both for short time holidays and also for living the whole year.&nbsp;</p>\n\n<p>Why not get an amazing villa from such a district? It should be in your list of&nbsp;<a href=\"https://www.propertytr.com/real-estate-marketing-ideas\" target=\"_blank\">real estate marketing ideas</a>. Project with its exclusive building architecture, design and construction quality and amazing forest and mountain view...&nbsp;A way of getting a luxuruous villa without forcing the budget is using the reasonable affordable payment plans each differing from project to project. Up to 24 months installements are available in the projects.</p>\n\n<p>&nbsp;In order to see the prices and get information about payment plans, clicking on the project is enough. Not to mention the fact that there is no need to even look up for any other websites to get information, not knowing if it is right or not. You may also choose another city to buy a&nbsp;<a href=\"https://www.propertytr.com/property-for-sale-in-turkey\" target=\"_blank\">property for sale in Turkey</a>. We are here to help you with all the details!&nbsp;</p>\n', 0, 'sakarya', 'ab09d-bursa.jpg', 'Alt', 'Title', 'sakarya', '<p>İstanbulİstanbulİstanbulİstanbulİstanbul</p>\r\n\r\n<p>İstanbulİstanbulİstanbulİstanbulİstanbulİstanbulİstanbulİstanbulİstanbul</p>\r\n\r\n<p>İstanbulİstanbulİstanbulİstanbulİstanbulİstanbulİstanbulİstanbulİstanbul</p>\r\n', 'IstanbulIstanbulIstanbulIstanbulIstanbulIstanbulIstanbulIstanbul', '', 'Sakarya', '', 'Sakarya', 'Sakarya', '<p>IstanbulIstanbulIstanbulIstanbulIstanbulIstanbulIstanbulIstanbul</p>\r\n\r\n<p>IstanbulIstanbulIstanbulIstanbulIstanbulIstanbulIstanbulIstanbulIstanbulIstanbulIstanbul</p>\r\n\r\n<p>IstanbulIstanbulIstanbulIstanbulIstanbulIstanbulIstanbulIstanbulIstanbulIstanbulIstanbul</p>\r\n', 'IstanbulIstanbulIstanbulIstanbulIstanbulIstanbulIstanbulIstanbul', '', '');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `link`
--

CREATE TABLE `link` (
  `id` int(11) NOT NULL,
  `link` varchar(225) NOT NULL,
  `link_ar` varchar(225) NOT NULL,
  `adi` varchar(225) NOT NULL,
  `adi_ar` varchar(225) NOT NULL,
  `link_frs` varchar(225) NOT NULL,
  `adi_frs` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `link`
--

INSERT INTO `link` (`id`, `link`, `link_ar`, `adi`, `adi_ar`, `link_frs`, `adi_frs`) VALUES
(1, 'facebook', 'https://www.facebook.com', 'facebook', 'https://www.facebook.com', 'https://www.facebook.com', 'facebook'),
(2, 'https://www.twitter.com', 'https://www.twitter.com', 'Twitter', 'Twitter', 'https://www.twitter.com', 'Twitter'),
(3, 'https://www.instagram.com', 'https://www.instagram.com', 'instagram', 'instagram', 'https://www.instagram.com', 'instagram'),
(4, 'https://www.youtube.com', 'https://www.youtube.com', 'Youtube', 'Youtube', 'https://www.youtube.com', 'Youtube');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `projeler`
--

CREATE TABLE `projeler` (
  `proje_id` int(11) NOT NULL,
  `proje_adi` varchar(225) NOT NULL,
  `proje_yeri` varchar(225) NOT NULL,
  `kategori` int(11) NOT NULL,
  `sat_kir` int(11) NOT NULL,
  `type` varchar(225) NOT NULL,
  `whatsapp` varchar(225) NOT NULL,
  `email` varchar(225) NOT NULL,
  `proje_tarih` date NOT NULL,
  `min_fiyat` varchar(225) NOT NULL,
  `max_fiyat` varchar(225) NOT NULL,
  `min_m2` varchar(225) NOT NULL,
  `max_m2` varchar(225) NOT NULL,
  `proje_durum` varchar(225) NOT NULL,
  `total_apartments` varchar(225) NOT NULL,
  `total_land_side` varchar(225) NOT NULL,
  `park_kapasite` varchar(225) NOT NULL,
  `Aciklama` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Ozellikler` text NOT NULL,
  `Location` text NOT NULL,
  `telefon` varchar(225) NOT NULL,
  `seo_adi` varchar(225) NOT NULL,
  `banner_1` varchar(225) NOT NULL,
  `banner_2` varchar(225) NOT NULL,
  `banner_3` varchar(225) NOT NULL,
  `banner_1_alt` varchar(225) NOT NULL,
  `banner_1_title` varchar(225) NOT NULL,
  `banner_2_alt` varchar(225) NOT NULL,
  `banner_2_title` varchar(225) NOT NULL,
  `banner_3_alt` varchar(225) NOT NULL,
  `banner_3_title` text NOT NULL,
  `adres` varchar(225) NOT NULL,
  `maps_linki` varchar(850) NOT NULL,
  `harita_lat` varchar(225) NOT NULL,
  `harita_lon` varchar(225) NOT NULL,
  `facebook` varchar(225) NOT NULL,
  `instagram` varchar(225) NOT NULL,
  `twitter` varchar(225) NOT NULL,
  `youtube` varchar(225) NOT NULL,
  `proje_adi_ar` varchar(550) DEFAULT NULL,
  `proje_yeri_ar` varchar(225) NOT NULL,
  `min_fiyat_ar` varchar(550) DEFAULT NULL,
  `max_fiyat_ar` varchar(550) DEFAULT NULL,
  `min_m2_ar` varchar(550) DEFAULT NULL,
  `max_m2_ar` varchar(550) DEFAULT NULL,
  `proje_durum_ar` varchar(550) DEFAULT NULL,
  `total_apartments_ar` varchar(550) DEFAULT NULL,
  `total_land_side_ar` varchar(550) DEFAULT NULL,
  `park_kapasite_ar` varchar(550) DEFAULT NULL,
  `Aciklama_ar` text,
  `Ozellikler_ar` text,
  `Location_ar` text,
  `telefon_ar` varchar(550) DEFAULT NULL,
  `adres_ar` varchar(550) DEFAULT NULL,
  `proje_tarih_ar` date NOT NULL,
  `favori` int(11) NOT NULL,
  `manset` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description_ar` varchar(255) NOT NULL,
  `title_ar` varchar(255) NOT NULL,
  `proje_adi_frs` varchar(225) NOT NULL,
  `proje_yeri_frs` varchar(225) NOT NULL,
  `min_fiyat_frs` varchar(225) NOT NULL,
  `max_fiyat_frs` varchar(225) NOT NULL,
  `min_m2_frs` varchar(225) NOT NULL,
  `max_m2_frs` varchar(225) NOT NULL,
  `proje_durum_frs` varchar(225) NOT NULL,
  `total_apartments_frs` varchar(225) NOT NULL,
  `total_land_side_frs` varchar(225) NOT NULL,
  `park_kapasite_frs` varchar(225) NOT NULL,
  `Aciklama_frs` text NOT NULL,
  `Ozellikler_frs` text NOT NULL,
  `Location_frs` text NOT NULL,
  `telefon_frs` varchar(225) NOT NULL,
  `adres_frs` varchar(225) NOT NULL,
  `proje_tarih_frs` date NOT NULL,
  `description_frs` varchar(225) NOT NULL,
  `title_frs` varchar(225) NOT NULL,
  `proje_kime_ait_isim` varchar(225) NOT NULL,
  `proje_kime_ait_adres` varchar(225) NOT NULL,
  `proje_kime_ait_telefon` varchar(225) NOT NULL,
  `kat` varchar(225) NOT NULL,
  `balkon` varchar(225) NOT NULL,
  `dosya` varchar(225) NOT NULL,
  `proje` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `projeler`
--

INSERT INTO `projeler` (`proje_id`, `proje_adi`, `proje_yeri`, `kategori`, `sat_kir`, `type`, `whatsapp`, `email`, `proje_tarih`, `min_fiyat`, `max_fiyat`, `min_m2`, `max_m2`, `proje_durum`, `total_apartments`, `total_land_side`, `park_kapasite`, `Aciklama`, `Ozellikler`, `Location`, `telefon`, `seo_adi`, `banner_1`, `banner_2`, `banner_3`, `banner_1_alt`, `banner_1_title`, `banner_2_alt`, `banner_2_title`, `banner_3_alt`, `banner_3_title`, `adres`, `maps_linki`, `harita_lat`, `harita_lon`, `facebook`, `instagram`, `twitter`, `youtube`, `proje_adi_ar`, `proje_yeri_ar`, `min_fiyat_ar`, `max_fiyat_ar`, `min_m2_ar`, `max_m2_ar`, `proje_durum_ar`, `total_apartments_ar`, `total_land_side_ar`, `park_kapasite_ar`, `Aciklama_ar`, `Ozellikler_ar`, `Location_ar`, `telefon_ar`, `adres_ar`, `proje_tarih_ar`, `favori`, `manset`, `description`, `title`, `description_ar`, `title_ar`, `proje_adi_frs`, `proje_yeri_frs`, `min_fiyat_frs`, `max_fiyat_frs`, `min_m2_frs`, `max_m2_frs`, `proje_durum_frs`, `total_apartments_frs`, `total_land_side_frs`, `park_kapasite_frs`, `Aciklama_frs`, `Ozellikler_frs`, `Location_frs`, `telefon_frs`, `adres_frs`, `proje_tarih_frs`, `description_frs`, `title_frs`, `proje_kime_ait_isim`, `proje_kime_ait_adres`, `proje_kime_ait_telefon`, `kat`, `balkon`, `dosya`, `proje`) VALUES
(1, 'Alanya Evleri', 'Alanya', 3, 1, 'proje', '', '', '2022-12-22', '7500000', '', '220', '300', '', '225', '100000', '245', '<p>Proje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklaması</p>\r\n\r\n<p>Proje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklaması</p>\r\n\r\n<p>Proje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklaması</p>\r\n\r\n<p>Proje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklaması</p>\r\n', '<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n', '', '05432354576', 'alanya-evleri', '1eb3a-286_358.jpg', '6ae48-285_281.jpg', 'd565f-288_349.jpg', '', '', '', '', '', '', 'Deneme Mahallesi, DENEME CADDESİ NO 36/2 aLANYA/antalya', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d51286.798267810045!2d31.977632510233228!3d36.54386683800271!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x14dca27b822cd5fb%3A0xd160c1c8b3dc170b!2sAlanya%2C%20Antalya!5e0!3m2!1str!2str!4v1671696104143!5m2!1str!2str\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>', '', '', '', '', '', '', 'Alanya Evleri', 'Alanya', '7500000', NULL, '220', '300', NULL, '225', '100000', '245', '<p>Proje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklaması</p>\r\n\r\n<p>Proje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklaması</p>\r\n\r\n<p>Proje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklaması</p>\r\n\r\n<p>Proje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklaması</p>\r\n', '<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n', NULL, '05432354576', 'Deneme Mahallesi, DENEME CADDESİ NO 36/2 aLANYA/antalya', '2022-12-22', 1, 1, 'AçıklamaAçıklamaAçıklamaAçıklamaAçıklamaAçıklamaAçıklama', 'AçıklamaAçıklamaAçıklamaAçıklamaAçıklama', '', '', 'Alanya Evleri', 'Alanya', '7500000', '', '220', '300', '', '225', '100000', '245', '<p>Proje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklaması</p>\r\n\r\n<p>Proje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklaması</p>\r\n\r\n<p>Proje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklaması</p>\r\n\r\n<p>Proje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklaması</p>\r\n', '<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n', '', '05432354576', 'Deneme Mahallesi, DENEME CADDESİ NO 36/2 aLANYA/antalya', '2022-12-22', '', '', 'Ali Yılmaz', 'Ali Yılmaz adresAli Yılmaz adresAli Yılmaz adresAli Yılmaz adresAli Yılmaz adres', '05322453465', '20', '', '9e31b-katalog.pdf', ''),
(2, 'Alanya Evleri 2', 'Alanya', 3, 1, 'proje', '', '', '2022-12-22', '7500000', '', '220', '300', '', '225', '100000', '245', '<p>Proje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklaması</p>\r\n\r\n<p>Proje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklaması</p>\r\n\r\n<p>Proje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklaması</p>\r\n\r\n<p>Proje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklaması</p>\r\n', '<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n', '', '05432354576', 'alanya-evleri-2', '1eb3a-286_358.jpg', '6ae48-285_281.jpg', 'd565f-288_349.jpg', '', '', '', '', '', '', 'Deneme Mahallesi, DENEME CADDESİ NO 36/2 aLANYA/antalya', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d51286.798267810045!2d31.977632510233228!3d36.54386683800271!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x14dca27b822cd5fb%3A0xd160c1c8b3dc170b!2sAlanya%2C%20Antalya!5e0!3m2!1str!2str!4v1671696104143!5m2!1str!2str\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>', '', '', '', '', '', '', 'Alanya Evleri 2', 'Alanya', '7500000', NULL, '220', '300', NULL, '225', '100000', '245', '<p>Proje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklaması</p>\r\n\r\n<p>Proje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklaması</p>\r\n\r\n<p>Proje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklaması</p>\r\n\r\n<p>Proje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklaması</p>\r\n', '<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n', NULL, '05432354576', 'Deneme Mahallesi, DENEME CADDESİ NO 36/2 aLANYA/antalya', '2022-12-22', 1, 1, 'AçıklamaAçıklamaAçıklamaAçıklamaAçıklamaAçıklamaAçıklama', 'AçıklamaAçıklamaAçıklamaAçıklamaAçıklama', '', '', 'Alanya Evleri 2', 'Alanya', '7500000', '', '220', '300', '', '225', '100000', '245', '<p>Proje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklaması</p>\r\n\r\n<p>Proje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklaması</p>\r\n\r\n<p>Proje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklaması</p>\r\n\r\n<p>Proje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklaması</p>\r\n', '<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n', '', '05432354576', 'Deneme Mahallesi, DENEME CADDESİ NO 36/2 aLANYA/antalya', '2022-12-22', '', '', 'Ali Yılmaz', 'Ali Yılmaz adresAli Yılmaz adresAli Yılmaz adresAli Yılmaz adresAli Yılmaz adres', '05322453465', '20', '', '9e31b-katalog.pdf', ''),
(3, 'Alanya Evleri 3', 'Alanya', 3, 1, 'proje', '', '', '2022-12-22', '7500000', '', '220', '300', '', '225', '100000', '245', '<p>Proje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklaması</p>\r\n\r\n<p>Proje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklaması</p>\r\n\r\n<p>Proje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklaması</p>\r\n\r\n<p>Proje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklaması</p>\r\n', '<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n', '', '05432354576', 'alanya-evleri-3', '1eb3a-286_358.jpg', '6ae48-285_281.jpg', 'd565f-288_349.jpg', '', '', '', '', '', '', 'Deneme Mahallesi, DENEME CADDESİ NO 36/2 aLANYA/antalya', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d51286.798267810045!2d31.977632510233228!3d36.54386683800271!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x14dca27b822cd5fb%3A0xd160c1c8b3dc170b!2sAlanya%2C%20Antalya!5e0!3m2!1str!2str!4v1671696104143!5m2!1str!2str\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>', '', '', '', '', '', '', 'Alanya Evleri 3', 'Alanya', '7500000', NULL, '220', '300', NULL, '225', '100000', '245', '<p>Proje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklaması</p>\r\n\r\n<p>Proje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklaması</p>\r\n\r\n<p>Proje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklaması</p>\r\n\r\n<p>Proje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklaması</p>\r\n', '<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n', NULL, '05432354576', 'Deneme Mahallesi, DENEME CADDESİ NO 36/2 aLANYA/antalya', '2022-12-22', 1, 1, 'AçıklamaAçıklamaAçıklamaAçıklamaAçıklamaAçıklamaAçıklama', 'AçıklamaAçıklamaAçıklamaAçıklamaAçıklama', '', '', 'Alanya Evleri 3', 'Alanya', '7500000', '', '220', '300', '', '225', '100000', '245', '<p>Proje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklaması</p>\r\n\r\n<p>Proje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklaması</p>\r\n\r\n<p>Proje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklaması</p>\r\n\r\n<p>Proje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklaması</p>\r\n', '<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n', '', '05432354576', 'Deneme Mahallesi, DENEME CADDESİ NO 36/2 aLANYA/antalya', '2022-12-22', '', '', 'Ali Yılmaz', 'Ali Yılmaz adresAli Yılmaz adresAli Yılmaz adresAli Yılmaz adresAli Yılmaz adres', '05322453465', '20', '', '9e31b-katalog.pdf', ''),
(4, 'Alanya Evleri 4', 'Alanya', 3, 0, 'proje', '', '', '2022-12-22', '7500000', '', '220', '300', '', '225', '100000', '245', '<p>Proje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklaması</p>\r\n\r\n<p>Proje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklaması</p>\r\n\r\n<p>Proje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklaması</p>\r\n\r\n<p>Proje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklaması</p>\r\n', '<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n', '', '05432354576', 'alanya-evleri-4', '1eb3a-286_358.jpg', '6ae48-285_281.jpg', 'd565f-288_349.jpg', '', '', '', '', '', '', 'Deneme Mahallesi, DENEME CADDESİ NO 36/2 aLANYA/antalya', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d51286.798267810045!2d31.977632510233228!3d36.54386683800271!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x14dca27b822cd5fb%3A0xd160c1c8b3dc170b!2sAlanya%2C%20Antalya!5e0!3m2!1str!2str!4v1671696104143!5m2!1str!2str\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>', '', '', '', '', '', '', 'Alanya Evleri 4', 'Alanya', '7500000', NULL, '220', '300', NULL, '225', '100000', '245', '<p>Proje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklaması</p>\r\n\r\n<p>Proje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklaması</p>\r\n\r\n<p>Proje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklaması</p>\r\n\r\n<p>Proje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklaması</p>\r\n', '<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n', NULL, '05432354576', 'Deneme Mahallesi, DENEME CADDESİ NO 36/2 aLANYA/antalya', '2022-12-22', 1, 1, 'AçıklamaAçıklamaAçıklamaAçıklamaAçıklamaAçıklamaAçıklama', 'AçıklamaAçıklamaAçıklamaAçıklamaAçıklama', '', '', 'Alanya Evleri 4', 'Alanya', '7500000', '', '220', '300', '', '225', '100000', '245', '<p>Proje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklaması</p>\r\n\r\n<p>Proje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklaması</p>\r\n\r\n<p>Proje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklaması</p>\r\n\r\n<p>Proje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklaması</p>\r\n', '<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n', '', '05432354576', 'Deneme Mahallesi, DENEME CADDESİ NO 36/2 aLANYA/antalya', '2022-12-22', '', '', 'Ali Yılmaz', 'Ali Yılmaz adresAli Yılmaz adresAli Yılmaz adresAli Yılmaz adresAli Yılmaz adres', '05322453465', '20', '', '9e31b-katalog.pdf', ''),
(5, 'Alanya Evleri 5', 'Alanya', 3, 0, 'proje', '', '', '2022-12-22', '7500000', '', '220', '300', '', '225', '100000', '245', '<p>Proje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklaması</p>\r\n\r\n<p>Proje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklaması</p>\r\n\r\n<p>Proje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklaması</p>\r\n\r\n<p>Proje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklaması</p>\r\n', '<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n', '', '05432354576', 'alanya-evleri-5', '1eb3a-286_358.jpg', '6ae48-285_281.jpg', 'd565f-288_349.jpg', '', '', '', '', '', '', 'Deneme Mahallesi, DENEME CADDESİ NO 36/2 aLANYA/antalya', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d51286.798267810045!2d31.977632510233228!3d36.54386683800271!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x14dca27b822cd5fb%3A0xd160c1c8b3dc170b!2sAlanya%2C%20Antalya!5e0!3m2!1str!2str!4v1671696104143!5m2!1str!2str\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>', '', '', '', '', '', '', 'Alanya Evleri 5', 'Alanya', '7500000', NULL, '220', '300', NULL, '225', '100000', '245', '<p>Proje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklaması</p>\r\n\r\n<p>Proje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklaması</p>\r\n\r\n<p>Proje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklaması</p>\r\n\r\n<p>Proje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklaması</p>\r\n', '<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n', NULL, '05432354576', 'Deneme Mahallesi, DENEME CADDESİ NO 36/2 aLANYA/antalya', '2022-12-22', 1, 1, 'AçıklamaAçıklamaAçıklamaAçıklamaAçıklamaAçıklamaAçıklama', 'AçıklamaAçıklamaAçıklamaAçıklamaAçıklama', '', '', 'Alanya Evleri 5', 'Alanya', '7500000', '', '220', '300', '', '225', '100000', '245', '<p>Proje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklaması</p>\r\n\r\n<p>Proje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklaması</p>\r\n\r\n<p>Proje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklaması</p>\r\n\r\n<p>Proje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklaması</p>\r\n', '<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n', '', '05432354576', 'Deneme Mahallesi, DENEME CADDESİ NO 36/2 aLANYA/antalya', '2022-12-22', '', '', 'Ali Yılmaz', 'Ali Yılmaz adresAli Yılmaz adresAli Yılmaz adresAli Yılmaz adresAli Yılmaz adres', '05322453465', '20', '', '9e31b-katalog.pdf', ''),
(6, 'Alanya Evleri 6', 'Alanya', 3, 0, 'proje', '', '', '2022-12-22', '7500000', '', '220', '300', '', '225', '100000', '245', '<p>Proje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklaması</p>\r\n\r\n<p>Proje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklaması</p>\r\n\r\n<p>Proje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklaması</p>\r\n\r\n<p>Proje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklaması</p>\r\n', '<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n', '', '05432354576', 'alanya-evleri-6', '1eb3a-286_358.jpg', '6ae48-285_281.jpg', 'd565f-288_349.jpg', '', '', '', '', '', '', 'Deneme Mahallesi, DENEME CADDESİ NO 36/2 aLANYA/antalya', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d51286.798267810045!2d31.977632510233228!3d36.54386683800271!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x14dca27b822cd5fb%3A0xd160c1c8b3dc170b!2sAlanya%2C%20Antalya!5e0!3m2!1str!2str!4v1671696104143!5m2!1str!2str\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>', '', '', '', '', '', '', 'Alanya Evleri 6', 'Alanya', '7500000', NULL, '220', '300', NULL, '225', '100000', '245', '<p>Proje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklaması</p>\r\n\r\n<p>Proje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklaması</p>\r\n\r\n<p>Proje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklaması</p>\r\n\r\n<p>Proje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklaması</p>\r\n', '<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n', NULL, '05432354576', 'Deneme Mahallesi, DENEME CADDESİ NO 36/2 aLANYA/antalya', '2022-12-22', 1, 1, 'AçıklamaAçıklamaAçıklamaAçıklamaAçıklamaAçıklamaAçıklama', 'AçıklamaAçıklamaAçıklamaAçıklamaAçıklama', '', '', 'Alanya Evleri 6', 'Alanya', '7500000', '', '220', '300', '', '225', '100000', '245', '<p>Proje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklaması</p>\r\n\r\n<p>Proje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklaması</p>\r\n\r\n<p>Proje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklaması</p>\r\n\r\n<p>Proje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklamasıProje A&ccedil;ıklaması</p>\r\n', '<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n\r\n<p>-&Ouml;zellik maddesi</p>\r\n', '', '05432354576', 'Deneme Mahallesi, DENEME CADDESİ NO 36/2 aLANYA/antalya', '2022-12-22', '', '', 'Ali Yılmaz', 'Ali Yılmaz adresAli Yılmaz adresAli Yılmaz adresAli Yılmaz adresAli Yılmaz adres', '05322453465', '20', '', '9e31b-katalog.pdf', ''),
(7, 'Daire 1', 'Antalya', 3, 1, 'daire', '', '', '0000-00-00', '4000000', '', '200', '', '', '', '', '100', '<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n\r\n<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n\r\n<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n\r\n<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n', '<p>&nbsp;</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n', '', '0543 123 45 67', 'daire-1', '3fe91-286_358.jpg', 'd7cbf-285_281.jpg', '02333-288_349.jpg', '', '', '', '', '', '', 'AdresAdresAdresAdresAdresAdresAdres', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d51286.798267810045!2d31.977632510233228!3d36.54386683800271!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x14dca27b822cd5fb%3A0xd160c1c8b3dc170b!2sAlanya%2C%20Antalya!5e0!3m2!1str!2str!4v1671696104143!5m2!1str!2str\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>', '', '', '', '', '', '', 'Daire 1', 'Antalya', '4000000', NULL, '200', NULL, NULL, NULL, NULL, '100', '<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n\r\n<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n\r\n<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n\r\n<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n', '<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n', NULL, '0543 123 45 67', 'AdresAdresAdresAdresAdresAdresAdres', '2022-12-22', 1, 1, '', '', '', '', 'Daire 1', 'Antalya', '4000000', '', '200', '', '', '', '', '100', '<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n\r\n<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n\r\n<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n\r\n<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n', '<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n', '', '0543 123 45 67', 'AdresAdresAdresAdresAdresAdresAdres', '2022-12-22', '', '', '', '', '', '4', '2', '69bcc-katalog.pdf', '1'),
(8, 'Daire 2', 'Antalya', 3, 1, 'daire', '', '', '0000-00-00', '4000000', '', '200', '', '', '', '', '100', '<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n\r\n<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n\r\n<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n\r\n<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n', '<p>&nbsp;</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n', '', '0543 123 45 67', 'daire-2', '3fe91-286_358.jpg', 'd7cbf-285_281.jpg', '02333-288_349.jpg', '', '', '', '', '', '', 'AdresAdresAdresAdresAdresAdresAdres', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d51286.798267810045!2d31.977632510233228!3d36.54386683800271!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x14dca27b822cd5fb%3A0xd160c1c8b3dc170b!2sAlanya%2C%20Antalya!5e0!3m2!1str!2str!4v1671696104143!5m2!1str!2str\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>', '', '', '', '', '', '', 'Daire 2', 'Antalya', '4000000', NULL, '200', NULL, NULL, NULL, NULL, '100', '<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n\r\n<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n\r\n<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n\r\n<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n', '<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n', NULL, '0543 123 45 67', 'AdresAdresAdresAdresAdresAdresAdres', '2022-12-22', 1, 1, '', '', '', '', 'Daire 2', 'Antalya', '4000000', '', '200', '', '', '', '', '100', '<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n\r\n<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n\r\n<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n\r\n<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n', '<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n', '', '0543 123 45 67', 'AdresAdresAdresAdresAdresAdresAdres', '2022-12-22', '', '', '', '', '', '4', '2', '69bcc-katalog.pdf', ''),
(9, 'Daire 3', 'Antalya', 3, 1, 'daire', '', '', '0000-00-00', '4000000', '', '200', '', '', '', '', '100', '<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n\r\n<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n\r\n<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n\r\n<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n', '<p>&nbsp;</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n', '', '0543 123 45 67', 'daire-3', '3fe91-286_358.jpg', 'd7cbf-285_281.jpg', '02333-288_349.jpg', '', '', '', '', '', '', 'AdresAdresAdresAdresAdresAdresAdres', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d51286.798267810045!2d31.977632510233228!3d36.54386683800271!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x14dca27b822cd5fb%3A0xd160c1c8b3dc170b!2sAlanya%2C%20Antalya!5e0!3m2!1str!2str!4v1671696104143!5m2!1str!2str\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>', '', '', '', '', '', '', 'Daire 3', 'Antalya', '4000000', NULL, '200', NULL, NULL, NULL, NULL, '100', '<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n\r\n<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n\r\n<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n\r\n<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n', '<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n', NULL, '0543 123 45 67', 'AdresAdresAdresAdresAdresAdresAdres', '2022-12-22', 1, 1, '', '', '', '', 'Daire 3', 'Antalya', '4000000', '', '200', '', '', '', '', '100', '<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n\r\n<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n\r\n<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n\r\n<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n', '<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n', '', '0543 123 45 67', 'AdresAdresAdresAdresAdresAdresAdres', '2022-12-22', '', '', '', '', '', '4', '2', '69bcc-katalog.pdf', ''),
(10, 'Daire 4', 'Antalya', 3, 0, 'daire', '', '', '0000-00-00', '4000000', '', '200', '', '', '', '', '100', '<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n\r\n<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n\r\n<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n\r\n<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n', '<p>&nbsp;</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n', '', '0543 123 45 67', 'daire-4', '3fe91-286_358.jpg', 'd7cbf-285_281.jpg', '02333-288_349.jpg', '', '', '', '', '', '', 'AdresAdresAdresAdresAdresAdresAdres', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d51286.798267810045!2d31.977632510233228!3d36.54386683800271!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x14dca27b822cd5fb%3A0xd160c1c8b3dc170b!2sAlanya%2C%20Antalya!5e0!3m2!1str!2str!4v1671696104143!5m2!1str!2str\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>', '', '', '', '', '', '', 'Daire 4', 'Antalya', '4000000', NULL, '200', NULL, NULL, NULL, NULL, '100', '<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n\r\n<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n\r\n<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n\r\n<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n', '<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n', NULL, '0543 123 45 67', 'AdresAdresAdresAdresAdresAdresAdres', '2022-12-22', 1, 1, '', '', '', '', 'Daire 4', 'Antalya', '4000000', '', '200', '', '', '', '', '100', '<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n\r\n<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n\r\n<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n\r\n<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n', '<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n', '', '0543 123 45 67', 'AdresAdresAdresAdresAdresAdresAdres', '2022-12-22', '', '', '', '', '', '4', '2', '69bcc-katalog.pdf', ''),
(11, 'Daire 5', 'Antalya', 3, 0, 'daire', '', '', '0000-00-00', '4000000', '', '200', '', '', '', '', '100', '<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n\r\n<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n\r\n<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n\r\n<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n', '<p>&nbsp;</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n', '', '0543 123 45 67', 'daire-5', '3fe91-286_358.jpg', 'd7cbf-285_281.jpg', '02333-288_349.jpg', '', '', '', '', '', '', 'AdresAdresAdresAdresAdresAdresAdres', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d51286.798267810045!2d31.977632510233228!3d36.54386683800271!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x14dca27b822cd5fb%3A0xd160c1c8b3dc170b!2sAlanya%2C%20Antalya!5e0!3m2!1str!2str!4v1671696104143!5m2!1str!2str\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>', '', '', '', '', '', '', 'Daire 4', 'Antalya', '4000000', NULL, '200', NULL, NULL, NULL, NULL, '100', '<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n\r\n<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n\r\n<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n\r\n<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n', '<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n', NULL, '0543 123 45 67', 'AdresAdresAdresAdresAdresAdresAdres', '2022-12-22', 1, 1, '', '', '', '', 'Daire 5', 'Antalya', '4000000', '', '200', '', '', '', '', '100', '<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n\r\n<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n\r\n<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n\r\n<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n', '<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n', '', '0543 123 45 67', 'AdresAdresAdresAdresAdresAdresAdres', '2022-12-22', '', '', '', '', '', '4', '2', '69bcc-katalog.pdf', ''),
(12, 'Daire 6', 'Antalya', 3, 0, 'daire', '', '', '0000-00-00', '4000000', '', '200', '', '', '', '', '100', '<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n\r\n<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n\r\n<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n\r\n<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n', '<p>&nbsp;</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n', '', '0543 123 45 67', 'daire-6', '3fe91-286_358.jpg', 'd7cbf-285_281.jpg', '02333-288_349.jpg', '', '', '', '', '', '', 'AdresAdresAdresAdresAdresAdresAdres', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d51286.798267810045!2d31.977632510233228!3d36.54386683800271!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x14dca27b822cd5fb%3A0xd160c1c8b3dc170b!2sAlanya%2C%20Antalya!5e0!3m2!1str!2str!4v1671696104143!5m2!1str!2str\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>', '', '', '', '', '', '', 'Daire 4', 'Antalya', '4000000', NULL, '200', NULL, NULL, NULL, NULL, '100', '<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n\r\n<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n\r\n<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n\r\n<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n', '<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n', NULL, '0543 123 45 67', 'AdresAdresAdresAdresAdresAdresAdres', '2022-12-22', 1, 1, '', '', '', '', 'Daire 6', 'Antalya', '4000000', '', '200', '', '', '', '', '100', '<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n\r\n<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n\r\n<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n\r\n<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n', '<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n', '', '0543 123 45 67', 'AdresAdresAdresAdresAdresAdresAdres', '2022-12-22', '', '', '', '', '', '4', '2', '69bcc-katalog.pdf', ''),
(13, 'Villa 1', 'Alanya', 3, 1, 'villa', '', '', '0000-00-00', '3550000', '', '340', '', '', '', '', '3', '<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n\r\n<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n\r\n<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n', '<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n', '', '0543 123 45 67', 'villa-1', '85e15-286_358.jpg', '022b6-285_281.jpg', '06e3d-288_349.jpg', '', '', '', '', '', '', 'AdresAdresAdresAdresAdresAdresAdres', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d51286.798267810045!2d31.977632510233228!3d36.54386683800271!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x14dca27b822cd5fb%3A0xd160c1c8b3dc170b!2sAlanya%2C%20Antalya!5e0!3m2!1str!2str!4v1671696104143!5m2!1str!2str\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>', '', '', '', '', '', '', 'Villa 1', 'Alanya', '3550000', NULL, '340', NULL, NULL, NULL, NULL, '3', '<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n\r\n<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n\r\n<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n', '<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n', NULL, '0543 123 45 67', 'AdresAdresAdresAdresAdresAdresAdres', '2022-12-22', 1, 1, '', '', '', '', 'Villa 1', 'Alanya', '3550000', '', '340', '', '', '', '', '3', '<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n\r\n<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n\r\n<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n', '<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n', '', '0543 123 45 67', 'AdresAdresAdresAdresAdresAdresAdres', '2022-12-22', '', '', '', '', '', '2', '3', 'dbed3-katalog.pdf', '1');
INSERT INTO `projeler` (`proje_id`, `proje_adi`, `proje_yeri`, `kategori`, `sat_kir`, `type`, `whatsapp`, `email`, `proje_tarih`, `min_fiyat`, `max_fiyat`, `min_m2`, `max_m2`, `proje_durum`, `total_apartments`, `total_land_side`, `park_kapasite`, `Aciklama`, `Ozellikler`, `Location`, `telefon`, `seo_adi`, `banner_1`, `banner_2`, `banner_3`, `banner_1_alt`, `banner_1_title`, `banner_2_alt`, `banner_2_title`, `banner_3_alt`, `banner_3_title`, `adres`, `maps_linki`, `harita_lat`, `harita_lon`, `facebook`, `instagram`, `twitter`, `youtube`, `proje_adi_ar`, `proje_yeri_ar`, `min_fiyat_ar`, `max_fiyat_ar`, `min_m2_ar`, `max_m2_ar`, `proje_durum_ar`, `total_apartments_ar`, `total_land_side_ar`, `park_kapasite_ar`, `Aciklama_ar`, `Ozellikler_ar`, `Location_ar`, `telefon_ar`, `adres_ar`, `proje_tarih_ar`, `favori`, `manset`, `description`, `title`, `description_ar`, `title_ar`, `proje_adi_frs`, `proje_yeri_frs`, `min_fiyat_frs`, `max_fiyat_frs`, `min_m2_frs`, `max_m2_frs`, `proje_durum_frs`, `total_apartments_frs`, `total_land_side_frs`, `park_kapasite_frs`, `Aciklama_frs`, `Ozellikler_frs`, `Location_frs`, `telefon_frs`, `adres_frs`, `proje_tarih_frs`, `description_frs`, `title_frs`, `proje_kime_ait_isim`, `proje_kime_ait_adres`, `proje_kime_ait_telefon`, `kat`, `balkon`, `dosya`, `proje`) VALUES
(16, 'Villa 2', 'Alanya', 3, 1, 'villa', '', '', '0000-00-00', '3550000', '', '340', '', '', '', '', '3', '<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n\r\n<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n\r\n<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n', '<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n', '', '0543 123 45 67', 'villa-2', '85e15-286_358.jpg', '022b6-285_281.jpg', '06e3d-288_349.jpg', '', '', '', '', '', '', 'AdresAdresAdresAdresAdresAdresAdres', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d51286.798267810045!2d31.977632510233228!3d36.54386683800271!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x14dca27b822cd5fb%3A0xd160c1c8b3dc170b!2sAlanya%2C%20Antalya!5e0!3m2!1str!2str!4v1671696104143!5m2!1str!2str\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>', '', '', '', '', '', '', 'Villa 2', 'Alanya', '3550000', NULL, '340', NULL, NULL, NULL, NULL, '3', '<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n\r\n<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n\r\n<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n', '<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n', NULL, '0543 123 45 67', 'AdresAdresAdresAdresAdresAdresAdres', '2022-12-22', 1, 1, '', '', '', '', 'Villa 2', 'Alanya', '3550000', '', '340', '', '', '', '', '3', '<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n\r\n<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n\r\n<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n', '<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n', '', '0543 123 45 67', 'AdresAdresAdresAdresAdresAdresAdres', '2022-12-22', '', '', '', '', '', '2', '3', 'dbed3-katalog.pdf', '1'),
(17, 'Villa 3', 'Alanya', 3, 1, 'villa', '', '', '0000-00-00', '3550000', '', '340', '', '', '', '', '3', '<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n\r\n<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n\r\n<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n', '<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n', '', '0543 123 45 67', 'villa-3', '85e15-286_358.jpg', '022b6-285_281.jpg', '06e3d-288_349.jpg', '', '', '', '', '', '', 'AdresAdresAdresAdresAdresAdresAdres', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d51286.798267810045!2d31.977632510233228!3d36.54386683800271!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x14dca27b822cd5fb%3A0xd160c1c8b3dc170b!2sAlanya%2C%20Antalya!5e0!3m2!1str!2str!4v1671696104143!5m2!1str!2str\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>', '', '', '', '', '', '', 'Villa 3', 'Alanya', '3550000', NULL, '340', NULL, NULL, NULL, NULL, '3', '<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n\r\n<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n\r\n<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n', '<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n', NULL, '0543 123 45 67', 'AdresAdresAdresAdresAdresAdresAdres', '2022-12-22', 1, 1, '', '', '', '', 'Villa 3', 'Alanya', '3550000', '', '340', '', '', '', '', '3', '<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n\r\n<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n\r\n<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n', '<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n', '', '0543 123 45 67', 'AdresAdresAdresAdresAdresAdresAdres', '2022-12-22', '', '', '', '', '', '2', '3', 'dbed3-katalog.pdf', '1'),
(18, 'Villa 4', 'Alanya', 3, 0, 'villa', '', '', '0000-00-00', '3550000', '', '340', '', '', '', '', '3', '<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n\r\n<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n\r\n<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n', '<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n', '', '0543 123 45 67', 'villa-4', '85e15-286_358.jpg', '022b6-285_281.jpg', '06e3d-288_349.jpg', '', '', '', '', '', '', 'AdresAdresAdresAdresAdresAdresAdres', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d51286.798267810045!2d31.977632510233228!3d36.54386683800271!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x14dca27b822cd5fb%3A0xd160c1c8b3dc170b!2sAlanya%2C%20Antalya!5e0!3m2!1str!2str!4v1671696104143!5m2!1str!2str\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>', '', '', '', '', '', '', 'Villa 4', 'Alanya', '3550000', NULL, '340', NULL, NULL, NULL, NULL, '3', '<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n\r\n<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n\r\n<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n', '<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n', NULL, '0543 123 45 67', 'AdresAdresAdresAdresAdresAdresAdres', '2022-12-22', 1, 1, '', '', '', '', 'Villa 4', 'Alanya', '3550000', '', '340', '', '', '', '', '3', '<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n\r\n<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n\r\n<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n', '<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n', '', '0543 123 45 67', 'AdresAdresAdresAdresAdresAdresAdres', '2022-12-22', '', '', '', '', '', '2', '3', 'dbed3-katalog.pdf', '1'),
(19, 'Villa 5', 'Alanya', 3, 0, 'villa', '', '', '0000-00-00', '3550000', '', '340', '', '', '', '', '3', '<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n\r\n<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n\r\n<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n', '<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n', '', '0543 123 45 67', 'villa-5', '85e15-286_358.jpg', '022b6-285_281.jpg', '06e3d-288_349.jpg', '', '', '', '', '', '', 'AdresAdresAdresAdresAdresAdresAdres', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d51286.798267810045!2d31.977632510233228!3d36.54386683800271!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x14dca27b822cd5fb%3A0xd160c1c8b3dc170b!2sAlanya%2C%20Antalya!5e0!3m2!1str!2str!4v1671696104143!5m2!1str!2str\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>', '', '', '', '', '', '', 'Villa 5', 'Alanya', '3550000', NULL, '340', NULL, NULL, NULL, NULL, '3', '<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n\r\n<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n\r\n<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n', '<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n', NULL, '0543 123 45 67', 'AdresAdresAdresAdresAdresAdresAdres', '2022-12-22', 1, 1, '', '', '', '', 'Villa 5', 'Alanya', '3550000', '', '340', '', '', '', '', '3', '<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n\r\n<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n\r\n<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n', '<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n', '', '0543 123 45 67', 'AdresAdresAdresAdresAdresAdresAdres', '2022-12-22', '', '', '', '', '', '2', '3', 'dbed3-katalog.pdf', '1'),
(20, 'Villa 6', 'Alanya', 3, 0, 'villa', '', '', '0000-00-00', '3550000', '', '340', '', '', '', '', '3', '<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n\r\n<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n\r\n<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n', '<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n', '', '0543 123 45 67', 'villa-6', '85e15-286_358.jpg', '022b6-285_281.jpg', '06e3d-288_349.jpg', '', '', '', '', '', '', 'AdresAdresAdresAdresAdresAdresAdres', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d51286.798267810045!2d31.977632510233228!3d36.54386683800271!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x14dca27b822cd5fb%3A0xd160c1c8b3dc170b!2sAlanya%2C%20Antalya!5e0!3m2!1str!2str!4v1671696104143!5m2!1str!2str\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>', '', '', '', '', '', '', 'Villa 6', 'Alanya', '3550000', NULL, '340', NULL, NULL, NULL, NULL, '3', '<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n\r\n<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n\r\n<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n', '<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n', NULL, '0543 123 45 67', 'AdresAdresAdresAdresAdresAdresAdres', '2022-12-22', 1, 1, '', '', '', '', 'Villa 6', 'Alanya', '3550000', '', '340', '', '', '', '', '3', '<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n\r\n<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n\r\n<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n', '<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n', '', '0543 123 45 67', 'AdresAdresAdresAdresAdresAdresAdres', '2022-12-22', '', '', '', '', '', '2', '3', 'dbed3-katalog.pdf', '1'),
(21, 'Alanya Arsa', 'Alanya', 3, 1, 'arsa', '', '', '0000-00-00', '7500000', '', '220', '', '', '', '', '', '<p>A&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ık</p>\r\n\r\n<p>A&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ık</p>\r\n\r\n<p>A&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ık</p>\r\n', '<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n', '', '0543 123 45 67', 'alanya-arsa', '7eeb1-286_358.jpg', 'a37b1-285_281.jpg', '2c9b3-288_349.jpg', '', '', '', '', '', '', 'AdresAdresAdresAdresAdresAdresAdres', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d51286.798267810045!2d31.977632510233228!3d36.54386683800271!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x14dca27b822cd5fb%3A0xd160c1c8b3dc170b!2sAlanya%2C%20Antalya!5e0!3m2!1str!2str!4v1671696104143!5m2!1str!2str\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>', '', '', '', '', '', '', 'Alanya Arsa', 'Alanya', '7500000', NULL, '220', NULL, NULL, NULL, NULL, NULL, '<p>Alanya ArsaAlanya ArsaAlanya ArsaAlanya Arsa</p>\r\n\r\n<p>Alanya ArsaAlanya ArsaAlanya ArsaAlanya ArsaAlanya ArsaAlanya Arsa</p>\r\n\r\n<p>Alanya ArsaAlanya ArsaAlanya ArsaAlanya ArsaAlanya ArsaAlanya ArsaAlanya ArsaAlanya Arsa</p>\r\n', '<p>-Alanya Arsa</p>\r\n\r\n<p>-Alanya Arsa</p>\r\n\r\n<p>-Alanya Arsa</p>\r\n\r\n<p>-Alanya Arsa</p>\r\n\r\n<p>-Alanya Arsa</p>\r\n', NULL, '05432354576', 'Deneme Mahallesi, DENEME CADDESİ NO 36/2 aLANYA/antalya', '2022-12-22', 1, 1, '', '', '', '', 'Alanya Evleri', 'Alanya', '7500000', '', '220', '', '', '', '', '', '<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n\r\n<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n\r\n<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n', '<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n', '', '0543 123 45 67', 'AdresAdresAdresAdresAdresAdresAdres', '2022-12-22', '', '', '', '', '', '', '', '56964-katalog.pdf', ''),
(22, 'Alanya Arsa 2', 'Alanya', 3, 1, 'arsa', '', '', '0000-00-00', '7500000', '', '220', '', '', '', '', '', '<p>A&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ık</p>\r\n\r\n<p>A&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ık</p>\r\n\r\n<p>A&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ık</p>\r\n', '<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n', '', '0543 123 45 67', 'alanya-arsa-2', '7eeb1-286_358.jpg', 'a37b1-285_281.jpg', '2c9b3-288_349.jpg', '', '', '', '', '', '', 'AdresAdresAdresAdresAdresAdresAdres', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d51286.798267810045!2d31.977632510233228!3d36.54386683800271!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x14dca27b822cd5fb%3A0xd160c1c8b3dc170b!2sAlanya%2C%20Antalya!5e0!3m2!1str!2str!4v1671696104143!5m2!1str!2str\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>', '', '', '', '', '', '', 'Alanya Arsa 2', 'Alanya', '7500000', NULL, '220', NULL, NULL, NULL, NULL, NULL, '<p>Alanya ArsaAlanya ArsaAlanya ArsaAlanya Arsa</p>\r\n\r\n<p>Alanya ArsaAlanya ArsaAlanya ArsaAlanya ArsaAlanya ArsaAlanya Arsa</p>\r\n\r\n<p>Alanya ArsaAlanya ArsaAlanya ArsaAlanya ArsaAlanya ArsaAlanya ArsaAlanya ArsaAlanya Arsa</p>\r\n', '<p>-Alanya Arsa</p>\r\n\r\n<p>-Alanya Arsa</p>\r\n\r\n<p>-Alanya Arsa</p>\r\n\r\n<p>-Alanya Arsa</p>\r\n\r\n<p>-Alanya Arsa</p>\r\n', NULL, '05432354576', 'Deneme Mahallesi, DENEME CADDESİ NO 36/2 aLANYA/antalya', '2022-12-22', 1, 1, '', '', '', '', 'Alanya Arsa 2', 'Alanya', '7500000', '', '220', '', '', '', '', '', '<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n\r\n<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n\r\n<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n', '<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n', '', '0543 123 45 67', 'AdresAdresAdresAdresAdresAdresAdres', '2022-12-22', '', '', '', '', '', '', '', '56964-katalog.pdf', ''),
(23, 'Alanya Arsa 3', 'Alanya', 3, 1, 'arsa', '', '', '0000-00-00', '7500000', '', '220', '', '', '', '', '', '<p>A&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ık</p>\r\n\r\n<p>A&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ık</p>\r\n\r\n<p>A&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ık</p>\r\n', '<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n', '', '0543 123 45 67', 'alanya-arsa-3', '7eeb1-286_358.jpg', 'a37b1-285_281.jpg', '2c9b3-288_349.jpg', '', '', '', '', '', '', 'AdresAdresAdresAdresAdresAdresAdres', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d51286.798267810045!2d31.977632510233228!3d36.54386683800271!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x14dca27b822cd5fb%3A0xd160c1c8b3dc170b!2sAlanya%2C%20Antalya!5e0!3m2!1str!2str!4v1671696104143!5m2!1str!2str\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>', '', '', '', '', '', '', 'Alanya Arsa 3', 'Alanya', '7500000', NULL, '220', NULL, NULL, NULL, NULL, NULL, '<p>Alanya ArsaAlanya ArsaAlanya ArsaAlanya Arsa</p>\r\n\r\n<p>Alanya ArsaAlanya ArsaAlanya ArsaAlanya ArsaAlanya ArsaAlanya Arsa</p>\r\n\r\n<p>Alanya ArsaAlanya ArsaAlanya ArsaAlanya ArsaAlanya ArsaAlanya ArsaAlanya ArsaAlanya Arsa</p>\r\n', '<p>-Alanya Arsa</p>\r\n\r\n<p>-Alanya Arsa</p>\r\n\r\n<p>-Alanya Arsa</p>\r\n\r\n<p>-Alanya Arsa</p>\r\n\r\n<p>-Alanya Arsa</p>\r\n', NULL, '05432354576', 'Deneme Mahallesi, DENEME CADDESİ NO 36/2 aLANYA/antalya', '2022-12-22', 1, 1, '', '', '', '', 'Alanya Arsa 3', 'Alanya', '7500000', '', '220', '', '', '', '', '', '<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n\r\n<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n\r\n<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n', '<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n', '', '0543 123 45 67', 'AdresAdresAdresAdresAdresAdresAdres', '2022-12-22', '', '', '', '', '', '', '', '56964-katalog.pdf', ''),
(24, 'Alanya Arsa 4', 'Alanya', 3, 0, 'arsa', '', '', '0000-00-00', '7500000', '', '220', '', '', '', '', '', '<p>A&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ık</p>\r\n\r\n<p>A&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ık</p>\r\n\r\n<p>A&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ık</p>\r\n', '<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n', '', '0543 123 45 67', 'alanya-arsa-4', '7eeb1-286_358.jpg', 'a37b1-285_281.jpg', '2c9b3-288_349.jpg', '', '', '', '', '', '', 'AdresAdresAdresAdresAdresAdresAdres', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d51286.798267810045!2d31.977632510233228!3d36.54386683800271!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x14dca27b822cd5fb%3A0xd160c1c8b3dc170b!2sAlanya%2C%20Antalya!5e0!3m2!1str!2str!4v1671696104143!5m2!1str!2str\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>', '', '', '', '', '', '', 'Alanya Arsa 4', 'Alanya', '7500000', NULL, '220', NULL, NULL, NULL, NULL, NULL, '<p>Alanya ArsaAlanya ArsaAlanya ArsaAlanya Arsa</p>\r\n\r\n<p>Alanya ArsaAlanya ArsaAlanya ArsaAlanya ArsaAlanya ArsaAlanya Arsa</p>\r\n\r\n<p>Alanya ArsaAlanya ArsaAlanya ArsaAlanya ArsaAlanya ArsaAlanya ArsaAlanya ArsaAlanya Arsa</p>\r\n', '<p>-Alanya Arsa</p>\r\n\r\n<p>-Alanya Arsa</p>\r\n\r\n<p>-Alanya Arsa</p>\r\n\r\n<p>-Alanya Arsa</p>\r\n\r\n<p>-Alanya Arsa</p>\r\n', NULL, '05432354576', 'Deneme Mahallesi, DENEME CADDESİ NO 36/2 aLANYA/antalya', '2022-12-22', 1, 1, '', '', '', '', 'Alanya Arsa 4', 'Alanya', '7500000', '', '220', '', '', '', '', '', '<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n\r\n<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n\r\n<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n', '<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n', '', '0543 123 45 67', 'AdresAdresAdresAdresAdresAdresAdres', '2022-12-22', '', '', '', '', '', '', '', '56964-katalog.pdf', ''),
(25, 'Alanya Arsa 5', 'Alanya', 3, 0, 'arsa', '', '', '0000-00-00', '7500000', '', '220', '', '', '', '', '', '<p>A&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ık</p>\r\n\r\n<p>A&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ık</p>\r\n\r\n<p>A&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ık</p>\r\n', '<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n', '', '0543 123 45 67', 'alanya-arsa-5', '7eeb1-286_358.jpg', 'a37b1-285_281.jpg', '2c9b3-288_349.jpg', '', '', '', '', '', '', 'AdresAdresAdresAdresAdresAdresAdres', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d51286.798267810045!2d31.977632510233228!3d36.54386683800271!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x14dca27b822cd5fb%3A0xd160c1c8b3dc170b!2sAlanya%2C%20Antalya!5e0!3m2!1str!2str!4v1671696104143!5m2!1str!2str\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>', '', '', '', '', '', '', 'Alanya Arsa 5', 'Alanya', '7500000', NULL, '220', NULL, NULL, NULL, NULL, NULL, '<p>Alanya ArsaAlanya ArsaAlanya ArsaAlanya Arsa</p>\r\n\r\n<p>Alanya ArsaAlanya ArsaAlanya ArsaAlanya ArsaAlanya ArsaAlanya Arsa</p>\r\n\r\n<p>Alanya ArsaAlanya ArsaAlanya ArsaAlanya ArsaAlanya ArsaAlanya ArsaAlanya ArsaAlanya Arsa</p>\r\n', '<p>-Alanya Arsa</p>\r\n\r\n<p>-Alanya Arsa</p>\r\n\r\n<p>-Alanya Arsa</p>\r\n\r\n<p>-Alanya Arsa</p>\r\n\r\n<p>-Alanya Arsa</p>\r\n', NULL, '05432354576', 'Deneme Mahallesi, DENEME CADDESİ NO 36/2 aLANYA/antalya', '2022-12-22', 1, 1, '', '', '', '', 'Alanya Arsa 5', 'Alanya', '7500000', '', '220', '', '', '', '', '', '<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n\r\n<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n\r\n<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n', '<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n', '', '0543 123 45 67', 'AdresAdresAdresAdresAdresAdresAdres', '2022-12-22', '', '', '', '', '', '', '', '56964-katalog.pdf', ''),
(26, 'Alanya Arsa 6', 'Alanya', 3, 0, 'arsa', '', '', '0000-00-00', '7500000', '', '220', '', '', '', '', '', '<p>A&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ık</p>\r\n\r\n<p>A&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ık</p>\r\n\r\n<p>A&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ıkA&ccedil;ık</p>\r\n', '<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n', '', '0543 123 45 67', 'alanya-arsa-6', '7eeb1-286_358.jpg', 'a37b1-285_281.jpg', '2c9b3-288_349.jpg', '', '', '', '', '', '', 'AdresAdresAdresAdresAdresAdresAdres', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d51286.798267810045!2d31.977632510233228!3d36.54386683800271!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x14dca27b822cd5fb%3A0xd160c1c8b3dc170b!2sAlanya%2C%20Antalya!5e0!3m2!1str!2str!4v1671696104143!5m2!1str!2str\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>', '', '', '', '', '', '', 'Alanya Arsa 6', 'Alanya', '7500000', NULL, '220', NULL, NULL, NULL, NULL, NULL, '<p>Alanya ArsaAlanya ArsaAlanya ArsaAlanya Arsa</p>\r\n\r\n<p>Alanya ArsaAlanya ArsaAlanya ArsaAlanya ArsaAlanya ArsaAlanya Arsa</p>\r\n\r\n<p>Alanya ArsaAlanya ArsaAlanya ArsaAlanya ArsaAlanya ArsaAlanya ArsaAlanya ArsaAlanya Arsa</p>\r\n', '<p>-Alanya Arsa</p>\r\n\r\n<p>-Alanya Arsa</p>\r\n\r\n<p>-Alanya Arsa</p>\r\n\r\n<p>-Alanya Arsa</p>\r\n\r\n<p>-Alanya Arsa</p>\r\n', NULL, '05432354576', 'Deneme Mahallesi, DENEME CADDESİ NO 36/2 aLANYA/antalya', '2022-12-22', 1, 1, '', '', '', '', 'Alanya Arsa 6', 'Alanya', '7500000', '', '220', '', '', '', '', '', '<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n\r\n<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n\r\n<p>A&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklamaA&ccedil;ıklama</p>\r\n', '<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n\r\n<p>-&Ouml;zellik</p>\r\n', '', '0543 123 45 67', 'AdresAdresAdresAdresAdresAdresAdres', '2022-12-22', '', '', '', '', '', '', '', '56964-katalog.pdf', '');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `proje_fiyat`
--

CREATE TABLE `proje_fiyat` (
  `proje_fiyat_id` int(11) NOT NULL,
  `pr_id` int(11) NOT NULL,
  `unit_type` int(11) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `proje_ozellik`
--

CREATE TABLE `proje_ozellik` (
  `proje_ozellik_id` int(11) NOT NULL,
  `ozellik_adi` varchar(225) NOT NULL,
  `ozellik_adi_ar` varchar(550) DEFAULT NULL,
  `ozellik_adi_frs` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `proje_ozellik`
--

INSERT INTO `proje_ozellik` (`proje_ozellik_id`, `ozellik_adi`, `ozellik_adi_ar`, `ozellik_adi_frs`) VALUES
(22, 'ADSL', 'ADSL', 'ADSL'),
(23, 'Ahşap Doğrama', 'Ahşap Doğrama', 'Ahşap Doğrama'),
(24, 'Akıllı Ev', 'Akıllı Ev', 'Akıllı Ev'),
(25, 'Alarm (Hırsız)', 'Alarm (Hırsız)', 'Alarm (Hırsız)'),
(26, 'Alarm (Yangın)', 'Alarm (Yangın)', 'Alarm (Yangın)'),
(27, 'Alaturka Tuvalet', 'Alaturka Tuvalet', 'Alaturka Tuvalet'),
(28, 'Amerikan Mutfak', 'Amerikan Mutfak', 'Amerikan Mutfak'),
(29, 'Ankastre Fırın', 'Ankastre Fırın', 'Ankastre Fırın'),
(30, 'Asansör', 'Asansör', 'Asansör'),
(31, 'Balkon', 'Balkon', 'Balkon'),
(32, 'Barbekü', 'Barbekü', 'Barbekü'),
(33, 'Beyaz Eşya', 'Beyaz Eşya', 'Beyaz Eşya'),
(34, 'Boyalı', 'Boyalı', 'Boyalı'),
(35, 'Bulaşık Makinesi', 'Bulaşık Makinesi', 'Bulaşık Makinesi'),
(36, 'Buzdolabı', 'Buzdolabı', 'Buzdolabı'),
(37, 'Duvar Kağıdı', 'Duvar Kağıdı', 'Duvar Kağıdı'),
(38, 'Duşakabin', 'Duşakabin', 'Duşakabin'),
(39, 'Ebeveyn Banyosu', 'Ebeveyn Banyosu', 'Ebeveyn Banyosu'),
(40, 'Fiber İnternet', 'Fiber İnternet', 'Fiber İnternet'),
(41, 'Fırın', 'Fırın', 'Fırın'),
(42, 'Giyinme Odası', 'Giyinme Odası', 'Giyinme Odası'),
(43, 'Gömme Dolap', 'Gömme Dolap', 'Gömme Dolap'),
(44, 'Görüntülü Diafon', 'Görüntülü Diafon', 'Görüntülü Diafon'),
(45, 'Hilton Banyo', 'Hilton Banyo', 'Hilton Banyo'),
(46, 'Intercom Sistemi', 'Intercom Sistemi', 'Intercom Sistemi'),
(47, 'Isıcam', 'Isıcam', 'Isıcam'),
(48, 'Jakuzi', 'Jakuzi', 'Jakuzi'),
(49, 'Kartonpiyer', 'Kartonpiyer', 'Kartonpiyer'),
(50, 'Kiler', 'Kiler', 'Kiler'),
(51, 'Klima', 'Klima', 'Klima'),
(52, 'Laminat Zemin', 'Laminat Zemin', 'Laminat Zemin'),
(53, 'Marley', 'Marley', 'Marley'),
(54, 'Mobilya', 'Mobilya', 'Mobilya'),
(55, 'Mutfak (Ankastre)', 'Mutfak (Ankastre)', 'Mutfak (Ankastre)'),
(56, 'Mutfak (Laminat)', 'Mutfak (Laminat)', 'Mutfak (Laminat)'),
(57, 'Mutfak Doğalgazı', 'Mutfak Doğalgazı', 'Mutfak Doğalgazı'),
(58, 'PVC Doğrama', 'PVC Doğrama', 'PVC Doğrama'),
(59, 'Panjur', 'Panjur', 'Panjur'),
(60, 'Parke Zemin', 'Parke Zemin', 'Parke Zemin'),
(61, 'Sauna', 'Sauna', 'Sauna'),
(62, 'Seramik Zemin', 'Seramik Zemin', 'Seramik Zemin'),
(63, 'Set Üstü Ocak', 'Set Üstü Ocak', 'Set Üstü Ocak'),
(64, 'Spot Aydınlatma', 'Spot Aydınlatma', 'Spot Aydınlatma'),
(65, 'Teras', 'Teras', 'Teras'),
(66, 'Vestiyer', 'Vestiyer', 'Vestiyer'),
(67, 'Wi-Fi', 'Wi-Fi', 'Wi-Fi'),
(68, 'Çamaşır Makinesi', 'Çamaşır Makinesi', 'Çamaşır Makinesi'),
(69, 'Çamaşır Odası', 'Çamaşır Odası', 'Çamaşır Odası'),
(70, 'Çelik Kapı', 'Çelik Kapı', 'Çelik Kapı'),
(71, 'Şofben', 'Şofben', 'Şofben'),
(72, 'Şömine', 'Şömine', 'Şömine');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `proje_ozellik_iliski`
--

CREATE TABLE `proje_ozellik_iliski` (
  `proje_id` int(11) NOT NULL,
  `proje_ozellik_id` int(11) NOT NULL,
  `priority` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `proje_ozellik_iliski`
--

INSERT INTO `proje_ozellik_iliski` (`proje_id`, `proje_ozellik_id`, `priority`) VALUES
(62, 24, 0),
(62, 31, 1),
(62, 35, 2),
(62, 38, 3),
(63, 24, 0),
(63, 31, 1),
(63, 70, 2),
(63, 38, 3),
(63, 41, 4),
(63, 51, 5),
(63, 61, 6),
(63, 65, 7),
(63, 66, 8),
(64, 24, 0),
(64, 30, 1),
(64, 31, 2),
(64, 35, 3),
(64, 70, 4),
(64, 38, 5),
(64, 51, 6),
(64, 61, 7),
(64, 65, 8),
(65, 24, 0),
(65, 29, 1),
(65, 30, 2),
(65, 31, 3),
(65, 35, 4),
(65, 70, 5),
(65, 38, 6),
(65, 39, 7),
(66, 22, 0),
(66, 24, 1),
(66, 25, 2),
(66, 30, 3),
(66, 31, 4),
(66, 35, 5),
(66, 70, 6),
(66, 38, 7),
(66, 44, 8),
(66, 51, 9),
(66, 61, 10),
(66, 65, 11),
(68, 24, 0),
(68, 25, 1),
(68, 31, 2),
(68, 35, 3),
(68, 70, 4),
(68, 38, 5),
(68, 41, 6),
(68, 51, 7),
(69, 24, 0),
(69, 25, 1),
(69, 30, 2),
(69, 31, 3),
(69, 35, 4),
(69, 70, 5),
(69, 38, 6),
(70, 22, 0),
(70, 24, 1),
(70, 25, 2),
(70, 31, 3),
(70, 35, 4),
(70, 70, 5),
(70, 38, 6),
(70, 40, 7),
(70, 41, 8),
(70, 43, 9),
(71, 22, 0),
(71, 28, 1),
(71, 29, 2),
(71, 30, 3),
(71, 31, 4),
(71, 35, 5),
(71, 41, 6),
(71, 51, 7),
(72, 22, 0),
(72, 24, 1),
(72, 25, 2),
(72, 31, 3),
(72, 32, 4),
(72, 35, 5),
(72, 38, 6),
(72, 39, 7),
(72, 42, 8),
(72, 43, 9),
(72, 72, 10),
(72, 65, 11),
(74, 22, 0),
(74, 24, 1),
(74, 25, 2),
(74, 30, 3),
(74, 31, 4),
(74, 35, 5),
(74, 70, 6),
(74, 38, 7),
(74, 39, 8),
(74, 40, 9),
(74, 41, 10),
(74, 42, 11),
(74, 43, 12),
(74, 51, 13),
(75, 22, 0),
(75, 24, 1),
(75, 25, 2),
(75, 30, 3),
(75, 31, 4),
(75, 35, 5),
(75, 70, 6),
(75, 38, 7),
(75, 39, 8),
(75, 40, 9),
(75, 41, 10),
(75, 42, 11),
(75, 43, 12),
(77, 22, 0),
(77, 24, 1),
(77, 25, 2),
(77, 30, 3),
(77, 31, 4),
(77, 35, 5),
(77, 38, 6),
(77, 39, 7),
(77, 40, 8),
(77, 41, 9),
(77, 42, 10),
(77, 43, 11),
(77, 51, 12),
(77, 52, 13),
(77, 55, 14),
(77, 61, 15),
(78, 22, 0),
(78, 23, 1),
(78, 25, 2),
(78, 30, 3),
(78, 31, 4),
(78, 70, 5),
(78, 38, 6),
(78, 39, 7),
(78, 42, 8),
(78, 43, 9),
(78, 44, 10),
(78, 51, 11),
(78, 55, 12),
(78, 65, 13),
(79, 22, 0),
(79, 24, 1),
(79, 25, 2),
(79, 30, 3),
(79, 31, 4),
(79, 35, 5),
(79, 70, 6),
(79, 38, 7),
(79, 39, 8),
(79, 40, 9),
(79, 41, 10),
(79, 42, 11),
(79, 43, 12),
(79, 44, 13),
(79, 50, 14),
(79, 51, 15),
(79, 55, 16),
(79, 61, 17),
(79, 66, 18),
(79, 67, 19),
(80, 22, 0),
(80, 23, 1),
(80, 24, 2),
(80, 25, 3),
(80, 29, 4),
(80, 30, 5),
(80, 31, 6),
(80, 35, 7),
(1, 23, 0),
(1, 24, 1),
(1, 25, 2),
(1, 27, 3),
(1, 28, 4),
(7, 24, 0),
(7, 25, 1),
(7, 27, 2),
(13, 23, 0),
(13, 24, 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `proje_resimler`
--

CREATE TABLE `proje_resimler` (
  `id` int(11) NOT NULL,
  `proje_id` varchar(225) NOT NULL,
  `foto` varchar(225) NOT NULL,
  `alt` varchar(225) NOT NULL,
  `title` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `proje_resimler`
--

INSERT INTO `proje_resimler` (`id`, `proje_id`, `foto`, `alt`, `title`) VALUES
(1, '1', '33e359c458ca814c1d005660cfc99fdb.jpg', '', ''),
(2, '1', '85944dee9039c990bcd8cb70c7412370.jpg', '', ''),
(3, '2', '33e359c458ca814c1d005660cfc99fdb.jpg', '', ''),
(4, '3', '33e359c458ca814c1d005660cfc99fdb.jpg', '', ''),
(5, '4', '33e359c458ca814c1d005660cfc99fdb.jpg', '', ''),
(6, '5', '33e359c458ca814c1d005660cfc99fdb.jpg', '', ''),
(7, '6', '33e359c458ca814c1d005660cfc99fdb.jpg', '', ''),
(8, '7', '33e359c458ca814c1d005660cfc99fdb.jpg', '', ''),
(9, '8', '33e359c458ca814c1d005660cfc99fdb.jpg', '', ''),
(10, '9', '33e359c458ca814c1d005660cfc99fdb.jpg', '', ''),
(11, '2', '85944dee9039c990bcd8cb70c7412370.jpg', '', ''),
(12, '3', '85944dee9039c990bcd8cb70c7412370.jpg', '', ''),
(13, '4', '85944dee9039c990bcd8cb70c7412370.jpg', '', ''),
(14, '5', '85944dee9039c990bcd8cb70c7412370.jpg', '', ''),
(15, '6', '85944dee9039c990bcd8cb70c7412370.jpg', '', ''),
(16, '7', '85944dee9039c990bcd8cb70c7412370.jpg', '', ''),
(17, '8', '85944dee9039c990bcd8cb70c7412370.jpg', '', ''),
(18, '9', '85944dee9039c990bcd8cb70c7412370.jpg', '', ''),
(19, '10', '33e359c458ca814c1d005660cfc99fdb.jpg', '', ''),
(20, '11', '33e359c458ca814c1d005660cfc99fdb.jpg', '', ''),
(21, '12', '33e359c458ca814c1d005660cfc99fdb.jpg', '', ''),
(22, '13', '33e359c458ca814c1d005660cfc99fdb.jpg', '', ''),
(25, '16', '33e359c458ca814c1d005660cfc99fdb.jpg', '', ''),
(26, '17', '33e359c458ca814c1d005660cfc99fdb.jpg', '', ''),
(27, '18', '33e359c458ca814c1d005660cfc99fdb.jpg', '', ''),
(28, '19', '33e359c458ca814c1d005660cfc99fdb.jpg', '', ''),
(29, '20', '33e359c458ca814c1d005660cfc99fdb.jpg', '', ''),
(30, '10', '85944dee9039c990bcd8cb70c7412370.jpg', '', ''),
(31, '11', '85944dee9039c990bcd8cb70c7412370.jpg', '', ''),
(32, '12', '85944dee9039c990bcd8cb70c7412370.jpg', '', ''),
(33, '13', '85944dee9039c990bcd8cb70c7412370.jpg', '', ''),
(36, '16', '85944dee9039c990bcd8cb70c7412370.jpg', '', ''),
(37, '17', '85944dee9039c990bcd8cb70c7412370.jpg', '', ''),
(38, '18', '85944dee9039c990bcd8cb70c7412370.jpg', '', ''),
(39, '19', '85944dee9039c990bcd8cb70c7412370.jpg', '', ''),
(40, '20', '85944dee9039c990bcd8cb70c7412370.jpg', '', ''),
(41, '21', '33e359c458ca814c1d005660cfc99fdb.jpg', '', ''),
(42, '22', '33e359c458ca814c1d005660cfc99fdb.jpg', '', ''),
(43, '23', '33e359c458ca814c1d005660cfc99fdb.jpg', '', ''),
(44, '24', '33e359c458ca814c1d005660cfc99fdb.jpg', '', ''),
(45, '25', '33e359c458ca814c1d005660cfc99fdb.jpg', '', ''),
(46, '21', '85944dee9039c990bcd8cb70c7412370.jpg', '', ''),
(47, '22', '85944dee9039c990bcd8cb70c7412370.jpg', '', ''),
(48, '23', '85944dee9039c990bcd8cb70c7412370.jpg', '', ''),
(49, '24', '85944dee9039c990bcd8cb70c7412370.jpg', '', ''),
(50, '25', '85944dee9039c990bcd8cb70c7412370.jpg', '', '');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `proje_tip`
--

CREATE TABLE `proje_tip` (
  `proje_tip_id` int(11) NOT NULL,
  `tip_adi` varchar(225) NOT NULL,
  `tip_adi_ar` varchar(550) DEFAULT NULL,
  `tip_adi_frs` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `proje_tip`
--

INSERT INTO `proje_tip` (`proje_tip_id`, `tip_adi`, `tip_adi_ar`, `tip_adi_frs`) VALUES
(10, 'Bargained Projects', 'Anlaşmalı Projeler', 'ТОРГОВЫЕ ПРОЕКТЫ'),
(11, 'Family Living', 'Aile Yaşamı', 'СЕМЕЙНАЯ ЖИЗНЬ'),
(12, 'Investment Deals', 'Yatırım Fırsatları', 'ИНВЕСТИЦИОННЫЕ ВОЗМОЖНОСТИ'),
(13, 'Investors Choice', 'Yatırımcıların Seçimi', 'ВЫБОР ИНВЕСТОРА'),
(14, 'Residence', 'Konut', 'РЕЗИДЕНЦИЯ'),
(15, 'Villa', 'Villa', 'ВИЛЛА'),
(16, 'Commercial', 'Ticari', 'КОММЕРЧЕСКИЙ'),
(17, 'Home Office', 'Home Ofis', 'ДОМАШНИЙ ОФИС');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `proje_tip_iliski`
--

CREATE TABLE `proje_tip_iliski` (
  `proje_id` int(11) NOT NULL,
  `proje_tip_id` int(11) NOT NULL,
  `priority` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `proje_tip_iliski`
--

INSERT INTO `proje_tip_iliski` (`proje_id`, `proje_tip_id`, `priority`) VALUES
(1, 11, 0),
(1, 17, 1),
(1, 12, 2),
(1, 13, 3),
(94, 18, 0),
(94, 11, 1),
(94, 17, 2),
(94, 14, 3),
(103, 10, 0),
(103, 11, 1),
(103, 17, 2),
(103, 12, 3),
(103, 13, 4),
(103, 14, 5),
(106, 12, 1),
(106, 13, 2),
(106, 14, 3),
(100, 11, 0),
(100, 12, 1),
(100, 13, 2),
(100, 14, 3),
(99, 11, 0),
(99, 17, 1),
(99, 12, 2),
(99, 13, 3),
(99, 14, 4),
(97, 11, 0),
(97, 12, 1),
(97, 13, 2),
(97, 14, 3),
(91, 10, 0),
(91, 11, 1),
(91, 17, 2),
(91, 12, 3),
(91, 13, 4),
(91, 14, 5),
(98, 18, 0),
(98, 11, 1),
(98, 17, 2),
(98, 12, 3),
(98, 13, 4),
(98, 14, 5),
(7, 11, 0),
(7, 17, 1),
(19, 11, 0),
(19, 12, 1),
(19, 14, 2),
(2, 11, 0),
(2, 13, 1),
(4, 10, 0),
(4, 11, 1),
(4, 14, 2),
(5, 11, 0),
(5, 12, 1),
(3, 10, 0),
(6, 10, 0),
(8, 10, 0),
(9, 11, 0),
(9, 15, 1),
(10, 11, 0),
(11, 17, 0),
(11, 12, 1),
(11, 13, 2),
(11, 14, 3),
(12, 10, 0),
(12, 12, 1),
(13, 13, 3),
(14, 11, 0),
(14, 13, 1),
(14, 14, 2),
(17, 12, 0),
(18, 10, 0),
(18, 11, 1),
(18, 12, 2),
(20, 11, 0),
(20, 12, 1),
(20, 13, 2),
(21, 11, 0),
(21, 12, 1),
(21, 13, 2),
(22, 11, 0),
(22, 12, 1),
(22, 13, 2),
(23, 10, 0),
(23, 11, 1),
(23, 12, 2),
(24, 11, 0),
(24, 12, 1),
(24, 13, 2),
(24, 14, 3),
(25, 11, 0),
(25, 12, 1),
(25, 13, 2),
(27, 11, 0),
(27, 13, 1),
(27, 14, 2),
(28, 11, 0),
(28, 13, 1),
(28, 14, 2),
(29, 11, 0),
(29, 12, 1),
(29, 14, 2),
(30, 11, 0),
(30, 13, 1),
(30, 14, 2),
(31, 11, 0),
(31, 14, 1),
(32, 11, 0),
(32, 12, 1),
(32, 14, 2),
(33, 11, 0),
(33, 12, 1),
(33, 14, 2),
(34, 10, 0),
(34, 11, 1),
(34, 12, 2),
(34, 13, 3),
(34, 14, 4),
(35, 11, 0),
(35, 12, 1),
(36, 10, 0),
(36, 11, 1),
(36, 12, 2),
(36, 13, 3),
(36, 14, 4),
(37, 11, 0),
(37, 12, 1),
(37, 13, 2),
(37, 14, 3),
(37, 15, 4),
(38, 10, 0),
(38, 11, 1),
(38, 17, 2),
(38, 12, 3),
(38, 13, 4),
(38, 14, 5),
(39, 10, 0),
(39, 11, 1),
(39, 17, 2),
(39, 12, 3),
(39, 13, 4),
(39, 14, 5),
(40, 10, 0),
(40, 11, 1),
(40, 17, 2),
(40, 12, 3),
(40, 13, 4),
(40, 14, 5),
(41, 10, 0),
(41, 11, 1),
(41, 17, 2),
(41, 12, 3),
(41, 13, 4),
(41, 14, 5),
(42, 10, 0),
(42, 11, 1),
(42, 17, 2),
(42, 12, 3),
(42, 13, 4),
(42, 14, 5),
(43, 11, 0),
(43, 12, 1),
(43, 15, 2),
(44, 11, 0),
(44, 12, 1),
(44, 14, 2),
(45, 11, 0),
(45, 12, 1),
(45, 14, 2),
(45, 15, 3),
(46, 11, 0),
(46, 13, 1),
(47, 17, 0),
(47, 12, 1),
(47, 13, 2),
(47, 14, 3),
(48, 11, 0),
(48, 17, 1),
(48, 12, 2),
(48, 13, 3),
(48, 14, 4),
(49, 17, 0),
(49, 12, 1),
(49, 13, 2),
(49, 14, 3),
(50, 10, 0),
(50, 11, 1),
(50, 17, 2),
(50, 12, 3),
(50, 13, 4),
(50, 14, 5),
(51, 11, 0),
(51, 17, 1),
(51, 12, 2),
(51, 13, 3),
(51, 14, 4),
(52, 10, 0),
(52, 11, 1),
(52, 12, 2),
(52, 13, 3),
(52, 14, 4),
(53, 11, 0),
(53, 13, 1),
(53, 15, 2),
(54, 11, 0),
(54, 17, 1),
(54, 12, 2),
(54, 14, 3),
(55, 11, 0),
(55, 12, 1),
(55, 13, 2),
(55, 14, 3),
(56, 10, 0),
(56, 11, 1),
(56, 12, 2),
(56, 13, 3),
(56, 14, 4),
(57, 11, 0),
(57, 14, 1),
(58, 12, 0),
(58, 13, 1),
(58, 14, 2),
(59, 10, 0),
(59, 11, 1),
(59, 12, 2),
(59, 13, 3),
(59, 14, 4),
(60, 11, 0),
(60, 13, 1),
(60, 15, 2),
(61, 10, 0),
(61, 11, 1),
(61, 12, 2),
(62, 18, 0),
(62, 16, 1),
(62, 11, 2),
(62, 17, 3),
(62, 12, 4),
(62, 14, 5),
(105, 18, 0),
(105, 12, 1),
(105, 13, 2),
(104, 18, 0),
(104, 11, 1),
(104, 12, 2),
(104, 13, 3),
(63, 18, 0),
(63, 12, 1),
(63, 13, 2),
(63, 14, 3),
(102, 18, 0),
(102, 11, 1),
(102, 12, 2),
(102, 13, 3),
(102, 14, 4),
(101, 18, 0),
(101, 11, 1),
(101, 12, 2),
(101, 13, 3),
(101, 14, 4),
(64, 18, 0),
(64, 16, 1),
(64, 11, 2),
(64, 12, 3),
(64, 13, 4),
(64, 14, 5),
(65, 18, 0),
(65, 11, 1),
(65, 12, 2),
(65, 13, 3),
(65, 14, 4),
(66, 18, 0),
(66, 11, 1),
(66, 12, 2),
(66, 13, 3),
(66, 14, 4),
(67, 18, 0),
(67, 11, 1),
(67, 12, 2),
(67, 13, 3),
(67, 14, 4),
(68, 18, 0),
(68, 16, 1),
(68, 11, 2),
(68, 12, 3),
(68, 13, 4),
(68, 14, 5),
(69, 18, 0),
(69, 11, 1),
(69, 17, 2),
(69, 12, 3),
(69, 13, 4),
(69, 14, 5),
(96, 18, 0),
(96, 11, 1),
(96, 13, 2),
(96, 14, 3),
(70, 18, 0),
(70, 16, 1),
(70, 11, 2),
(70, 12, 3),
(70, 13, 4),
(70, 14, 5),
(95, 18, 0),
(95, 12, 1),
(95, 13, 2),
(95, 14, 3),
(71, 10, 0),
(71, 18, 1),
(71, 12, 2),
(71, 13, 3),
(72, 18, 0),
(72, 11, 1),
(72, 17, 2),
(72, 12, 3),
(72, 15, 4),
(93, 10, 0),
(93, 18, 1),
(93, 11, 2),
(93, 12, 3),
(93, 13, 4),
(93, 14, 5),
(92, 10, 0),
(92, 18, 1),
(92, 11, 2),
(92, 12, 3),
(92, 13, 4),
(92, 14, 5),
(73, 10, 0),
(73, 18, 1),
(73, 11, 2),
(73, 12, 3),
(73, 13, 4),
(73, 14, 5),
(90, 18, 0),
(90, 12, 1),
(90, 13, 2),
(90, 14, 3),
(74, 18, 0),
(74, 16, 1),
(74, 11, 2),
(74, 12, 3),
(74, 13, 4),
(89, 18, 0),
(89, 12, 1),
(89, 13, 2),
(89, 14, 3),
(88, 18, 0),
(88, 11, 1),
(88, 12, 2),
(88, 13, 3),
(88, 14, 4),
(75, 18, 0),
(75, 11, 1),
(75, 13, 2),
(75, 14, 3),
(87, 18, 0),
(87, 11, 1),
(87, 12, 2),
(87, 13, 3),
(87, 14, 4),
(86, 18, 0),
(86, 11, 1),
(86, 12, 2),
(86, 13, 3),
(86, 14, 4),
(76, 18, 0),
(76, 11, 1),
(76, 12, 2),
(76, 13, 3),
(76, 14, 4),
(85, 18, 0),
(85, 11, 1),
(85, 12, 2),
(85, 13, 3),
(85, 14, 4),
(77, 18, 0),
(77, 11, 1),
(77, 12, 2),
(77, 14, 3),
(84, 18, 0),
(84, 11, 1),
(84, 17, 2),
(84, 12, 3),
(84, 13, 4),
(84, 14, 5),
(83, 18, 0),
(83, 11, 1),
(83, 12, 2),
(83, 13, 3),
(83, 14, 4),
(78, 18, 0),
(78, 11, 1),
(78, 12, 2),
(78, 13, 3),
(78, 14, 4),
(79, 18, 0),
(79, 11, 1),
(79, 12, 2),
(79, 13, 3),
(79, 14, 4),
(81, 18, 0),
(81, 11, 1),
(81, 17, 2),
(81, 15, 3),
(80, 18, 0),
(80, 11, 1),
(80, 12, 2),
(80, 13, 3),
(80, 14, 4),
(107, 18, 0),
(107, 16, 1),
(107, 11, 2),
(107, 12, 3),
(107, 14, 4),
(106, 17, 0),
(108, 10, 0),
(108, 18, 1),
(108, 11, 2),
(108, 14, 3),
(109, 18, 0),
(109, 16, 1),
(109, 11, 2),
(109, 17, 3),
(109, 12, 4),
(109, 14, 5),
(110, 18, 0),
(110, 11, 1),
(110, 17, 2),
(110, 12, 3),
(110, 13, 4),
(110, 14, 5),
(111, 10, 0),
(111, 18, 1),
(111, 11, 2),
(111, 12, 3),
(111, 14, 4),
(112, 18, 0),
(112, 11, 1),
(112, 12, 2),
(112, 13, 3),
(112, 14, 4),
(113, 10, 0),
(113, 18, 1),
(113, 11, 2),
(113, 12, 3),
(113, 14, 4),
(114, 18, 0),
(114, 16, 1),
(114, 17, 2),
(114, 12, 3),
(114, 13, 4),
(114, 14, 5),
(13, 11, 0),
(13, 17, 1),
(13, 12, 2),
(13, 14, 4),
(13, 15, 5);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `servis`
--

CREATE TABLE `servis` (
  `servis_id` int(11) NOT NULL,
  `alan_1_baslik` varchar(225) NOT NULL,
  `alan_1_yazi` text NOT NULL,
  `alan_2_baslik` varchar(225) NOT NULL,
  `alan_2_yazi` text NOT NULL,
  `alan_3_baslik` varchar(225) NOT NULL,
  `alan_3_yazi` text NOT NULL,
  `alan_4_baslik` varchar(225) NOT NULL,
  `alan_4_yazi` text NOT NULL,
  `alan_1_baslik_ar` varchar(550) DEFAULT NULL,
  `alan_1_yazi_ar` text,
  `alan_2_baslik_ar` varchar(550) DEFAULT NULL,
  `alan_2_yazi_ar` text,
  `alan_3_baslik_ar` varchar(550) DEFAULT NULL,
  `alan_3_yazi_ar` text,
  `alan_4_baslik_ar` varchar(550) DEFAULT NULL,
  `alan_4_yazi_ar` text,
  `alan_1_baslik_frs` varchar(225) NOT NULL,
  `alan_1_yazi_frs` text NOT NULL,
  `alan_2_baslik_frs` varchar(225) NOT NULL,
  `alan_2_yazi_frs` text NOT NULL,
  `alan_3_baslik_frs` varchar(225) NOT NULL,
  `alan_3_yazi_frs` text NOT NULL,
  `alan_4_baslik_frs` varchar(225) NOT NULL,
  `alan_4_yazi_frs` text NOT NULL,
  `resim_1` varchar(225) NOT NULL,
  `resim_2` varchar(225) NOT NULL,
  `resim_3` varchar(225) NOT NULL,
  `resim_4` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `servis`
--

INSERT INTO `servis` (`servis_id`, `alan_1_baslik`, `alan_1_yazi`, `alan_2_baslik`, `alan_2_yazi`, `alan_3_baslik`, `alan_3_yazi`, `alan_4_baslik`, `alan_4_yazi`, `alan_1_baslik_ar`, `alan_1_yazi_ar`, `alan_2_baslik_ar`, `alan_2_yazi_ar`, `alan_3_baslik_ar`, `alan_3_yazi_ar`, `alan_4_baslik_ar`, `alan_4_yazi_ar`, `alan_1_baslik_frs`, `alan_1_yazi_frs`, `alan_2_baslik_frs`, `alan_2_yazi_frs`, `alan_3_baslik_frs`, `alan_3_yazi_frs`, `alan_4_baslik_frs`, `alan_4_yazi_frs`, `resim_1`, `resim_2`, `resim_3`, `resim_4`) VALUES
(3, 'REAL ESTATE TOURS', '<p>Whenever you decide to buy a property in Turkey, our expert team members are ready to guide you by visiting real estate projects with you</p>\n', 'CONSULTING', '<p>As real estate advisory services, we are advising whatever we invested and tested before with our more than 10 years experience in the market</p>\n', 'MANAGEMENT', '<p>With our expert team, we are helping for the procedures according to your needs such as&nbsp;residency permit, issuing title deed or applying for citizenship</p>\n', 'MARKETING', '<p>After you invest in Turkey, you don&#39;t need to think about the rest. We can help you to furnish your apartment, find&nbsp;tenant or find next buyer as well</p>\n', 'Türkçe Başlık', '<p>T&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erik</p>\r\n\r\n<p>T&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erik</p>\r\n\r\n<p>T&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erik</p>\r\n', 'Türkçe Başlık', '<p>T&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erik</p>\r\n\r\n<p>T&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erik</p>\r\n\r\n<p>T&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erik</p>\r\n', 'Türkçe Başlık', '<p>T&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erik</p>\r\n\r\n<p>T&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erik</p>\r\n\r\n<p>T&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erik</p>\r\n', 'Türkçe Başlık', '<p>T&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erik</p>\r\n\r\n<p>T&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erik</p>\r\n\r\n<p>T&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erikT&uuml;rk&ccedil;e İ&ccedil;erik</p>\r\n', 'Rusça Başlık', '<p>Rus&ccedil;a İ&ccedil;erikRus&ccedil;a İ&ccedil;erikRus&ccedil;a İ&ccedil;erikRus&ccedil;a İ&ccedil;erikRus&ccedil;a İ&ccedil;erik</p>\r\n\r\n<p>Rus&ccedil;a İ&ccedil;erikRus&ccedil;a İ&ccedil;erikRus&ccedil;a İ&ccedil;erikRus&ccedil;a İ&ccedil;erikRus&ccedil;a İ&ccedil;erikRus&ccedil;a İ&ccedil;erik</p>\r\n\r\n<p>Rus&ccedil;a İ&ccedil;erikRus&ccedil;a İ&ccedil;erikRus&ccedil;a İ&ccedil;erikRus&ccedil;a İ&ccedil;erikRus&ccedil;a İ&ccedil;erikRus&ccedil;a İ&ccedil;erikRus&ccedil;a İ&ccedil;erik</p>\r\n', 'Rusça Başlık', '<p>Rus&ccedil;a İ&ccedil;erikRus&ccedil;a İ&ccedil;erikRus&ccedil;a İ&ccedil;erikRus&ccedil;a İ&ccedil;erikRus&ccedil;a İ&ccedil;erik</p>\r\n\r\n<p>Rus&ccedil;a İ&ccedil;erikRus&ccedil;a İ&ccedil;erikRus&ccedil;a İ&ccedil;erikRus&ccedil;a İ&ccedil;erikRus&ccedil;a İ&ccedil;erikRus&ccedil;a İ&ccedil;erik</p>\r\n\r\n<p>Rus&ccedil;a İ&ccedil;erikRus&ccedil;a İ&ccedil;erikRus&ccedil;a İ&ccedil;erikRus&ccedil;a İ&ccedil;erikRus&ccedil;a İ&ccedil;erikRus&ccedil;a İ&ccedil;erikRus&ccedil;a İ&ccedil;erik</p>\r\n', 'Rusça Başlık', '<p>Rus&ccedil;a İ&ccedil;erikRus&ccedil;a İ&ccedil;erikRus&ccedil;a İ&ccedil;erikRus&ccedil;a İ&ccedil;erikRus&ccedil;a İ&ccedil;erik</p>\r\n\r\n<p>Rus&ccedil;a İ&ccedil;erikRus&ccedil;a İ&ccedil;erikRus&ccedil;a İ&ccedil;erikRus&ccedil;a İ&ccedil;erikRus&ccedil;a İ&ccedil;erikRus&ccedil;a İ&ccedil;erik</p>\r\n\r\n<p>Rus&ccedil;a İ&ccedil;erikRus&ccedil;a İ&ccedil;erikRus&ccedil;a İ&ccedil;erikRus&ccedil;a İ&ccedil;erikRus&ccedil;a İ&ccedil;erikRus&ccedil;a İ&ccedil;erikRus&ccedil;a İ&ccedil;erik</p>\r\n', 'Rusça Başlık', '<p>Rus&ccedil;a İ&ccedil;erikRus&ccedil;a İ&ccedil;erikRus&ccedil;a İ&ccedil;erikRus&ccedil;a İ&ccedil;erikRus&ccedil;a İ&ccedil;erik</p>\r\n\r\n<p>Rus&ccedil;a İ&ccedil;erikRus&ccedil;a İ&ccedil;erikRus&ccedil;a İ&ccedil;erikRus&ccedil;a İ&ccedil;erikRus&ccedil;a İ&ccedil;erikRus&ccedil;a İ&ccedil;erik</p>\r\n\r\n<p>Rus&ccedil;a İ&ccedil;erikRus&ccedil;a İ&ccedil;erikRus&ccedil;a İ&ccedil;erikRus&ccedil;a İ&ccedil;erikRus&ccedil;a İ&ccedil;erikRus&ccedil;a İ&ccedil;erikRus&ccedil;a İ&ccedil;erik</p>\r\n', '18c56-i2.png', 'dc7bb-i2.png', '34604-i2.png', 'aa128-i2.png');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `unite_tip`
--

CREATE TABLE `unite_tip` (
  `unite_tip_id` int(11) NOT NULL,
  `unite_adi` varchar(225) NOT NULL,
  `unite_adi_ar` varchar(550) DEFAULT NULL,
  `unite_adi_frs` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `unite_tip`
--

INSERT INTO `unite_tip` (`unite_tip_id`, `unite_adi`, `unite_adi_ar`, `unite_adi_frs`) VALUES
(6, 'Penthouse', 'Penthouse', ''),
(7, '1+0', '1+0', ''),
(8, '1+0 Studio', '1+0 Studio', ''),
(9, '1+1', '1+1', ''),
(10, '2+1', '2+1', ''),
(11, '3+1', '3+1', ''),
(12, '2+2', '2+2', ''),
(13, '3+2', '3+2', ''),
(14, '4+1', '4+1', ''),
(15, '4+2', '4+2', ''),
(16, '4+3', '4+3', ''),
(17, '5+1', '5+1', ''),
(18, '5+2', '5+2', ''),
(19, '5+3', '5+3', ''),
(20, '6+1', '6+1', ''),
(21, '6+2', '6+2', ''),
(22, '6+3', '6+3', ''),
(23, '7+1', '7+1', ''),
(24, '7+2', '7+2', ''),
(25, '7+3', '7+3', ''),
(26, '8+1', '8+1', ''),
(27, '8+2', '8+2', ''),
(28, '8+3', '8+3', ''),
(29, '8+4', '8+4', ''),
(30, '9+1', '9+1', ''),
(31, '9+2', '9+2', ''),
(32, '9+3', '9+3', ''),
(33, '9+4', '9+4', ''),
(34, '9+5', '9+5', ''),
(35, '10 and above', '10 and above', '');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `unite_tip_iliski`
--

CREATE TABLE `unite_tip_iliski` (
  `proje_id` int(11) NOT NULL,
  `unite_tip_id` int(11) NOT NULL,
  `priority` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `unite_tip_iliski`
--

INSERT INTO `unite_tip_iliski` (`proje_id`, `unite_tip_id`, `priority`) VALUES
(1, 9, 1),
(1, 10, 3),
(94, 9, 0),
(94, 10, 1),
(94, 11, 2),
(103, 8, 0),
(103, 9, 1),
(103, 10, 2),
(103, 11, 3),
(103, 14, 4),
(106, 9, 1),
(106, 10, 2),
(100, 10, 0),
(100, 11, 1),
(100, 14, 2),
(99, 9, 0),
(99, 10, 1),
(99, 11, 2),
(99, 14, 3),
(99, 17, 4),
(97, 8, 0),
(97, 9, 1),
(97, 10, 2),
(97, 11, 3),
(97, 14, 4),
(91, 8, 0),
(91, 9, 1),
(91, 10, 2),
(91, 11, 3),
(91, 14, 4),
(98, 10, 0),
(98, 11, 1),
(98, 14, 2),
(98, 17, 3),
(7, 9, 0),
(19, 9, 0),
(19, 10, 1),
(19, 11, 2),
(2, 10, 0),
(2, 11, 1),
(2, 14, 2),
(4, 9, 0),
(4, 10, 1),
(4, 11, 2),
(4, 14, 3),
(5, 9, 0),
(5, 10, 1),
(5, 11, 2),
(5, 14, 3),
(3, 9, 0),
(3, 10, 1),
(3, 11, 2),
(6, 9, 0),
(6, 10, 1),
(6, 11, 2),
(8, 8, 0),
(8, 9, 1),
(8, 10, 2),
(8, 11, 3),
(9, 11, 0),
(9, 14, 1),
(9, 17, 2),
(10, 9, 0),
(10, 10, 1),
(10, 11, 2),
(10, 14, 3),
(11, 8, 0),
(11, 9, 1),
(11, 10, 2),
(11, 11, 3),
(12, 9, 0),
(12, 10, 1),
(12, 11, 2),
(12, 14, 3),
(13, 9, 1),
(14, 10, 0),
(14, 11, 1),
(14, 14, 2),
(17, 10, 0),
(17, 11, 1),
(17, 14, 2),
(18, 10, 0),
(18, 11, 1),
(18, 14, 2),
(20, 10, 0),
(20, 11, 1),
(20, 14, 2),
(21, 9, 0),
(21, 10, 1),
(21, 11, 2),
(21, 14, 3),
(22, 9, 0),
(22, 10, 1),
(22, 11, 2),
(22, 14, 3),
(23, 9, 0),
(23, 10, 1),
(23, 11, 2),
(24, 9, 0),
(24, 10, 1),
(24, 11, 2),
(24, 14, 3),
(25, 9, 0),
(25, 10, 1),
(25, 11, 2),
(27, 10, 0),
(27, 11, 1),
(27, 14, 2),
(28, 9, 0),
(28, 10, 1),
(28, 11, 2),
(29, 10, 0),
(29, 11, 1),
(29, 14, 2),
(30, 9, 0),
(30, 11, 1),
(31, 9, 0),
(31, 10, 1),
(31, 11, 2),
(31, 14, 3),
(31, 17, 4),
(32, 11, 0),
(32, 14, 1),
(33, 9, 0),
(33, 10, 1),
(33, 11, 2),
(34, 9, 0),
(34, 10, 1),
(34, 11, 2),
(34, 14, 3),
(34, 17, 4),
(35, 9, 0),
(35, 10, 1),
(35, 11, 2),
(36, 10, 0),
(36, 11, 1),
(37, 11, 0),
(38, 9, 0),
(38, 10, 1),
(38, 11, 2),
(39, 8, 0),
(39, 9, 1),
(39, 10, 2),
(40, 8, 0),
(40, 9, 1),
(40, 10, 2),
(40, 11, 3),
(41, 9, 0),
(41, 10, 1),
(42, 9, 0),
(42, 10, 1),
(43, 14, 0),
(44, 11, 0),
(45, 11, 0),
(46, 10, 0),
(47, 8, 0),
(47, 9, 1),
(47, 10, 2),
(47, 11, 3),
(47, 14, 4),
(48, 9, 0),
(48, 10, 1),
(48, 11, 2),
(48, 14, 3),
(49, 9, 0),
(49, 10, 1),
(50, 8, 0),
(50, 9, 1),
(50, 10, 2),
(50, 11, 3),
(51, 9, 0),
(51, 10, 1),
(51, 11, 2),
(51, 14, 3),
(52, 10, 0),
(53, 11, 0),
(53, 14, 1),
(54, 10, 0),
(54, 11, 1),
(54, 14, 2),
(55, 10, 0),
(55, 11, 1),
(55, 14, 2),
(56, 10, 0),
(56, 11, 1),
(57, 10, 0),
(57, 11, 1),
(57, 14, 2),
(57, 17, 3),
(58, 9, 0),
(58, 10, 1),
(59, 10, 0),
(59, 12, 1),
(59, 11, 2),
(60, 11, 0),
(60, 14, 1),
(60, 17, 2),
(61, 9, 0),
(61, 10, 1),
(61, 11, 2),
(61, 14, 3),
(62, 8, 0),
(62, 9, 1),
(62, 10, 2),
(62, 11, 3),
(62, 14, 4),
(105, 9, 0),
(105, 10, 1),
(104, 9, 0),
(104, 10, 1),
(104, 11, 2),
(63, 9, 0),
(63, 10, 1),
(63, 11, 2),
(101, 9, 0),
(101, 10, 1),
(101, 11, 2),
(101, 14, 3),
(101, 17, 4),
(64, 9, 0),
(64, 10, 1),
(64, 11, 2),
(64, 14, 3),
(64, 17, 4),
(65, 9, 0),
(65, 10, 1),
(65, 11, 2),
(66, 9, 0),
(66, 10, 1),
(66, 11, 2),
(67, 9, 0),
(67, 10, 1),
(67, 11, 2),
(67, 14, 3),
(68, 9, 0),
(68, 10, 1),
(68, 11, 2),
(68, 14, 3),
(68, 17, 4),
(69, 9, 0),
(69, 10, 1),
(69, 11, 2),
(96, 8, 0),
(96, 9, 1),
(96, 10, 2),
(96, 11, 3),
(96, 14, 4),
(70, 9, 0),
(70, 10, 1),
(70, 11, 2),
(70, 14, 3),
(95, 8, 0),
(95, 9, 1),
(95, 10, 2),
(71, 7, 0),
(71, 9, 1),
(71, 10, 2),
(72, 11, 0),
(72, 14, 1),
(72, 17, 2),
(93, 8, 0),
(93, 9, 1),
(93, 10, 2),
(93, 11, 3),
(93, 14, 4),
(93, 17, 5),
(92, 9, 0),
(92, 10, 1),
(92, 11, 2),
(73, 10, 0),
(90, 8, 1),
(90, 10, 2),
(74, 9, 0),
(74, 10, 1),
(74, 11, 2),
(74, 14, 3),
(89, 8, 0),
(89, 9, 1),
(89, 10, 2),
(89, 11, 3),
(88, 8, 0),
(88, 9, 1),
(88, 10, 2),
(88, 11, 3),
(88, 14, 4),
(75, 9, 0),
(75, 10, 1),
(75, 11, 2),
(75, 14, 3),
(87, 10, 0),
(87, 11, 1),
(86, 9, 0),
(86, 10, 1),
(86, 11, 2),
(76, 9, 0),
(76, 10, 1),
(76, 11, 2),
(85, 9, 0),
(85, 10, 1),
(85, 11, 2),
(85, 14, 3),
(77, 9, 0),
(77, 10, 1),
(77, 11, 2),
(77, 14, 3),
(84, 8, 0),
(84, 9, 1),
(84, 10, 2),
(84, 11, 3),
(83, 9, 0),
(83, 10, 1),
(83, 11, 2),
(78, 10, 0),
(78, 11, 1),
(78, 14, 2),
(79, 9, 0),
(79, 10, 1),
(79, 11, 2),
(79, 14, 3),
(79, 17, 4),
(81, 18, 0),
(80, 9, 0),
(80, 10, 1),
(80, 11, 2),
(80, 14, 3),
(80, 17, 4),
(80, 20, 5),
(90, 9, 0),
(102, 9, 0),
(102, 10, 1),
(102, 11, 2),
(107, 9, 0),
(107, 10, 1),
(107, 11, 2),
(106, 8, 0),
(108, 9, 0),
(108, 10, 1),
(109, 7, 0),
(109, 9, 1),
(109, 10, 2),
(109, 11, 3),
(110, 9, 1),
(110, 10, 2),
(111, 9, 0),
(111, 10, 1),
(111, 11, 2),
(111, 14, 3),
(110, 11, 0),
(112, 9, 0),
(112, 10, 1),
(112, 11, 2),
(112, 14, 3),
(113, 9, 0),
(113, 10, 1),
(113, 11, 2),
(114, 9, 0),
(114, 10, 1),
(1, 8, 0),
(1, 35, 2),
(1, 12, 4),
(1, 13, 5),
(13, 8, 0);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `uyeler`
--

CREATE TABLE `uyeler` (
  `id` int(11) NOT NULL,
  `name` varchar(500) DEFAULT NULL,
  `username` varchar(500) DEFAULT NULL,
  `pass` varchar(225) DEFAULT NULL,
  `email` varchar(225) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `bas_tar` date NOT NULL,
  `bit_tar` date NOT NULL,
  `cari_id` int(11) NOT NULL,
  `uye_turu` int(11) NOT NULL,
  `kullanici_id` int(11) NOT NULL,
  `yetki` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `uyeler`
--

INSERT INTO `uyeler` (`id`, `name`, `username`, `pass`, `email`, `status`, `bas_tar`, `bit_tar`, `cari_id`, `uye_turu`, `kullanici_id`, `yetki`) VALUES
(1, 'blue', 'blue', '81dc9bdb52d04dc20036dbd8313ed055', 'blue@blue.com', 1, '2019-04-08', '2019-04-22', 0, 0, 1, 0),
(20, 'hhhh2', 'hhhhn', '81dc9bdb52d04dc20036dbd8313ed055', 'yocalmis@gmail.com', 1, '2019-04-09', '2020-04-23', 0, 2, 17, 0),
(17, 'hhhh', 'admin', '81dc9bdb52d04dc20036dbd8313ed055', 'yocalmis@gmail.com', 1, '2019-04-09', '2020-04-23', 0, 1, 17, 0),
(19, 'Muhammed', 'muhammed', '81dc9bdb52d04dc20036dbd8313ed055', 'mr.mix0000@gmail.com', 1, '2019-06-28', '2020-07-12', 0, 1, 19, 0),
(21, 'hhhh3', 'hhhhnn', '81dc9bdb52d04dc20036dbd8313ed055', 'yocalmis@gmail.com', 1, '2019-04-09', '2020-04-23', 0, 2, 17, 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `yorum`
--

CREATE TABLE `yorum` (
  `yorum_id` int(11) NOT NULL,
  `kim` varchar(225) NOT NULL,
  `yer` varchar(225) NOT NULL,
  `yazi` varchar(225) NOT NULL,
  `resim` varchar(225) NOT NULL,
  `resim_alt` varchar(225) NOT NULL,
  `resim_title` varchar(225) NOT NULL,
  `kim_ar` varchar(550) DEFAULT NULL,
  `yer_ar` varchar(550) DEFAULT NULL,
  `yazi_ar` varchar(550) DEFAULT NULL,
  `kim_frs` varchar(550) NOT NULL,
  `yer_frs` varchar(550) NOT NULL,
  `yazi_frs` varchar(550) NOT NULL,
  `durum` int(11) NOT NULL,
  `tur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `yorum`
--

INSERT INTO `yorum` (`yorum_id`, `kim`, `yer`, `yazi`, `resim`, `resim_alt`, `resim_title`, `kim_ar`, `yer_ar`, `yazi_ar`, `kim_frs`, `yer_frs`, `yazi_frs`, `durum`, `tur`) VALUES
(1, 'Ali Yılmaz', 'Alanya', 'Çok güzel', '231a3-ss.jpg', '', '', NULL, NULL, NULL, '', '', '', 1, 0);

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `alt_kategori`
--
ALTER TABLE `alt_kategori`
  ADD PRIMARY KEY (`alt_kategori_id`);

--
-- Tablo için indeksler `ayar`
--
ALTER TABLE `ayar`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `dil`
--
ALTER TABLE `dil`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `haber`
--
ALTER TABLE `haber`
  ADD PRIMARY KEY (`haber_id`);

--
-- Tablo için indeksler `haber_kategori`
--
ALTER TABLE `haber_kategori`
  ADD PRIMARY KEY (`haber_kategori_id`);

--
-- Tablo için indeksler `hakkimizda`
--
ALTER TABLE `hakkimizda`
  ADD PRIMARY KEY (`about_id`);

--
-- Tablo için indeksler `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`kategori_id`);

--
-- Tablo için indeksler `link`
--
ALTER TABLE `link`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `projeler`
--
ALTER TABLE `projeler`
  ADD PRIMARY KEY (`proje_id`);

--
-- Tablo için indeksler `proje_fiyat`
--
ALTER TABLE `proje_fiyat`
  ADD PRIMARY KEY (`proje_fiyat_id`);

--
-- Tablo için indeksler `proje_ozellik`
--
ALTER TABLE `proje_ozellik`
  ADD PRIMARY KEY (`proje_ozellik_id`);

--
-- Tablo için indeksler `proje_resimler`
--
ALTER TABLE `proje_resimler`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `proje_tip`
--
ALTER TABLE `proje_tip`
  ADD PRIMARY KEY (`proje_tip_id`);

--
-- Tablo için indeksler `servis`
--
ALTER TABLE `servis`
  ADD PRIMARY KEY (`servis_id`);

--
-- Tablo için indeksler `unite_tip`
--
ALTER TABLE `unite_tip`
  ADD PRIMARY KEY (`unite_tip_id`);

--
-- Tablo için indeksler `uyeler`
--
ALTER TABLE `uyeler`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `yorum`
--
ALTER TABLE `yorum`
  ADD PRIMARY KEY (`yorum_id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `alt_kategori`
--
ALTER TABLE `alt_kategori`
  MODIFY `alt_kategori_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `ayar`
--
ALTER TABLE `ayar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `dil`
--
ALTER TABLE `dil`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;

--
-- Tablo için AUTO_INCREMENT değeri `haber`
--
ALTER TABLE `haber`
  MODIFY `haber_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=351;

--
-- Tablo için AUTO_INCREMENT değeri `haber_kategori`
--
ALTER TABLE `haber_kategori`
  MODIFY `haber_kategori_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Tablo için AUTO_INCREMENT değeri `hakkimizda`
--
ALTER TABLE `hakkimizda`
  MODIFY `about_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `kategori`
--
ALTER TABLE `kategori`
  MODIFY `kategori_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Tablo için AUTO_INCREMENT değeri `link`
--
ALTER TABLE `link`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Tablo için AUTO_INCREMENT değeri `projeler`
--
ALTER TABLE `projeler`
  MODIFY `proje_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Tablo için AUTO_INCREMENT değeri `proje_fiyat`
--
ALTER TABLE `proje_fiyat`
  MODIFY `proje_fiyat_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `proje_ozellik`
--
ALTER TABLE `proje_ozellik`
  MODIFY `proje_ozellik_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- Tablo için AUTO_INCREMENT değeri `proje_resimler`
--
ALTER TABLE `proje_resimler`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- Tablo için AUTO_INCREMENT değeri `proje_tip`
--
ALTER TABLE `proje_tip`
  MODIFY `proje_tip_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Tablo için AUTO_INCREMENT değeri `servis`
--
ALTER TABLE `servis`
  MODIFY `servis_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `unite_tip`
--
ALTER TABLE `unite_tip`
  MODIFY `unite_tip_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- Tablo için AUTO_INCREMENT değeri `uyeler`
--
ALTER TABLE `uyeler`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Tablo için AUTO_INCREMENT değeri `yorum`
--
ALTER TABLE `yorum`
  MODIFY `yorum_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
