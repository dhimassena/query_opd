SELECT pgw.nama, pgw.gelar_depan, pgw.gelar_belakang, pgw.nip, CONCAT_WS(' pada ', jbt.jabatan, storg.struktur_organisasi) jabatan, max_rkerja.max_gol gol, pgw.tempat_lahir, DATE_FORMAT(pgw.tanggal_lahir, '%d-%m-%Y') tanggal_lahir, pgw.jenis_kelamin, unit.unit, subunit.sub_unit, kota.kabupaten_kota 
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
WHERE pgw.id_kedudukan_pegawai = 9
ORDER BY pgw.nama ASC