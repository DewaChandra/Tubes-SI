-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 13, 2023 at 03:48 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sdm_2118011`
--

-- --------------------------------------------------------

--
-- Table structure for table `absensi`
--

CREATE TABLE `absensi` (
  `ID_Absensi` varchar(10) NOT NULL,
  `TGL` date NOT NULL,
  `NIP` varchar(7) NOT NULL,
  `Jam Masuk` time NOT NULL,
  `Keterangan` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `gaji`
--

CREATE TABLE `gaji` (
  `ID_Gaji` varchar(10) NOT NULL,
  `NIP` varchar(7) NOT NULL,
  `Gaji Pokok` int(11) NOT NULL,
  `ID_Tunjungan` varchar(10) NOT NULL,
  `Jabatan` varchar(30) NOT NULL,
  `Total Gaji` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `jenis izin`
--

CREATE TABLE `jenis izin` (
  `ID_Izin` varchar(10) NOT NULL,
  `Total Izin` int(11) NOT NULL,
  `Jumlah Izin yang Diambil` int(11) NOT NULL,
  `NIP` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `karyawan`
--

CREATE TABLE `karyawan` (
  `NIP` varchar(7) NOT NULL,
  `Nama` varchar(50) NOT NULL,
  `TTG` date NOT NULL,
  `Jenis Kelamin` varchar(10) NOT NULL,
  `Agama` varchar(12) NOT NULL,
  `Alamat` varchar(50) NOT NULL,
  `Status Kawin` varchar(15) NOT NULL,
  `Kewarganegaraan` varchar(30) NOT NULL,
  `Pendidikan` varchar(20) NOT NULL,
  `Jurusan` varchar(30) NOT NULL,
  `Jabatan` varchar(50) NOT NULL,
  `Foto` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pengajuan izin`
--

