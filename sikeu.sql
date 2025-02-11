-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 11, 2025 at 09:33 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sikeu`
--

-- --------------------------------------------------------

--
-- Table structure for table `anggaran`
--

CREATE TABLE `anggaran` (
  `id_anggaran` int(11) NOT NULL,
  `id_nim` int(11) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `jumlah_anggaran` decimal(10,2) NOT NULL,
  `periode` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `arus_kas`
--

CREATE TABLE `arus_kas` (
  `id_arus_kas` int(11) NOT NULL,
  `id_nim` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `jenis` enum('masuk','keluar','','') NOT NULL,
  `jumlah` decimal(10,2) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `ketengaran` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `arus_kas`
--

INSERT INTO `arus_kas` (`id_arus_kas`, `id_nim`, `tanggal`, `jenis`, `jumlah`, `id_kategori`, `ketengaran`) VALUES
(1, 1, '2025-02-17', 'keluar', 1200000.00, 2, 'pembayaran bonus'),
(2, 3, '2025-02-05', 'masuk', 200000.00, 1, 'pendapatan tambahan penjualan');

-- --------------------------------------------------------

--
-- Table structure for table `hutang_piutang`
--

CREATE TABLE `hutang_piutang` (
  `hid_hutang_piutang` int(11) NOT NULL,
  `id_nim` int(11) NOT NULL,
  `jumlah` decimal(10,2) NOT NULL,
  `jenis` enum('hutang','piutang','','') NOT NULL,
  `pihak_terkait` varchar(255) NOT NULL,
  `status` enum('lunas','belum lunas','','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(100) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`, `keterangan`) VALUES
(1, 'pemasukan', 'hasil penjualan'),
(2, 'pengeluaran', 'gaji dan pembelian barang');

-- --------------------------------------------------------

--
-- Table structure for table `notifikasi`
--

CREATE TABLE `notifikasi` (
  `id_notifikasi` int(11) NOT NULL,
  `id_nim` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `pesan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pajak`
--

CREATE TABLE `pajak` (
  `id_pajak` int(11) NOT NULL,
  `id_nim` int(11) NOT NULL,
  `jenis_pajak` varchar(255) NOT NULL,
  `jumlah` decimal(10,2) NOT NULL,
  `tanggal_pembayaran` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `id_nim` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `jumlah` decimal(10,2) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `id_nim`, `tanggal`, `id_kategori`, `jumlah`, `keterangan`) VALUES
(1, 1, '2025-02-12', 2, 2100000.00, 'gaji bulan maret'),
(2, 2, '2025-02-13', 2, 400000.00, 'pembelian prabotan dan alat fasilitas'),
(3, 3, '2025-02-06', 1, 5500000.00, 'hasil penjualan bulan februari'),
(4, 4, '2025-01-30', 1, 3400000.00, 'hasil penjualan bulan januari');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_nim` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `no_telepon` varchar(20) NOT NULL,
  `alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_nim`, `name`, `email`, `no_telepon`, `alamat`) VALUES
(1, 'rai raihan', 'raihan25@gmail.com', '1234567890', 'jl.wates'),
(2, 'raihan', 'rai25@gmail.com', '0987654321', 'jl.gamping'),
(3, 'adit', 'aditfirman22@gmail.com', '123456789', 'jl.bibis'),
(4, 'ahmad', 'ahmadiyah22@gmail.com', '987654321', 'jl.godean');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `anggaran`
--
ALTER TABLE `anggaran`
  ADD PRIMARY KEY (`id_anggaran`),
  ADD KEY `id_nim` (`id_nim`),
  ADD KEY `id_kategori` (`id_kategori`);

--
-- Indexes for table `arus_kas`
--
ALTER TABLE `arus_kas`
  ADD PRIMARY KEY (`id_arus_kas`),
  ADD KEY `id_nim` (`id_nim`),
  ADD KEY `id_kategori` (`id_kategori`);

--
-- Indexes for table `hutang_piutang`
--
ALTER TABLE `hutang_piutang`
  ADD PRIMARY KEY (`hid_hutang_piutang`),
  ADD KEY `id_nim` (`id_nim`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `notifikasi`
--
ALTER TABLE `notifikasi`
  ADD PRIMARY KEY (`id_notifikasi`),
  ADD KEY `id_nim` (`id_nim`);

--
-- Indexes for table `pajak`
--
ALTER TABLE `pajak`
  ADD PRIMARY KEY (`id_pajak`),
  ADD KEY `id_nim` (`id_nim`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `id_nim` (`id_nim`),
  ADD KEY `id_kategori` (`id_kategori`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_nim`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `anggaran`
--
ALTER TABLE `anggaran`
  MODIFY `id_anggaran` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `arus_kas`
--
ALTER TABLE `arus_kas`
  MODIFY `id_arus_kas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `hutang_piutang`
--
ALTER TABLE `hutang_piutang`
  MODIFY `hid_hutang_piutang` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `notifikasi`
--
ALTER TABLE `notifikasi`
  MODIFY `id_notifikasi` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pajak`
--
ALTER TABLE `pajak`
  MODIFY `id_pajak` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_nim` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `anggaran`
--
ALTER TABLE `anggaran`
  ADD CONSTRAINT `anggaran_ibfk_1` FOREIGN KEY (`id_nim`) REFERENCES `user` (`id_nim`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `anggaran_ibfk_2` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `arus_kas`
--
ALTER TABLE `arus_kas`
  ADD CONSTRAINT `arus_kas_ibfk_1` FOREIGN KEY (`id_nim`) REFERENCES `user` (`id_nim`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `arus_kas_ibfk_2` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hutang_piutang`
--
ALTER TABLE `hutang_piutang`
  ADD CONSTRAINT `hutang_piutang_ibfk_1` FOREIGN KEY (`id_nim`) REFERENCES `user` (`id_nim`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `notifikasi`
--
ALTER TABLE `notifikasi`
  ADD CONSTRAINT `notifikasi_ibfk_1` FOREIGN KEY (`id_nim`) REFERENCES `user` (`id_nim`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pajak`
--
ALTER TABLE `pajak`
  ADD CONSTRAINT `pajak_ibfk_1` FOREIGN KEY (`id_nim`) REFERENCES `user` (`id_nim`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_nim`) REFERENCES `user` (`id_nim`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
