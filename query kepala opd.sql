SELECT pgw.nama, pgw.gelar_depan, pgw.gelar_belakang, pgw.nip, jbt.jabatan, max_rkerja.max_gol gol, (tkt.tingkatan), unit.unit, subunit.sub_unit, subunit.id_sub_unit, jbt.id_jabatan
FROM tbl_pegawai pgw 
LEFT JOIN tbl_struktur_jabatan stjbt ON pgw.id_struktur_jabatan = stjbt.id_struktur_jabatan 
LEFT JOIN tbl_jabatan jbt ON stjbt.id_jabatan = jbt.id_jabatan 
LEFT JOIN tbl_struktur_organisasi storg ON stjbt.id_struktur_organisasi = storg.id_struktur_organisasi 
LEFT JOIN tbl_tingkatan tkt ON storg.id_tingkatan = tkt.id_tingkatan
LEFT JOIN tbl_sub_unit subunit ON storg.id_sub_unit = subunit.id_sub_unit 
LEFT JOIN tbl_unit unit ON subunit.id_unit = unit.id_unit
LEFT JOIN (SELECT rkerja.nip, MAX(rkerja.golongan) max_gol, MAX(rkerja.masa_kerja) max_kerja 
         FROM tbl_riwayat_pekerjaan rkerja
         GROUP BY rkerja.nip) max_rkerja ON pgw.nip = max_rkerja.nip 
WHERE (jbt.id_jabatan = 2 OR jbt.id_jabatan = 3 OR jbt.id_jabatan = 4 OR jbt.id_jabatan = 7 OR jbt.id_jabatan = 8 OR
      jbt.id_jabatan = 23 OR jbt.id_jabatan = 24)