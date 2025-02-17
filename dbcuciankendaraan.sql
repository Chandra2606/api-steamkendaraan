-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 17 Feb 2025 pada 09.28
-- Versi server: 8.0.30
-- Versi PHP: 8.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbcuciankendaraan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_transaksis`
--

CREATE TABLE `detail_transaksis` (
  `id` bigint UNSIGNED NOT NULL,
  `detailfaktur` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `detailid_paket` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_12_10_045954_create_personal_access_tokens_table', 1),
(5, '2024_12_24_045646_create_pelanggan_2110003_table', 1),
(6, '2025_01_25_013550_paket_cucian', 1),
(7, '2025_01_25_021857_transaksi', 1),
(8, '2025_01_25_022212_create_detail_transaksis_table', 1),
(9, '2025_01_25_022734_create_temps_table', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `paket_cucian`
--

CREATE TABLE `paket_cucian` (
  `id_paket` char(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_paket` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jenis_kendaraan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jenis_cucian` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `harga` double NOT NULL,
  `gambarpaket` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gambarpaketthumb` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` char(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_pelanggan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_hp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `nama_pelanggan`, `no_hp`, `alamat`, `created_at`, `updated_at`) VALUES
('PLG0000001', 'Jamaludin Bakrie', '0886282682', 'Padan', '2025-02-13 01:05:49', '2025-02-13 19:18:51'),
('PLG0000002', 'Muklis Yahya', '0862538231', 'Padang', '2025-02-13 01:06:20', '2025-02-13 01:06:20'),
('PLG0000005', 'Fitria Andriani S.H.', '087035601154', 'Jln. Teuku Umar No. 106, Sorong 89028, Jateng', '2024-11-28 08:12:42', '2025-01-24 19:29:57'),
('PLG0000006', 'Tira Maryati', '087601269614', 'Kpg. Eka No. 570, Tebing Tinggi 66525, Kaltim', '2024-10-01 21:16:17', '2025-01-24 19:29:57'),
('PLG0000007', 'Ana Amalia Widiastuti', '088484435607', 'Jr. Katamso No. 656, Magelang 94191, Jambi', '2024-09-25 14:00:03', '2025-01-24 19:29:57'),
('PLG0000008', 'Vera Yulianti', '081393311937', 'Jln. Babah No. 888, Singkawang 26878, Kepri', '2024-07-14 06:41:11', '2025-01-24 19:29:57'),
('PLG0000009', 'Ega Wibowo', '087758616256', 'Kpg. Yogyakarta No. 259, Padangsidempuan 67099, Papua', '2024-02-01 12:11:04', '2025-01-24 19:29:57'),
('PLG0000010', 'Nabila Rahayu Puspita M.Ak', '087510697087', 'Ds. Camar No. 485, Jayapura 31018, Sumbar', '2024-11-27 20:55:34', '2025-01-24 19:29:57'),
('PLG0000011', 'Jasmani Utama', '081205932390', 'Jln. Ketandan No. 521, Administrasi Jakarta Pusat 79244, Sumbar', '2024-03-16 18:51:28', '2025-01-24 19:29:57'),
('PLG0000012', 'Uchita Kezia Hastuti S.Sos', '085111702607', 'Ds. Gardujati No. 469, Mojokerto 72372, Sultra', '2024-07-28 19:45:38', '2025-01-24 19:29:57'),
('PLG0000013', 'Panji Dagel Widodo S.Gz', '084471309529', 'Ds. Imam Bonjol No. 197, Kediri 53482, Kalbar', '2025-01-04 07:55:14', '2025-01-24 19:29:57'),
('PLG0000014', 'Damar Pranowo', '082400530033', 'Kpg. Babadan No. 598, Pekanbaru 93722, Kalsel', '2024-10-25 12:13:13', '2025-01-24 19:29:57'),
('PLG0000015', 'Karen Wastuti', '086532131566', 'Kpg. Jayawijaya No. 892, Kotamobagu 14771, Aceh', '2024-09-25 22:40:28', '2025-01-24 19:29:57'),
('PLG0000016', 'Luhung Prasasta', '088601480992', 'Jr. Sugiyopranoto No. 162, Kediri 40517, Maluku', '2024-09-20 01:12:08', '2025-01-24 19:29:57'),
('PLG0000017', 'Halim Iswahyudi S.E.', '086800433518', 'Jln. Rumah Sakit No. 992, Kendari 28177, Jatim', '2024-07-03 11:39:19', '2025-01-24 19:29:57'),
('PLG0000018', 'Galuh Wibowo', '087225758121', 'Dk. Qrisdoren No. 73, Ternate 36365, Jateng', '2024-08-15 11:57:25', '2025-01-24 19:29:57'),
('PLG0000019', 'Icha Palastri', '080188844554', 'Ki. Gremet No. 729, Yogyakarta 90460, Sulbar', '2024-10-04 06:05:28', '2025-01-24 19:29:57'),
('PLG0000020', 'Arsipatra Hakim S.H.', '083119503342', 'Psr. Thamrin No. 89, Tomohon 64684, Sulbar', '2025-01-12 16:51:31', '2025-01-24 19:29:57'),
('PLG0000021', 'Xanana Mursinin Haryanto', '080481864573', 'Gg. Umalas No. 435, Kupang 80202, Bengkulu', '2024-11-09 13:26:01', '2025-01-24 19:29:57'),
('PLG0000022', 'Gaiman Sihombing', '083567161826', 'Ki. Pahlawan No. 474, Banjar 89500, Kalbar', '2024-06-20 00:13:21', '2025-01-24 19:29:57'),
('PLG0000023', 'Bahuraksa Sihotang', '087951591784', 'Kpg. Jambu No. 712, Sungai Penuh 76629, Kalteng', '2024-04-23 13:50:53', '2025-01-24 19:29:57'),
('PLG0000024', 'Oliva Yulianti', '081997487157', 'Jln. Jaksa No. 397, Pangkal Pinang 65304, NTT', '2024-03-15 21:05:53', '2025-01-24 19:29:57'),
('PLG0000025', 'Ani Pratiwi', '089997986450', 'Jln. Baranangsiang No. 483, Madiun 71358, Kaltara', '2024-05-23 13:14:41', '2025-01-24 19:29:57'),
('PLG0000026', 'Padma Lestari M.Farm', '089520903266', 'Ki. Kiaracondong No. 968, Jayapura 20927, Sumut', '2024-05-27 10:36:11', '2025-01-24 19:29:57'),
('PLG0000027', 'Ayu Mardhiyah', '088944027672', 'Gg. Kartini No. 47, Binjai 10909, Malut', '2024-09-21 16:38:34', '2025-01-24 19:29:57'),
('PLG0000028', 'Dartono Napitupulu S.Ked', '088584739811', 'Ds. Uluwatu No. 866, Palembang 47635, Malut', '2024-12-07 10:15:08', '2025-01-24 19:29:57'),
('PLG0000029', 'Mila Maimunah Sudiati S.E.I', '081645251070', 'Dk. Rumah Sakit No. 640, Administrasi Jakarta Barat 93510, Riau', '2024-12-04 20:40:30', '2025-01-24 19:29:57'),
('PLG0000030', 'Muhammad Sihombing', '082845476917', 'Ki. Baranang No. 182, Malang 35230, Kalteng', '2024-06-16 13:27:44', '2025-01-24 19:29:57'),
('PLG0000031', 'Ajeng Farida', '081032142375', 'Dk. Banceng Pondok No. 809, Kupang 13756, Sumsel', '2024-04-04 17:58:13', '2025-01-24 19:29:57'),
('PLG0000032', 'Edison Firgantoro', '080736183581', 'Ki. Batako No. 33, Jambi 70925, Papua', '2024-10-25 14:55:21', '2025-01-24 19:29:57'),
('PLG0000033', 'Murti Prasasta', '080456170026', 'Dk. Cokroaminoto No. 290, Bogor 79513, Pabar', '2024-11-27 07:01:37', '2025-01-24 19:29:57'),
('PLG0000034', 'Zalindra Novitasari', '087262505344', 'Psr. Arifin No. 742, Metro 78725, NTT', '2024-09-06 20:08:05', '2025-01-24 19:29:57'),
('PLG0000035', 'Dagel Irawan', '081288539706', 'Psr. Wahidin No. 433, Kediri 32199, Banten', '2024-07-31 11:58:38', '2025-01-24 19:29:57'),
('PLG0000036', 'Vera Anggraini', '089986163257', 'Ds. Bagas Pati No. 777, Bogor 43291, Riau', '2024-06-28 15:08:48', '2025-01-24 19:29:57'),
('PLG0000037', 'Balidin Pradipta', '081289687127', 'Jr. Camar No. 807, Singkawang 64931, Maluku', '2024-10-06 00:26:51', '2025-01-24 19:29:57'),
('PLG0000038', 'Hafshah Mila Usada S.E.I', '084975932760', 'Ds. Kebonjati No. 228, Malang 70086, Jateng', '2024-02-28 01:28:02', '2025-01-24 19:29:57'),
('PLG0000039', 'Septi Ghaliyati Maryati', '083403781828', 'Ds. Eka No. 435, Cilegon 54133, Lampung', '2024-06-30 07:06:40', '2025-01-24 19:29:57'),
('PLG0000040', 'Darsirah Prabowo', '089314109389', 'Jr. Muwardi No. 411, Binjai 86326, Maluku', '2024-04-03 23:11:50', '2025-01-24 19:29:57'),
('PLG0000041', 'Hasna Pratiwi', '082017620503', 'Psr. Bakaru No. 187, Pekanbaru 49555, Sulteng', '2024-06-27 16:38:54', '2025-01-24 19:29:57'),
('PLG0000042', 'Hari Himawan Pranowo', '087817328675', 'Ki. Baja Raya No. 172, Palangka Raya 67739, DIY', '2024-02-18 15:23:28', '2025-01-24 19:29:57'),
('PLG0000043', 'Martana Wijaya', '082861218046', 'Ds. Lumban Tobing No. 153, Kendari 68271, Jateng', '2024-10-24 22:26:53', '2025-01-24 19:29:57'),
('PLG0000044', 'Warsa Sihotang M.Kom.', '080296989736', 'Gg. Salak No. 492, Palu 96730, Maluku', '2024-04-29 20:56:52', '2025-01-24 19:29:57'),
('PLG0000045', 'Cakrawala Sitorus', '088089929342', 'Kpg. Wahidin Sudirohusodo No. 433, Solok 76018, Bali', '2024-03-04 05:37:54', '2025-01-24 19:29:57'),
('PLG0000046', 'Laila Pudjiastuti', '086149793828', 'Ds. Teuku Umar No. 485, Madiun 77303, Maluku', '2024-03-01 08:08:19', '2025-01-24 19:29:57'),
('PLG0000047', 'Putri Anggraini S.I.Kom', '088805747737', 'Jr. Samanhudi No. 44, Palopo 81559, Papua', '2024-12-29 16:33:41', '2025-01-24 19:29:57'),
('PLG0000048', 'Alika Maryati', '084121679433', 'Ds. Achmad Yani No. 323, Bima 24636, Kalbar', '2024-06-21 02:53:01', '2025-01-24 19:29:57'),
('PLG0000049', 'Titin Hasanah', '087049644346', 'Kpg. Sugiyopranoto No. 675, Salatiga 83526, Sultra', '2024-07-04 12:18:44', '2025-01-24 19:29:57'),
('PLG0000050', 'Latif Prabowo', '087734352581', 'Psr. Bakhita No. 94, Semarang 50468, Maluku', '2024-08-24 21:29:25', '2025-01-24 19:29:57'),
('PLG0000051', 'Kenes Atma Nainggolan S.Kom', '085523973121', 'Ds. Bacang No. 971, Tual 61984, Malut', '2024-11-01 01:38:12', '2025-01-24 19:29:57'),
('PLG0000052', 'Pia Wani Hassanah M.M.', '081193194271', 'Ds. Pintu Besar Selatan No. 392, Bogor 49613, DIY', '2024-05-19 17:42:54', '2025-01-24 19:29:57'),
('PLG0000053', 'Dewi Nasyidah', '085470314103', 'Gg. Sutami No. 973, Prabumulih 88863, Kalsel', '2024-07-13 12:57:56', '2025-01-24 19:29:57'),
('PLG0000054', 'Raharja Ardianto', '080050642227', 'Kpg. Urip Sumoharjo No. 140, Kotamobagu 58359, Sulteng', '2024-02-06 10:00:21', '2025-01-24 19:29:57'),
('PLG0000055', 'Hartana Saefullah', '082259657363', 'Ds. Baing No. 835, Tanjung Pinang 26552, Jabar', '2024-11-08 09:10:32', '2025-01-24 19:29:57'),
('PLG0000056', 'Kusuma Rudi Latupono S.E.', '089410305166', 'Jln. Imam Bonjol No. 736, Medan 29387, Lampung', '2024-07-13 03:02:28', '2025-01-24 19:29:57'),
('PLG0000057', 'Rina Anggraini', '083566024984', 'Jln. Jakarta No. 769, Tasikmalaya 73243, Papua', '2024-05-05 04:42:23', '2025-01-24 19:29:57'),
('PLG0000058', 'Tantri Lidya Yuniar M.TI.', '080815824199', 'Jr. Rajawali Timur No. 259, Pematangsiantar 68473, Aceh', '2024-08-23 08:01:45', '2025-01-24 19:29:57'),
('PLG0000059', 'Latika Kusmawati', '081276700931', 'Gg. Kali No. 460, Yogyakarta 26719, Jabar', '2024-05-30 15:51:06', '2025-01-24 19:29:57'),
('PLG0000060', 'Danu Sitompul', '084984988043', 'Jr. Kiaracondong No. 701, Samarinda 71168, Sulsel', '2024-11-02 16:28:38', '2025-01-24 19:29:57'),
('PLG0000061', 'Cayadi Nababan', '082378959765', 'Jr. Bawal No. 607, Depok 92295, Banten', '2024-09-23 18:19:28', '2025-01-24 19:29:57'),
('PLG0000062', 'Gilda Suartini', '081252710808', 'Gg. Lembong No. 370, Serang 89488, Aceh', '2024-12-06 17:13:55', '2025-01-24 19:29:57'),
('PLG0000063', 'Titi Wulandari', '080031805125', 'Jr. Madrasah No. 655, Pasuruan 50092, Riau', '2024-06-08 01:51:32', '2025-01-24 19:29:57'),
('PLG0000064', 'Yance Agustina S.Pt', '080047290539', 'Jr. Gatot Subroto No. 989, Bandar Lampung 61891, Jambi', '2024-04-23 14:12:34', '2025-01-24 19:29:57'),
('PLG0000065', 'Puji Handayani', '080885183553', 'Psr. Tubagus Ismail No. 785, Sungai Penuh 46042, Kalteng', '2024-03-14 19:04:45', '2025-01-24 19:29:57'),
('PLG0000066', 'Mala Palastri', '081253627000', 'Psr. Arifin No. 686, Padangpanjang 74943, Jambi', '2024-09-17 12:55:41', '2025-01-24 19:29:57'),
('PLG0000067', 'Bakti Kurniawan', '083807537220', 'Jln. Kyai Mojo No. 828, Palembang 27562, Maluku', '2024-02-06 05:12:04', '2025-01-24 19:29:57'),
('PLG0000068', 'Bakiadi Tarihoran', '088205298427', 'Jr. Umalas No. 9, Tebing Tinggi 60126, Aceh', '2024-10-04 22:24:15', '2025-01-24 19:29:57'),
('PLG0000069', 'Luthfi Wacana', '088992683486', 'Ds. Bambu No. 806, Magelang 77586, DIY', '2024-12-19 19:00:33', '2025-01-24 19:29:57'),
('PLG0000070', 'Mursita Sinaga M.Kom.', '085043118593', 'Jr. Padang No. 130, Salatiga 14739, Sumbar', '2024-09-11 02:24:51', '2025-01-24 19:29:57'),
('PLG0000071', 'Reza Hidayat M.Pd', '080782872213', 'Psr. Teuku Umar No. 691, Palu 98542, Kalsel', '2024-12-08 08:32:23', '2025-01-24 19:29:57'),
('PLG0000072', 'Jaya Wasita', '089099944365', 'Gg. Qrisdoren No. 774, Tidore Kepulauan 49051, NTB', '2024-11-24 20:56:20', '2025-01-24 19:29:57'),
('PLG0000073', 'Betania Titi Widiastuti S.Sos', '089297390528', 'Gg. Halim No. 765, Subulussalam 27180, Jabar', '2024-05-09 02:55:11', '2025-01-24 19:29:57'),
('PLG0000074', 'Kamal Narpati S.I.Kom', '086229918154', 'Dk. Tambak No. 850, Blitar 43990, Jabar', '2024-05-09 06:49:25', '2025-01-24 19:29:57'),
('PLG0000075', 'Wani Rika Zulaika M.Farm', '082039558981', 'Kpg. Suryo No. 379, Tanjung Pinang 91178, Kaltara', '2024-04-07 19:08:56', '2025-01-24 19:29:57'),
('PLG0000076', 'Tina Salsabila Yulianti', '085035365291', 'Psr. R.M. Said No. 442, Pariaman 91834, Sulsel', '2024-07-19 13:59:32', '2025-01-24 19:29:57'),
('PLG0000077', 'Cengkal Hutasoit S.Pt', '083638219562', 'Dk. Teuku Umar No. 593, Tangerang 51846, Jateng', '2024-02-21 04:47:19', '2025-01-24 19:29:57'),
('PLG0000078', 'Paramita Andriani', '083093689875', 'Gg. Bakaru No. 677, Makassar 71669, Babel', '2024-02-12 00:11:39', '2025-01-24 19:29:57'),
('PLG0000079', 'Banara Haryanto', '087368092134', 'Dk. Rajawali Timur No. 269, Cilegon 89220, Sulteng', '2024-03-20 02:04:07', '2025-01-24 19:29:57'),
('PLG0000080', 'Harja Sitorus', '085722361821', 'Jln. Pasir Koja No. 698, Padang 83080, Sulteng', '2024-09-09 18:08:37', '2025-01-24 19:29:57'),
('PLG0000081', 'Sakura Haryanti', '089347099440', 'Ki. M.T. Haryono No. 495, Palembang 57520, Gorontalo', '2024-12-06 23:43:55', '2025-01-24 19:29:57'),
('PLG0000082', 'Karsana Wibisono S.H.', '083366849415', 'Psr. Bambu No. 658, Bogor 42104, Bali', '2024-09-02 03:47:59', '2025-01-24 19:29:57'),
('PLG0000083', 'Lanjar Sinaga', '088200499467', 'Ds. Abdul. Muis No. 707, Dumai 45254, Gorontalo', '2024-08-27 09:36:54', '2025-01-24 19:29:57'),
('PLG0000084', 'Luwes Jailani S.Kom', '082710741101', 'Kpg. Bacang No. 12, Batu 96711, Papua', '2024-03-15 04:46:34', '2025-01-24 19:29:57'),
('PLG0000085', 'Ratih Purnawati', '086245105481', 'Kpg. Babakan No. 116, Bogor 40625, Maluku', '2024-04-15 07:32:16', '2025-01-24 19:29:57'),
('PLG0000086', 'Rahmat Napitupulu', '087500579276', 'Gg. Adisumarmo No. 499, Pekalongan 28517, Babel', '2024-11-06 05:33:19', '2025-01-24 19:29:57'),
('PLG0000087', 'Darmana Irfan Wahyudin S.Psi', '089306103560', 'Dk. B.Agam 1 No. 933, Sabang 99000, Aceh', '2024-10-08 14:44:57', '2025-01-24 19:29:57'),
('PLG0000088', 'Paiman Prakasa', '084495302777', 'Kpg. Wora Wari No. 310, Palu 59855, Pabar', '2024-09-12 11:23:36', '2025-01-24 19:29:57'),
('PLG0000089', 'Maimunah Tania Fujiati', '081566243418', 'Jr. Merdeka No. 793, Banjar 31866, DKI', '2024-08-08 16:58:40', '2025-01-24 19:29:57'),
('PLG0000090', 'Elma Natalia Safitri', '087830413774', 'Kpg. Salatiga No. 391, Prabumulih 35716, Jambi', '2024-11-21 22:03:08', '2025-01-24 19:29:57'),
('PLG0000091', 'Leo Manullang', '081296106116', 'Jr. Rajawali Timur No. 337, Kediri 38343, Sumbar', '2024-09-21 08:25:00', '2025-01-24 19:29:57'),
('PLG0000092', 'Jais Sitompul S.Farm', '089027635525', 'Jln. Bata Putih No. 267, Lubuklinggau 50468, Sulut', '2024-11-11 11:16:49', '2025-01-24 19:29:57'),
('PLG0000093', 'Citra Yuliarti S.E.', '087708048335', 'Dk. Ciumbuleuit No. 983, Subulussalam 52377, Jateng', '2024-08-17 23:05:42', '2025-01-24 19:29:57'),
('PLG0000094', 'Ina Puspasari', '087296876755', 'Jr. Ir. H. Juanda No. 325, Langsa 19166, Kepri', '2024-08-07 09:45:45', '2025-01-24 19:29:57'),
('PLG0000095', 'Cahyono Kasiran Suryono S.Gz', '087935600879', 'Ds. Gotong Royong No. 354, Banda Aceh 93746, Sulteng', '2024-06-17 22:41:38', '2025-01-24 19:29:57'),
('PLG0000096', 'Kamaria Pertiwi', '086580368408', 'Kpg. Gajah No. 16, Kendari 50868, Riau', '2024-07-06 11:55:19', '2025-01-24 19:29:57'),
('PLG0000097', 'Vanya Anggraini', '087173637192', 'Ki. Gajah Mada No. 118, Tanjung Pinang 65640, Gorontalo', '2024-03-12 14:43:49', '2025-01-24 19:29:57'),
('PLG0000098', 'Emong Ibrahim Saragih S.T.', '080961024996', 'Dk. Badak No. 199, Bima 28443, Gorontalo', '2024-01-25 10:35:19', '2025-01-24 19:29:57'),
('PLG0000099', 'Wisnu Kacung Uwais S.I.Kom', '085445158105', 'Psr. Bayan No. 227, Administrasi Jakarta Utara 61469, DIY', '2024-06-28 13:56:56', '2025-01-24 19:29:57'),
('PLG0000100', 'Irwan Sinaga', '080429988441', 'Jln. Achmad Yani No. 559, Ambon 32158, Sulsel', '2024-06-08 08:51:59', '2025-01-24 19:29:57');

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'auth_token', 'ec0e23ba3e0ace0aed8d3be3a5e8c650acfe13f28c36c0128bb9f66b31a06dd4', '[\"*\"]', NULL, NULL, '2025-02-10 02:30:42', '2025-02-10 02:30:42'),
(2, 'App\\Models\\User', 2, 'auth_token', 'c9935e573f9ad1dbbf23bbd3bcee18592bb9b19d9e5f35432b83552b4ea25923', '[\"*\"]', NULL, NULL, '2025-02-10 02:31:47', '2025-02-10 02:31:47'),
(3, 'App\\Models\\User', 2, 'auth_token', '75d3dcf8a4bc2509ac0b1cf11c225567128022873fb6afcff6b11ceca13cc064', '[\"*\"]', NULL, NULL, '2025-02-10 02:32:00', '2025-02-10 02:32:00'),
(4, 'App\\Models\\User', 2, 'auth_token', 'd6a0beb690841d40f5c53b1acb780578000c063637234ba51dbb6c8c91628fe2', '[\"*\"]', NULL, NULL, '2025-02-10 02:32:19', '2025-02-10 02:32:19'),
(5, 'App\\Models\\User', 1, 'auth_token', '724e1136e7320a206ca4c3114b15eb1938310384e2315c8dda36f7d781d27c99', '[\"*\"]', '2025-02-12 00:35:05', NULL, '2025-02-10 02:33:00', '2025-02-12 00:35:05'),
(6, 'App\\Models\\User', 1, 'auth_token', '47c80f93e7bf0bc01dfeebf20aeb832fffbff3165dd7a6f49b265640fea8578b', '[\"*\"]', '2025-02-13 19:33:54', NULL, '2025-02-10 02:33:34', '2025-02-13 19:33:54'),
(7, 'App\\Models\\User', 1, 'auth_token', 'e23e78933841f3a073df91f291079ade655218b3d8fb3c448505cdad17709bff', '[\"*\"]', '2025-02-17 02:20:34', NULL, '2025-02-13 01:16:15', '2025-02-17 02:20:34'),
(8, 'App\\Models\\User', 1, 'auth_token', '74c595a52851ffbe33274f1bc1381ff27bd7e4b17f5fc9ed3da017cffa181e73', '[\"*\"]', NULL, NULL, '2025-02-13 19:40:06', '2025-02-13 19:40:06'),
(9, 'App\\Models\\User', 1, 'auth_token', 'f951edc235e0ff3705b68dc45267e21b40bc6ca9c9085aa1f24518e7834e3fc3', '[\"*\"]', '2025-02-13 19:42:25', NULL, '2025-02-13 19:41:50', '2025-02-13 19:42:25'),
(10, 'App\\Models\\User', 1, 'auth_token', 'fd29ad89864eeb6108c21583b19e1d38f1714f375c4ecb958901537cc697554e', '[\"*\"]', '2025-02-13 19:42:26', NULL, '2025-02-13 19:41:57', '2025-02-13 19:42:26'),
(11, 'App\\Models\\User', 1, 'auth_token', 'd0098e331e4a53e0892b8c7a3cbf6e752db947f2b302390c1db91c46e6ee5634', '[\"*\"]', '2025-02-13 19:42:26', NULL, '2025-02-13 19:42:04', '2025-02-13 19:42:26'),
(12, 'App\\Models\\User', 1, 'auth_token', '152915ba52a007420ba74d9d9cb467e497a432b400a7555fd4935d257f0fb1a4', '[\"*\"]', '2025-02-13 19:42:26', NULL, '2025-02-13 19:42:10', '2025-02-13 19:42:26'),
(13, 'App\\Models\\User', 1, 'auth_token', 'a501a48ef02dae10fdd2d005fb0316b208a204bd951ab51367cc9c3d7bceb186', '[\"*\"]', NULL, NULL, '2025-02-13 19:42:18', '2025-02-13 19:42:18'),
(14, 'App\\Models\\User', 1, 'auth_token', '96baee7b8521cb6616a1f35661152d94376eee15fd98cbc6829d4cf99173b196', '[\"*\"]', '2025-02-17 02:22:44', NULL, '2025-02-13 19:42:22', '2025-02-17 02:22:44'),
(15, 'App\\Models\\User', 1, 'auth_token', 'b972560eedafbbe692cbb2b80ae684917c7ba08fe56a1bc3b5026c3e0f10b3b7', '[\"*\"]', '2025-02-14 02:19:34', NULL, '2025-02-14 02:15:02', '2025-02-14 02:19:34'),
(16, 'App\\Models\\User', 1, 'auth_token', 'e84bc9d71434079857edb1843f98305136a90db866f8a51e4975cc95e510be25', '[\"*\"]', '2025-02-15 13:58:47', NULL, '2025-02-14 02:20:53', '2025-02-15 13:58:47');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('aBhmWN2CRxzDz6d7iXDgoQGsVMtZpF6AnCTgWJ0z', NULL, '192.168.100.55', 'okhttp/4.9.2', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiblVZQW1lT1JXZmozQXNocW9oTTBQdnV2SUxIV0xhR0xGdjJFMk14ZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjEwMC41NTo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1739437195),
('FCG2qDIWc0hvpQ3qQuAxSOUbCBlAKNgNsKkzr7n3', NULL, '192.168.100.55', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaFJJMHNvakVMRURFOUtYRWlDV3RSVU5RMnllcno2dkYxYXFDWmZJMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjEwMC41NTo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1739433196),
('FGzRZbBT7U2P4HZIjB0ypkOWEFH7koy2GtRrtMAT', NULL, '192.168.100.55', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYWZuU0hveTNZWXRickFmTlRYTTZtbW1rc3dSUHJIVDZMWE1uMFVJcyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjEwMC41NTo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1739433209);

-- --------------------------------------------------------

--
-- Struktur dari tabel `temps`
--

CREATE TABLE `temps` (
  `id` bigint UNSIGNED NOT NULL,
  `tempid_user` int NOT NULL,
  `tempid_paket` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `faktur` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal` date NOT NULL,
  `id_pelanggan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_user` int NOT NULL,
  `total_bayar` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@admin.com', '2025-01-24 19:29:56', '$2y$12$cM/eAfBhB.tLN70LQvEZ4eGpWsFsUXH2BBbDHmCNv6HpKLVAB.9ou', 'nGSaGojXWU', '2025-01-24 19:29:57', '2025-02-10 02:30:42'),
(2, 'Jamal', 'jamal@gmail.com', NULL, '$2y$12$77FIGKNRNn5fz21OTWc5uuR2gdNyJHHEWGUg076aqJNzFRuaUG/iO', NULL, '2025-02-10 02:31:47', '2025-02-10 02:31:47');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indeks untuk tabel `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indeks untuk tabel `detail_transaksis`
--
ALTER TABLE `detail_transaksis`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indeks untuk tabel `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `paket_cucian`
--
ALTER TABLE `paket_cucian`
  ADD PRIMARY KEY (`id_paket`);

--
-- Indeks untuk tabel `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indeks untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indeks untuk tabel `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indeks untuk tabel `temps`
--
ALTER TABLE `temps`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`faktur`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `detail_transaksis`
--
ALTER TABLE `detail_transaksis`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `temps`
--
ALTER TABLE `temps`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
