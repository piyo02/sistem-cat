#Beberapa solusi error

#tidak bisa hapus mapel, 
penyebab : ada link antara tabel m_mapel dgn tabel tr_mapel_siswa (yg di versi 2 ini tidak ada, sehingga error)

solusi : 
1. masuk http://localhost/phpmyadmin
2. pilih database "db_cat_dua" (sesuai setting di database.php)
3. pilih tab "SQL"
4. copy pastekan :

DROP TRIGGER IF EXISTS `hapus_mapel`;
CREATE TRIGGER `hapus_mapel` AFTER DELETE ON `m_mapel` FOR EACH ROW BEGIN
DELETE FROM m_soal WHERE m_soal.id_mapel = OLD.id;
DELETE FROM tr_guru_mapel WHERE tr_guru_mapel.id_mapel = OLD.id;
DELETE FROM tr_guru_tes WHERE tr_guru_tes.id_mapel = OLD.id;
END

5. klik tombol "Go"
