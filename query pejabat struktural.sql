SELECT pgw.nama, pgw.gelar_depan, pgw.gelar_belakang, pgw.nip, max_rkerja.max_gol golongan, max_pend.ijazah pendidikan, tkt.tingkatan eselon, jbt.id_jabatan, CONCAT_WS(' pada ', jbt.jabatan, storg.struktur_organisasi) jabatan, unit.id_unit, unit.unit, subunit.sub_unit, DATE_FORMAT(pgw.tanggal_lahir, '%d-%m-%Y') tanggal_lahir, pgw.tempat_lahir, pgw.telepon, kota.kabupaten_kota, pgw.jenis_kelamin 
FROM tbl_pegawai pgw 
LEFT JOIN tbl_kabupaten_kota kota ON pgw.id_kabupaten_kota = kota.id_kabupaten_kota 
LEFT JOIN tbl_struktur_jabatan stjbt ON pgw.id_struktur_jabatan = stjbt.id_struktur_jabatan 
LEFT JOIN tbl_jabatan jbt ON stjbt.id_jabatan = jbt.id_jabatan 
LEFT JOIN tbl_struktur_organisasi storg ON stjbt.id_struktur_organisasi = storg.id_struktur_organisasi 
LEFT JOIN tbl_tingkatan tkt ON storg.id_tingkatan = tkt.id_tingkatan
LEFT JOIN tbl_sub_unit subunit ON storg.id_sub_unit = subunit.id_sub_unit 
LEFT JOIN tbl_unit unit ON subunit.id_unit = unit.id_unit
LEFT JOIN (SELECT rkerja.nip, MAX(rkerja.golongan) max_gol, MAX(rkerja.masa_kerja) max_kerja 
         FROM tbl_riwayat_pekerjaan rkerja 
         GROUP BY rkerja.nip) max_rkerja ON pgw.nip = max_rkerja.nip 
LEFT JOIN (SELECT rpend.nip, jur.jurusan juru, YEAR(MAX(rpend.tanggal_ijazah)) max_th_lulus, pend.pendidikan ijazah
         FROM tbl_riwayat_pendidikan rpend, tbl_pendidikan pend, tbl_jurusan jur
         WHERE rpend.id_pendidikan = pend.id_pendidikan
         AND rpend.id_jurusan = jur.id_jurusan
         GROUP BY rpend.nip) max_pend ON pgw.nip = max_pend.nip
WHERE unit.id_unit = 3 
AND jbt.id_jabatan != 25 
AND tkt.tingkatan != 'Non Eselon'
AND pgw.id_kedudukan_pegawai NOT IN (9,10,11) 
ORDER BY eselon ASC, jbt.id_jabatan ASC