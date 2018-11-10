-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 09, 2018 at 03:24 AM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 5.5.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bsl`
--

-- --------------------------------------------------------

--
-- Stand-in structure for view `master`
--
CREATE TABLE `master` (
`tanggal` date
,`id_transaksi` int(11)
,`jumlah_smph` int(11)
,`nama` varchar(50)
,`norek` int(11)
,`petugas` varchar(50)
,`nik_petugas` int(16)
,`nm_sandi` varchar(25)
,`jns_smph` varchar(25)
,`harga` varchar(16)
,`username` varchar(25)
,`level` tinyint(1)
,`total_tabungan` double
);

-- --------------------------------------------------------

--
-- Table structure for table `nasabah`
--

CREATE TABLE `nasabah` (
  `id_user` int(4) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `nik_nasabah` int(16) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `kelurahan` varchar(20) NOT NULL,
  `kecamatan` varchar(20) NOT NULL,
  `kabupaten` varchar(20) NOT NULL,
  `provinsi` varchar(20) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `jns_kelamin` varchar(9) NOT NULL,
  `agama` varchar(15) NOT NULL,
  `norek` int(11) NOT NULL,
  `tgl_transaksi` date NOT NULL,
  `saldo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nasabah`
--

INSERT INTO `nasabah` (`id_user`, `nama`, `nik_nasabah`, `alamat`, `kelurahan`, `kecamatan`, `kabupaten`, `provinsi`, `tgl_lahir`, `jns_kelamin`, `agama`, `norek`, `tgl_transaksi`, `saldo`) VALUES
(4, 'bambang', 12345678, 'jl.bunga', 'bd.agung', 'rawajitu', 'tulang bawang', 'lampung', '2018-11-08', '0', '0', 123456789, '2018-11-02', 0),
(5, 'admin', 123456789, 'jl.bunga', 'bd.agung', 'rawajitu', 'tulang bawang', 'lampung', '2018-11-08', '0', '0', 123456789, '2018-11-02', 0);

-- --------------------------------------------------------

--
-- Stand-in structure for view `penarikan`
--
CREATE TABLE `penarikan` (
`tanggal` date
,`saldo` double
);

-- --------------------------------------------------------

--
-- Table structure for table `petugas`
--

CREATE TABLE `petugas` (
  `id_user` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `nik_petugas` int(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `petugas`
--

INSERT INTO `petugas` (`id_user`, `nama`, `alamat`, `nik_petugas`) VALUES
(1, 'erwan', 'jl.kemiling', 123),
(2, 'aurilia', 'jl.senen', 1234),
(3, 'dedy', 'jl.rawajitu', 12345);

-- --------------------------------------------------------

--
-- Stand-in structure for view `rekapanbulanan`
--
CREATE TABLE `rekapanbulanan` (
`bulan` varchar(9)
,`total` double
);

-- --------------------------------------------------------

--
-- Table structure for table `sampah`
--

CREATE TABLE `sampah` (
  `id_sampah` int(11) NOT NULL,
  `harga` varchar(16) NOT NULL,
  `jns_smph` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sampah`
--

INSERT INTO `sampah` (`id_sampah`, `harga`, `jns_smph`) VALUES
(1, '3000', 'kardus'),
(2, '4000', 'plastik');

-- --------------------------------------------------------

--
-- Table structure for table `sandi`
--

