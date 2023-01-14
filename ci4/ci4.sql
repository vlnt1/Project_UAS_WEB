-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 13 Jan 2023 pada 22.12
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ci4`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `iuran`
--

CREATE TABLE `iuran` (
  `id` int(11) NOT NULL,
  `keterangan` tinytext DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `bulan` int(2) DEFAULT NULL,
  `tahun` year(4) DEFAULT NULL,
  `jumlah` decimal(10,2) DEFAULT NULL,
  `warga_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `iuran`
--

INSERT INTO `iuran` (`id`, `keterangan`, `tanggal`, `bulan`, `tahun`, `jumlah`, `warga_id`) VALUES
(1, 'Bayar Iuran RT', '2021-07-07', 7, 2021, '150000.00', 1),
(2, 'Bayar iuran RT', '2021-07-07', 7, 2021, '150000.00', 2),
(3, 'Bayar Iuran RT', '2021-07-19', 7, 2021, '100000.00', 3),
(4, 'Bayar Iuran RT', '2021-07-20', 7, 2021, '100000.00', 4),
(5, 'Bayar Iuran RT', '2021-07-21', 7, 2021, '100000.00', 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(200) NOT NULL,
  `useremail` varchar(200) DEFAULT NULL,
  `userpassword` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `username`, `useremail`, `userpassword`) VALUES
(1, 'mikel123', 'mikelvalentino47@gmail.com', '$2y$10$BRHBoZMx0udQBqNhraMJ1eA1F2c2hBLxt7vmcbYDnftaCXCQ/hQFy');

-- --------------------------------------------------------

--
-- Struktur dari tabel `warga`
--

CREATE TABLE `warga` (
  `warga_id` int(11) NOT NULL,
  `nik` varchar(50) NOT NULL,
  `nama` varchar(200) DEFAULT NULL,
  `kelamin` enum('L','P') DEFAULT NULL,
  `alamat` tinytext DEFAULT NULL,
  `no_rumah` varchar(10) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `warga`
--

INSERT INTO `warga` (`warga_id`, `nik`, `nama`, `kelamin`, `alamat`, `no_rumah`, `status`) VALUES
(1, '77171111', 'Alfansha Abiftyo H', 'L', 'Jln.Merpati', '7', NULL),
(2, '77172222', 'Mentari', 'P', 'Jln.Merpati', '17', NULL),
(3, '77173333', 'Nada', 'P', 'Jln.Mawar', '3', NULL),
(4, '77174444', 'Jumadi', 'L', 'Jln.Mawar', '4', NULL),
(5, '77175555', 'Kikii', 'L', 'Jln.Elang', '10', NULL);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `iuran`
--
ALTER TABLE `iuran`
  ADD PRIMARY KEY (`id`),
  ADD KEY `warga_id` (`warga_id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `warga`
--
ALTER TABLE `warga`
  ADD PRIMARY KEY (`warga_id`),
  ADD UNIQUE KEY `nik` (`nik`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `iuran`
--
ALTER TABLE `iuran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `warga`
--
ALTER TABLE `warga`
  MODIFY `warga_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `iuran`
--
ALTER TABLE `iuran`
  ADD CONSTRAINT `iuran_ibfk_1` FOREIGN KEY (`warga_id`) REFERENCES `warga` (`warga_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
