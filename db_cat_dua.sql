-- phpMyAdmin SQL Dump
-- version 4.6.6deb5ubuntu0.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: 20 Jul 2021 pada 18.03
-- Versi Server: 5.7.34-0ubuntu0.18.04.1
-- PHP Version: 7.2.24-0ubuntu0.18.04.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_cat_dua`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `mapel_tes`
--

CREATE TABLE `mapel_tes` (
  `id` int(6) NOT NULL,
  `mapel_id` int(6) NOT NULL,
  `guru_tes_id` int(6) NOT NULL,
  `jml_soal` int(11) NOT NULL,
  `waktu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `mapel_tes`
--

INSERT INTO `mapel_tes` (`id`, `mapel_id`, `guru_tes_id`, `jml_soal`, `waktu`) VALUES
(1, 2, 7, 2, 2),
(2, 2, 8, 3, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_admin`
--

CREATE TABLE `m_admin` (
  `id` int(6) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `level` enum('admin','guru','siswa') NOT NULL,
  `kon_id` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `m_admin`
--

INSERT INTO `m_admin` (`id`, `username`, `password`, `level`, `kon_id`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin', 0),
(2, '12345678', '25d55ad283aa400af464c76d713c07ad', 'siswa', 7),
(3, '1003', 'aa68c75c4a77c87f97fb686b2f068676', 'guru', 6),
(6, 'E1E1001', '1048bc5626f622fa879bab502f51f081', 'siswa', 9),
(7, '192', '58a2fc6ed39fd083f55d4182bf88826d', 'guru', 8),
(8, '12345', '827ccb0eea8a706c4c34a16891f84e7b', 'siswa', 10),
(9, '192168', '8715a011adc72b7a7a8c2730536f99c2', 'guru', 9);

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_guru`
--

CREATE TABLE `m_guru` (
  `id` int(6) NOT NULL,
  `nip` varchar(30) NOT NULL,
  `nama` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `m_guru`
--

INSERT INTO `m_guru` (`id`, `nip`, `nama`) VALUES
(6, '1003', 'Erik Maulana'),
(8, '192', 'a1'),
(9, '192168', 'Guru');

--
-- Trigger `m_guru`
--
DELIMITER $$
CREATE TRIGGER `hapus_guru` AFTER DELETE ON `m_guru` FOR EACH ROW BEGIN
DELETE FROM m_soal WHERE m_soal.id_guru = OLD.id;
DELETE FROM m_admin WHERE m_admin.level = 'guru' AND m_admin.kon_id = OLD.id;
DELETE FROM tr_guru_mapel WHERE tr_guru_mapel.id_guru = OLD.id;
DELETE FROM tr_guru_tes WHERE tr_guru_tes.id_guru = OLD.id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_mapel`
--

CREATE TABLE `m_mapel` (
  `id` int(6) NOT NULL,
  `nama` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `m_mapel`
--

INSERT INTO `m_mapel` (`id`, `nama`) VALUES
(1, 'Pengetahuan'),
(2, 'Kecermatan A'),
(3, 'Kecermatan B'),
(4, 'Kecermatan C'),
(5, 'Kecermatan D'),
(6, 'Kecermatan E'),
(7, 'Kecermatan F'),
(8, 'Kecermatan G'),
(9, 'Kecermatan H'),
(10, 'Kecermatan I'),
(11, 'Kecermatan J'),
(12, 'Kecermatan 1'),
(13, 'Kecermatan 2'),
(14, 'Kecermatan 3'),
(15, 'Kecermatan 4'),
(16, 'Kecermatan 5'),
(17, 'Kecermatan 6'),
(18, 'Kecermatan 7'),
(19, 'Kecermatan 8'),
(20, 'Kecermatan 9'),
(21, 'Kecermatan 10'),
(22, 'Mata Pelajaran');

--
-- Trigger `m_mapel`
--
DELIMITER $$
CREATE TRIGGER `hapus_mapel` AFTER DELETE ON `m_mapel` FOR EACH ROW BEGIN
DELETE FROM m_soal WHERE m_soal.id_mapel = OLD.id;
DELETE FROM tr_guru_mapel WHERE tr_guru_mapel.id_mapel = OLD.id;
DELETE FROM tr_guru_tes WHERE tr_guru_tes.id_mapel = OLD.id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_siswa`
--

CREATE TABLE `m_siswa` (
  `id` int(6) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `nim` varchar(50) NOT NULL,
  `jurusan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `m_siswa`
--

INSERT INTO `m_siswa` (`id`, `nama`, `nim`, `jurusan`) VALUES
(7, 'Kahiyang Ayu', '12345678', 'Teknik Informatika'),
(9, 'Al Zidni Kasim', 'E1E1001', 'teknik'),
(10, 'Siswa', '12345', 'teknik sipil');

--
-- Trigger `m_siswa`
--
DELIMITER $$
CREATE TRIGGER `hapus_siswa` AFTER DELETE ON `m_siswa` FOR EACH ROW BEGIN
DELETE FROM tr_ikut_ujian WHERE tr_ikut_ujian.id_user = OLD.id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_soal`
--

CREATE TABLE `m_soal` (
  `id` int(6) NOT NULL,
  `id_guru` int(6) NOT NULL,
  `id_mapel` int(6) NOT NULL,
  `bobot` int(2) NOT NULL,
  `file` varchar(150) DEFAULT NULL,
  `tipe_file` varchar(50) DEFAULT NULL,
  `soal` longtext,
  `opsi_a` longtext,
  `opsi_b` longtext,
  `opsi_c` longtext,
  `opsi_d` longtext,
  `opsi_e` longtext,
  `jawaban` varchar(5) NOT NULL,
  `tgl_input` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `jml_benar` int(6) DEFAULT NULL,
  `jml_salah` int(6) DEFAULT NULL,
  `jml_opsi` int(11) NOT NULL DEFAULT '5'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `m_soal`
--

INSERT INTO `m_soal` (`id`, `id_guru`, `id_mapel`, `bobot`, `file`, `tipe_file`, `soal`, `opsi_a`, `opsi_b`, `opsi_c`, `opsi_d`, `opsi_e`, `jawaban`, `tgl_input`, `jml_benar`, `jml_salah`, `jml_opsi`) VALUES
(2857, 6, 2, 1, NULL, NULL, '<p>a</p>\n', '#####<p>a</p>\n', '#####<p>b</p>\n', '#####<p>c</p>\n', '#####<p>d</p>\n', '#####<p>e</p>\n', 'A', '2021-07-17 23:19:10', NULL, NULL, 5),
(2859, 6, 2, 1, NULL, NULL, '<p>soal 1</p>\n', '#####<p>opsi a</p>\n', '#####<p>opsi b</p>\n', '#####<p>opsi c</p>\n', '#####<p>opsi d</p>\n', '#####<p>opsi e</p>\n', 'A', '2021-07-18 00:09:44', NULL, NULL, 5),
(2860, 6, 2, 1, NULL, NULL, '<p>ini contoh soal</p>\n', '#####<p>opsi a</p>\n', '#####<p>opsi b</p>\n', '#####<p>opsi c</p>\n', '#####<p>opsi d</p>\n', '#####<p>opsi e</p>\n', 'C', '2021-07-19 16:28:46', NULL, NULL, 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tr_guru_mapel`
--

CREATE TABLE `tr_guru_mapel` (
  `id` int(6) NOT NULL,
  `id_guru` int(6) NOT NULL,
  `id_mapel` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tr_guru_mapel`
--

INSERT INTO `tr_guru_mapel` (`id`, `id_guru`, `id_mapel`) VALUES
(3, 6, 1),
(4, 6, 2),
(5, 6, 3),
(6, 6, 4),
(7, 6, 5),
(8, 6, 6),
(9, 6, 7),
(10, 6, 8),
(11, 6, 9),
(12, 6, 10),
(13, 6, 11),
(14, 6, 12),
(15, 6, 13),
(16, 6, 14),
(17, 6, 15),
(18, 6, 16),
(19, 6, 17),
(20, 6, 18),
(21, 6, 19),
(22, 6, 20),
(23, 6, 21),
(24, 9, 1),
(25, 9, 5),
(26, 9, 9);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tr_guru_tes`
--

CREATE TABLE `tr_guru_tes` (
  `id` int(6) NOT NULL,
  `id_guru` int(6) NOT NULL,
  `nama_ujian` varchar(200) NOT NULL,
  `jenis` enum('acak','set') NOT NULL,
  `detil_jenis` varchar(50) NOT NULL,
  `tgl_mulai` datetime NOT NULL,
  `terlambat` datetime NOT NULL,
  `token` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tr_guru_tes`
--

INSERT INTO `tr_guru_tes` (`id`, `id_guru`, `nama_ujian`, `jenis`, `detil_jenis`, `tgl_mulai`, `terlambat`, `token`) VALUES
(7, 6, 'aaa', 'acak', '', '2021-07-18 00:00:00', '2021-07-20 00:00:00', 'JIHYE'),
(8, 6, 'Contoh Ujian', 'acak', '', '2021-07-19 00:00:00', '2021-07-20 00:00:00', 'ZTSBQ');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tr_ikut_ujian`
--

CREATE TABLE `tr_ikut_ujian` (
  `id` int(6) NOT NULL,
  `id_tes` int(6) NOT NULL,
  `id_user` int(6) NOT NULL,
  `list_soal` longtext NOT NULL,
  `list_jawaban` longtext NOT NULL,
  `jml_benar` int(6) NOT NULL,
  `nilai` decimal(10,2) NOT NULL,
  `nilai_bobot` decimal(10,2) NOT NULL,
  `tgl_mulai` datetime NOT NULL,
  `tgl_selesai` datetime NOT NULL,
  `status` enum('Y','N') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tr_ikut_ujian`
--

INSERT INTO `tr_ikut_ujian` (`id`, `id_tes`, `id_user`, `list_soal`, `list_jawaban`, `jml_benar`, `nilai`, `nilai_bobot`, `tgl_mulai`, `tgl_selesai`, `status`) VALUES
(11, 7, 7, '2859,2857', '2859:A:N,2857:A:N', 2, '100.00', '100.00', '2021-07-18 00:11:00', '2021-07-18 00:13:00', 'N'),
(12, 8, 10, '2860,2859,2857', '2860:C:N,2859:D:Y,2857:A:N', 2, '66.67', '66.67', '2021-07-19 16:31:16', '2021-07-19 16:32:16', 'N');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `mapel_tes`
--
ALTER TABLE `mapel_tes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_admin`
--
ALTER TABLE `m_admin`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kon_id` (`kon_id`);

--
-- Indexes for table `m_guru`
--
ALTER TABLE `m_guru`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_mapel`
--
ALTER TABLE `m_mapel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_siswa`
--
ALTER TABLE `m_siswa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_soal`
--
ALTER TABLE `m_soal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_guru` (`id_guru`),
  ADD KEY `id_mapel` (`id_mapel`);

--
-- Indexes for table `tr_guru_mapel`
--
ALTER TABLE `tr_guru_mapel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_guru` (`id_guru`),
  ADD KEY `id_mapel` (`id_mapel`);

--
-- Indexes for table `tr_guru_tes`
--
ALTER TABLE `tr_guru_tes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_guru` (`id_guru`);

--
-- Indexes for table `tr_ikut_ujian`
--
ALTER TABLE `tr_ikut_ujian`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_tes` (`id_tes`),
  ADD KEY `id_user` (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `mapel_tes`
--
ALTER TABLE `mapel_tes`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `m_admin`
--
ALTER TABLE `m_admin`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `m_guru`
--
ALTER TABLE `m_guru`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `m_mapel`
--
ALTER TABLE `m_mapel`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `m_siswa`
--
ALTER TABLE `m_siswa`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `m_soal`
--
ALTER TABLE `m_soal`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2861;
--
-- AUTO_INCREMENT for table `tr_guru_mapel`
--
ALTER TABLE `tr_guru_mapel`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `tr_guru_tes`
--
ALTER TABLE `tr_guru_tes`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `tr_ikut_ujian`
--
ALTER TABLE `tr_ikut_ujian`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `m_soal`
--
ALTER TABLE `m_soal`
  ADD CONSTRAINT `m_soal_ibfk_1` FOREIGN KEY (`id_guru`) REFERENCES `m_guru` (`id`),
  ADD CONSTRAINT `m_soal_ibfk_2` FOREIGN KEY (`id_mapel`) REFERENCES `m_mapel` (`id`);

--
-- Ketidakleluasaan untuk tabel `tr_guru_mapel`
--
ALTER TABLE `tr_guru_mapel`
  ADD CONSTRAINT `tr_guru_mapel_ibfk_1` FOREIGN KEY (`id_guru`) REFERENCES `m_guru` (`id`),
  ADD CONSTRAINT `tr_guru_mapel_ibfk_2` FOREIGN KEY (`id_mapel`) REFERENCES `m_mapel` (`id`);

--
-- Ketidakleluasaan untuk tabel `tr_guru_tes`
--
ALTER TABLE `tr_guru_tes`
  ADD CONSTRAINT `tr_guru_tes_ibfk_1` FOREIGN KEY (`id_guru`) REFERENCES `m_guru` (`id`);

--
-- Ketidakleluasaan untuk tabel `tr_ikut_ujian`
--
ALTER TABLE `tr_ikut_ujian`
  ADD CONSTRAINT `tr_ikut_ujian_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `m_siswa` (`id`),
  ADD CONSTRAINT `tr_ikut_ujian_ibfk_2` FOREIGN KEY (`id_tes`) REFERENCES `tr_guru_tes` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
