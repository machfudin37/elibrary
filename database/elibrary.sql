-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 02 Des 2021 pada 07.19
-- Versi server: 10.4.22-MariaDB
-- Versi PHP: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `elibrary`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(25) NOT NULL,
  `nama_lengkap` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` enum('1','0') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`id`, `username`, `nama_lengkap`, `password`, `status`) VALUES
(1, 'admin', 'Administrator', '$2y$10$XCdTSNFrAlmTvxN9QQHmyuKegwI0J0aXBdWHiilItKXot8riUBw72', '1');

-- --------------------------------------------------------

--
-- Struktur dari tabel `antrian`
--

CREATE TABLE `antrian` (
  `no_ant` int(11) NOT NULL,
  `no_reg` char(6) NOT NULL,
  `kd_buku` char(5) NOT NULL,
  `tgl_pinjam` date NOT NULL,
  `nama_siswa` varchar(50) NOT NULL,
  `judul_buku` varchar(100) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `antrian`
--

INSERT INTO `antrian` (`no_ant`, `no_reg`, `kd_buku`, `tgl_pinjam`, `nama_siswa`, `judul_buku`) VALUES
(1, 'REG001', 'BK005', '2021-12-01', 'Biru Epa Damainingati', 'Perancangan Web dengan Fireworks dan Dreamweaver MX');

-- --------------------------------------------------------

--
-- Struktur dari tabel `buku`
--

CREATE TABLE `buku` (
  `id` int(11) NOT NULL,
  `kd_buku` char(5) NOT NULL,
  `judul_buku` varchar(100) NOT NULL,
  `sampul` varchar(255) NOT NULL,
  `penerbit` varchar(100) NOT NULL,
  `pengarang` varchar(100) NOT NULL,
  `tahun_terbit` char(4) NOT NULL,
  `nomor_rak` smallint(6) NOT NULL,
  `jumlah` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `buku`
--

INSERT INTO `buku` (`id`, `kd_buku`, `judul_buku`, `sampul`, `penerbit`, `pengarang`, `tahun_terbit`, `nomor_rak`, `jumlah`) VALUES
(7, 'BK005', 'Perancangan Web dengan Fireworks dan Dreamweaver MX', 'Perancangan_Web_dengan_Fireworks_dan_Dreamweaver_MX.jpg', 'Gava Media', 'Bunafit Nugroho', '2005', 12, 100),
(8, 'BK006', ' Cascading Style Sheets (CSS)', '204919.jpg', 'Gava Media', 'Bunafit Nugroho', '2004', 13, 100),
(9, 'BK007', 'Dasar pemrograman python 3', 'Dasar_pemrograman_python_3.jpg', 'Andi, 2018 dan CV Andi Offset', 'Abdul Kadir (penulis) Maya (editor) Dian Arum (korektor)', '2018', 13, 100),
(10, 'BK008', ' Dasar pemrograman web dengan PHP', 'Dasar_pemrograman_web_dengan_PHP.jpg', 'Yogyakarta : Deepublish', 'Canggih Ajika Pamungkas', '2017', 13, 100);

-- --------------------------------------------------------

--
-- Struktur dari tabel `siswa`
--

CREATE TABLE `siswa` (
  `id` int(11) NOT NULL,
  `no_reg` char(6) NOT NULL,
  `nama_siswa` varchar(50) NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `kelas` varchar(5) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `siswa`
--

INSERT INTO `siswa` (`id`, `no_reg`, `nama_siswa`, `jenis_kelamin`, `kelas`, `password`) VALUES
(1, 'REG001', 'Biru Epa Damainingati', 'P', 'S1', '$2y$10$HleR8.YQJvLy8D0okmZNYezFejD7B0JqJhm8vVN/nToNirlOlV9b.');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `id` int(11) NOT NULL,
  `no_reg` char(6) NOT NULL,
  `kd_buku` char(5) NOT NULL,
  `tgl_pinjam` date NOT NULL,
  `tgl_kembali` date DEFAULT NULL,
  `denda` int(11) DEFAULT NULL,
  `nama_siswa` varchar(50) NOT NULL,
  `judul_buku` varchar(100) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`id`, `no_reg`, `kd_buku`, `tgl_pinjam`, `tgl_kembali`, `denda`, `nama_siswa`, `judul_buku`) VALUES
(1, 'REG001', 'BK005', '2021-12-01', '2021-12-02', 0, 'Biru Epa Damainingati', 'Perancangan Web dengan Fireworks dan Dreamweaver MX');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indeks untuk tabel `antrian`
--
ALTER TABLE `antrian`
  ADD PRIMARY KEY (`no_ant`);

--
-- Indeks untuk tabel `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kd_buku` (`kd_buku`);

--
-- Indeks untuk tabel `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `no_reg` (`no_reg`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `antrian`
--
ALTER TABLE `antrian`
  MODIFY `no_ant` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `buku`
--
ALTER TABLE `buku`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `siswa`
--
ALTER TABLE `siswa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