CREATE TABLE `pengajuan izin` (
  `ID_Pengajuan Izin` varchar(10) NOT NULL,
  `TGL Pengajuan` date NOT NULL,
  `TGL Mulai` date NOT NULL,
  `TGL Akhir` date NOT NULL,
  `Alasan Cuti` varchar(50) NOT NULL,
  `NIP` varchar(7) NOT NULL,
  `ID_Unit` varchar(7) NOT NULL,
  `Validasi` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tata kelola`
--

CREATE TABLE `tata kelola` (
  `ID_Kelola` varchar(10) NOT NULL,
  `Waktu` datetime NOT NULL,
  `ID_Absensi` varchar(10) NOT NULL,
  `NIA` varchar(7) NOT NULL,
  `ID_Gaji` varchar(10) NOT NULL,
  `ID_Izin` varchar(10) NOT NULL,
  `ID_Pengajuan Izin` varchar(10) NOT NULL,
  `ID_Training` varchar(10) NOT NULL,
  `ID_Tunjangan` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `training`
--

CREATE TABLE `training` (
  `ID_Training` varchar(10) NOT NULL,
  `Tgl Training` date NOT NULL,
  `Nama Training` varchar(50) NOT NULL,
  `NIP` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tunjangan`
--

CREATE TABLE `tunjangan` (
  `ID_Tunjungan` varchar(10) NOT NULL,
  `Nama Tunjangan` varchar(50) NOT NULL,
  `Besar Tunjangan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `NIU` varchar(7) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `absensi`
--
ALTER TABLE `absensi`
  ADD PRIMARY KEY (`ID_Absensi`),
  ADD KEY `NIP` (`NIP`);

--
-- Indexes for table `gaji`
--
ALTER TABLE `gaji`
  ADD PRIMARY KEY (`ID_Gaji`),
  ADD KEY `NIP` (`NIP`),
  ADD KEY `ID_Tunjungan` (`ID_Tunjungan`);

--
-- Indexes for table `jenis izin`
--
ALTER TABLE `jenis izin`
  ADD PRIMARY KEY (`ID_Izin`),
  ADD KEY `NIP` (`NIP`);

--
-- Indexes for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`NIP`);

--
-- Indexes for table `pengajuan izin`
--
ALTER TABLE `pengajuan izin`
  ADD PRIMARY KEY (`ID_Pengajuan Izin`),
  ADD KEY `NIP` (`NIP`),
  ADD KEY `ID_Unit` (`ID_Unit`);

--
-- Indexes for table `tata kelola`
--
ALTER TABLE `tata kelola`
  ADD PRIMARY KEY (`ID_Kelola`),
  ADD KEY `ID_Absensi` (`ID_Absensi`),
  ADD KEY `NIA` (`NIA`),
  ADD KEY `ID_Gaji` (`ID_Gaji`),
  ADD KEY `ID_Izin` (`ID_Izin`),
  ADD KEY `ID_Pengajuan Izin` (`ID_Pengajuan Izin`),
  ADD KEY `ID_Training` (`ID_Training`),
  ADD KEY `ID_Tunjangan` (`ID_Tunjangan`);

--
-- Indexes for table `training`
--
ALTER TABLE `training`
  ADD PRIMARY KEY (`ID_Training`),
  ADD KEY `NIP` (`NIP`);

--
-- Indexes for table `tunjangan`
--
ALTER TABLE `tunjangan`
  ADD PRIMARY KEY (`ID_Tunjungan`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`NIU`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `absensi`
--
ALTER TABLE `absensi`
  ADD CONSTRAINT `absensi_ibfk_1` FOREIGN KEY (`NIP`) REFERENCES `karyawan` (`NIP`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `absensi_ibfk_2` FOREIGN KEY (`ID_Absensi`) REFERENCES `tata kelola` (`ID_Absensi`);

--
-- Constraints for table `gaji`
--
ALTER TABLE `gaji`
  ADD CONSTRAINT `gaji_ibfk_1` FOREIGN KEY (`ID_Tunjungan`) REFERENCES `tunjangan` (`ID_Tunjungan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `gaji_ibfk_2` FOREIGN KEY (`NIP`) REFERENCES `karyawan` (`NIP`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `gaji_ibfk_3` FOREIGN KEY (`ID_Gaji`) REFERENCES `tata kelola` (`ID_Gaji`);

--
-- Constraints for table `jenis izin`
--
ALTER TABLE `jenis izin`
  ADD CONSTRAINT `jenis izin_ibfk_1` FOREIGN KEY (`NIP`) REFERENCES `karyawan` (`NIP`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `jenis izin_ibfk_2` FOREIGN KEY (`ID_Izin`) REFERENCES `tata kelola` (`ID_Izin`);

--
-- Constraints for table `pengajuan izin`
--
ALTER TABLE `pengajuan izin`
  ADD CONSTRAINT `pengajuan izin_ibfk_1` FOREIGN KEY (`NIP`) REFERENCES `karyawan` (`NIP`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pengajuan izin_ibfk_2` FOREIGN KEY (`ID_Pengajuan Izin`) REFERENCES `tata kelola` (`ID_Pengajuan Izin`);

--
-- Constraints for table `tata kelola`
--
ALTER TABLE `tata kelola`
  ADD CONSTRAINT `tata kelola_ibfk_1` FOREIGN KEY (`NIA`) REFERENCES `user` (`NIU`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `training`
--
ALTER TABLE `training`
  ADD CONSTRAINT `training_ibfk_1` FOREIGN KEY (`NIP`) REFERENCES `karyawan` (`NIP`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `training_ibfk_2` FOREIGN KEY (`ID_Training`) REFERENCES `tata kelola` (`ID_Training`);

--
-- Constraints for table `tunjangan`
--
ALTER TABLE `tunjangan`
  ADD CONSTRAINT `tunjangan_ibfk_1` FOREIGN KEY (`ID_Tunjungan`) REFERENCES `tata kelola` (`ID_Tunjangan`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_2` FOREIGN KEY (`NIU`) REFERENCES `tata kelola` (`NIA`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
