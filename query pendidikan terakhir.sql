SELECT pgw.nama, pgw.gelar_depan, pgw.gelar_belakang, pgw.nip, CONCAT_WS(' pada ', jbt.jabatan, storg.struktur_organisasi) jabatan, tkt.tingkatan eselon, jbt.id_jabatan, max_rkerja.max_gol gol, pgw.tempat_lahir, kota.kabupaten_kota, DATE_FORMAT(pgw.tanggal_lahir, '%d-%m-%Y') tanggal_lahir, pgw.jenis_kelamin, unit.unit, subunit.sub_unit, max_pend.ijazah pendidikan, max_pend.institusi, max_pend.juru jurusan, max_pend.id_kelompok_jurusan, FLOOR((max_rkerja.max_kerja)/365) masa_kerja, DATE_FORMAT(cpns.tmt, '%d-%m-%Y') tmt_cpns
FROM tbl_pegawai pgw 
LEFT JOIN tbl_cpns cpns ON pgw.nip = cpns.nip 
LEFT JOIN tbl_struktur_jabatan stjbt ON pgw.id_struktur_jabatan = stjbt.id_struktur_jabatan 
LEFT JOIN tbl_jabatan jbt ON stjbt.id_jabatan = jbt.id_jabatan 
LEFT JOIN tbl_kabupaten_kota kota ON pgw.id_kabupaten_kota = kota.id_kabupaten_kota 
LEFT JOIN tbl_struktur_organisasi storg ON stjbt.id_struktur_organisasi = storg.id_struktur_organisasi 
LEFT JOIN tbl_tingkatan tkt ON storg.id_tingkatan = tkt.id_tingkatan 
LEFT JOIN tbl_sub_unit subunit ON storg.id_sub_unit = subunit.id_sub_unit 
LEFT JOIN tbl_unit unit ON subunit.id_unit = unit.id_unit 
LEFT JOIN (SELECT rkerja.nip, MAX(rkerja.golongan) max_gol, MAX(rkerja.masa_kerja) max_kerja 
         FROM tbl_riwayat_pekerjaan rkerja
         GROUP BY rkerja.nip) max_rkerja ON pgw.nip = max_rkerja.nip 
LEFT JOIN (SELECT rpend.nip, jur.jurusan juru, jur.id_kelompok_jurusan, rpend.institusi, YEAR(MAX(rpend.tanggal_ijazah)) max_th_lulus, pend.pendidikan ijazah
         FROM tbl_riwayat_pendidikan rpend, tbl_pendidikan pend, tbl_jurusan jur
         WHERE rpend.id_pendidikan = pend.id_pendidikan
         AND rpend.id_jurusan = jur.id_jurusan
         GROUP BY rpend.nip) max_pend ON pgw.nip = max_pend.nip
WHERE pgw.id_kedudukan_pegawai NOT IN (9,10,11) 
AND unit.id_unit = $id_unit
ORDER BY eselon ASC, jbt.id_jabatan ASC

SELECT pgw.nama, pgw.gelar_depan, pgw.gelar_belakang, pgw.nip, CONCAT_WS(' pada ', jbt.jabatan, storg.struktur_organisasi) jabatan, max_rkerja.max_gol gol, pgw.tempat_lahir, kota.kabupaten_kota, DATE_FORMAT(pgw.tanggal_lahir, '%d-%m-%Y') tanggal_lahir, pgw.jenis_kelamin, unit.unit, subunit.sub_unit, max_pend.ijazah pendidikan, max_pend.kelompok_jurusan, FLOOR((max_rkerja.max_kerja)/365) masa_kerja
FROM tbl_pegawai pgw 
LEFT JOIN tbl_struktur_jabatan stjbt ON pgw.id_struktur_jabatan = stjbt.id_struktur_jabatan 
LEFT JOIN tbl_jabatan jbt ON stjbt.id_jabatan = jbt.id_jabatan 
LEFT JOIN tbl_kabupaten_kota kota ON pgw.id_kabupaten_kota = kota.id_kabupaten_kota 
LEFT JOIN tbl_struktur_organisasi storg ON stjbt.id_struktur_organisasi = storg.id_struktur_organisasi 
LEFT JOIN tbl_sub_unit subunit ON storg.id_sub_unit = subunit.id_sub_unit 
LEFT JOIN tbl_unit unit ON subunit.id_unit = unit.id_unit 
LEFT JOIN (SELECT rkerja.nip, MAX(rkerja.golongan) max_gol, MAX(rkerja.masa_kerja) max_kerja 
         FROM tbl_riwayat_pekerjaan rkerja
         GROUP BY rkerja.nip) max_rkerja ON pgw.nip = max_rkerja.nip 
LEFT JOIN (SELECT rpend.nip, jur.jurusan juru, YEAR(MAX(rpend.tanggal_ijazah)) max_th_lulus, pend.pendidikan ijazah, 			 klp_jur.kelompok_jurusan
         FROM tbl_riwayat_pendidikan rpend, tbl_pendidikan pend, tbl_jurusan jur, tbl_kelompok_jurusan klp_jur
         WHERE rpend.id_pendidikan = pend.id_pendidikan
         AND rpend.id_jurusan = jur.id_jurusan
         AND jur.id_kelompok_jurusan = klp_jur.id_kelompok_jurusan
         GROUP BY rpend.nip) max_pend ON pgw.nip = max_pend.nip
WHERE pgw.id_kedudukan_pegawai NOT IN (9,10,11) 
ORDER BY pgw.nama ASC

SELECT rpend.nip, jur.jurusan juru, YEAR(MAX(rpend.tanggal_ijazah)) max_th_lulus, pend.pendidikan ijazah, 			 klp_jur.kelompok_jurusan
FROM tbl_riwayat_pendidikan rpend
LEFT JOIN tbl_pendidikan pend ON rpend.id_pendidikan = pend.id_pendidikan 
LEFT JOIN tbl_jurusan jur ON rpend.id_jurusan = jur.id_jurusan 
LEFT JOIN tbl_kelompok_jurusan klp_jur ON jur.id_kelompok_jurusan = klp_jur.id_kelompok_jurusan 
GROUP BY rpend.nip