CREATE TABLE `sandi` (
  `id_sandi` int(11) NOT NULL,
  `nm_sandi` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sandi`
--

INSERT INTO `sandi` (`id_sandi`, `nm_sandi`) VALUES
(1, 'menabung'),
(2, 'penarikan');

-- --------------------------------------------------------

--
-- Stand-in structure for view `tabungansampah`
--
CREATE TABLE `tabungansampah` (
`nasabah` varchar(50)
,`total` double
);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `jumlah_smph` int(11) NOT NULL,
  `id_sandi` int(11) NOT NULL,
  `nik_nasabah` int(16) NOT NULL,
  `nik_petugas` int(16) NOT NULL,
  `id_sampah` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `tanggal`, `jumlah_smph`, `id_sandi`, `nik_nasabah`, `nik_petugas`, `id_sampah`) VALUES
(3, '2018-11-08', 4, 1, 12345678, 12345, 1),
(17, '2018-11-13', 6, 1, 123456789, 12345, 1),
(18, '2018-11-01', 4, 1, 12345678, 12345, 1),
(19, '2018-11-13', 4, 1, 12345678, 12345, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `username` varchar(25) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(225) NOT NULL,
  `lv_user` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `username`, `email`, `password`, `lv_user`) VALUES
(1, 'erwan', 'erwan@polinela.ac.id', '21232f297a57a5a743894a0e4a801fc3', 1),
(2, 'Aurilia vica', 'aurilia@polinela.ac.id', '21232f297a57a5a743894a0e4a801fc3', 1),
(3, 'Dedy Indra', 'dedy@polinela.ac.id', '21232f297a57a5a743894a0e4a801fc3', 1),
(4, 'bambang', 'bambang@gmail.com', '21232f297a57a5a743894a0e4a801fc3', 2),
(5, 'admin', 'email2@gmail.com', '21232f297a57a5a743894a0e4a801fc3', 2);

-- --------------------------------------------------------

--
-- Structure for view `master`
--
DROP TABLE IF EXISTS `master`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `master`  AS  select `a`.`tanggal` AS `tanggal`,`a`.`id_transaksi` AS `id_transaksi`,`a`.`jumlah_smph` AS `jumlah_smph`,`b`.`nama` AS `nama`,`b`.`norek` AS `norek`,`c`.`nama` AS `petugas`,`c`.`nik_petugas` AS `nik_petugas`,`d`.`nm_sandi` AS `nm_sandi`,`e`.`jns_smph` AS `jns_smph`,`e`.`harga` AS `harga`,`f`.`username` AS `username`,`f`.`lv_user` AS `level`,(`e`.`harga` * `a`.`jumlah_smph`) AS `total_tabungan` from (((((`transaksi` `a` join `nasabah` `b`) join `petugas` `c`) join `sandi` `d`) join `sampah` `e`) join `user` `f`) where ((`a`.`nik_nasabah` = `b`.`nik_nasabah`) and (`c`.`nik_petugas` = `a`.`nik_petugas`) and (`d`.`id_sandi` = `a`.`id_sandi`) and (`e`.`id_sampah` = `a`.`id_sampah`) and (`f`.`id_user` = `b`.`id_user`)) ;

-- --------------------------------------------------------

--
-- Structure for view `penarikan`
--
DROP TABLE IF EXISTS `penarikan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `penarikan`  AS  select `a`.`tanggal` AS `tanggal`,(sum((`b`.`harga` * `a`.`jumlah_smph`)) - (`b`.`harga` * `a`.`jumlah_smph`)) AS `saldo` from (`transaksi` `a` join `sampah` `b`) where (`a`.`id_sampah` = `b`.`id_sampah`) group by `a`.`tanggal` ;

-- --------------------------------------------------------

--
-- Structure for view `rekapanbulanan`
--
DROP TABLE IF EXISTS `rekapanbulanan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `rekapanbulanan`  AS  select monthname(`a`.`tanggal`) AS `bulan`,sum((`b`.`harga` * `a`.`jumlah_smph`)) AS `total` from (`transaksi` `a` join `sampah` `b`) where (`a`.`id_sampah` = `b`.`id_sampah`) group by month(`a`.`tanggal`) ;

-- --------------------------------------------------------

--
-- Structure for view `tabungansampah`
--
DROP TABLE IF EXISTS `tabungansampah`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tabungansampah`  AS  select `c`.`nama` AS `nasabah`,(`b`.`harga` * `a`.`jumlah_smph`) AS `total` from ((`transaksi` `a` join `sampah` `b`) join `nasabah` `c`) where ((`a`.`id_sampah` = `b`.`id_sampah`) and (`a`.`nik_nasabah` = `c`.`nik_nasabah`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `nasabah`
--
ALTER TABLE `nasabah`
  ADD PRIMARY KEY (`nik_nasabah`) USING BTREE,
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`nik_petugas`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `sampah`
--
ALTER TABLE `sampah`
  ADD PRIMARY KEY (`id_sampah`);

--
-- Indexes for table `sandi`
--
ALTER TABLE `sandi`
  ADD PRIMARY KEY (`id_sandi`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `id_nasabah` (`nik_nasabah`),
  ADD KEY `nik_nasabah` (`nik_nasabah`),
  ADD KEY `nik_petugas` (`nik_petugas`),
  ADD KEY `id_sandi` (`id_sandi`),
  ADD KEY `id_sampah` (`id_sampah`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `sampah`
--
ALTER TABLE `sampah`
  MODIFY `id_sampah` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `sandi`
--
ALTER TABLE `sandi`
  MODIFY `id_sandi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `nasabah`
--
ALTER TABLE `nasabah`
  ADD CONSTRAINT `nasabah_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Constraints for table `petugas`
--
ALTER TABLE `petugas`
  ADD CONSTRAINT `petugas_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`nik_nasabah`) REFERENCES `nasabah` (`nik_nasabah`),
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`nik_petugas`) REFERENCES `petugas` (`nik_petugas`),
  ADD CONSTRAINT `transaksi_ibfk_3` FOREIGN KEY (`id_sandi`) REFERENCES `sandi` (`id_sandi`),
  ADD CONSTRAINT `transaksi_ibfk_4` FOREIGN KEY (`id_sampah`) REFERENCES `sampah` (`id_sampah`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
