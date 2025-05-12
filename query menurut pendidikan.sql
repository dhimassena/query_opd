SELECT unit, 
SUM(CASE WHEN (max_pend.ijazah = 'SD' AND pgw.jenis_kelamin = 'Pria') THEN 1 ELSE 0 END) jml_sd_pria,
SUM(CASE WHEN (max_pend.ijazah = 'SLTP' AND pgw.jenis_kelamin = 'Pria') THEN 1 ELSE 0 END) jml_sltp_pria,
SUM(CASE WHEN (max_pend.ijazah = 'SLTP Kejuruan' AND pgw.jenis_kelamin = 'Pria') THEN 1 ELSE 0 END) jml_sltp_kejuruan_pria,
SUM(CASE WHEN (max_pend.ijazah = 'SLTA' AND pgw.jenis_kelamin = 'Pria') THEN 1 ELSE 0 END) jml_slta_pria,
SUM(CASE WHEN (max_pend.ijazah = 'D.I' AND pgw.jenis_kelamin = 'Pria') THEN 1 ELSE 0 END) jml_di_pria,
SUM(CASE WHEN (max_pend.ijazah = 'D.II' AND pgw.jenis_kelamin = 'Pria') THEN 1 ELSE 0 END) jml_dii_pria,
SUM(CASE WHEN (max_pend.ijazah = 'D.III/Akademi' AND pgw.jenis_kelamin = 'Pria') THEN 1 ELSE 0 END) jml_diii_akademi_pria,
SUM(CASE WHEN (max_pend.ijazah = 'D.IV' AND pgw.jenis_kelamin = 'Pria') THEN 1 ELSE 0 END) jml_div_pria,
SUM(CASE WHEN (max_pend.ijazah = 'S.1' AND pgw.jenis_kelamin = 'Pria') THEN 1 ELSE 0 END) jml_s1_pria,
SUM(CASE WHEN (max_pend.ijazah = 'S.2' AND pgw.jenis_kelamin = 'Pria') THEN 1 ELSE 0 END) jml_s2_pria,
SUM(CASE WHEN (max_pend.ijazah = 'S.3' AND pgw.jenis_kelamin = 'Pria') THEN 1 ELSE 0 END) jml_s3_pria,
SUM(CASE WHEN (max_pend.ijazah = 'Spesialis I' AND pgw.jenis_kelamin = 'Pria') THEN 1 ELSE 0 END) jml_spesialis_i_pria,
SUM(CASE WHEN (max_pend.ijazah = 'Spesialis II' AND pgw.jenis_kelamin = 'Pria') THEN 1 ELSE 0 END) jml_spesialis_ii_pria,
SUM(CASE WHEN (max_pend.ijazah = 'Profesi' AND pgw.jenis_kelamin = 'Pria') THEN 1 ELSE 0 END) jml_profesi_pria,
SUM(CASE WHEN (max_pend.ijazah = 'AKTA IV' AND pgw.jenis_kelamin = 'Pria') THEN 1 ELSE 0 END) jml_akta_iv_pria,
SUM(CASE WHEN (max_pend.ijazah = 'SD' AND pgw.jenis_kelamin = 'Wanita') THEN 1 ELSE 0 END) jml_sd_wanita,
SUM(CASE WHEN (max_pend.ijazah = 'SLTP' AND pgw.jenis_kelamin = 'Wanita') THEN 1 ELSE 0 END) jml_sltp_wanita,
SUM(CASE WHEN (max_pend.ijazah = 'SLTP Kejuruan' AND pgw.jenis_kelamin = 'Wanita') THEN 1 ELSE 0 END) jml_sltp_kejuruan_wanita,
SUM(CASE WHEN (max_pend.ijazah = 'SLTA' AND pgw.jenis_kelamin = 'Wanita') THEN 1 ELSE 0 END) jml_slta_wanita,
SUM(CASE WHEN (max_pend.ijazah = 'D.I' AND pgw.jenis_kelamin = 'Wanita') THEN 1 ELSE 0 END) jml_di_wanita,
SUM(CASE WHEN (max_pend.ijazah = 'D.II' AND pgw.jenis_kelamin = 'Wanita') THEN 1 ELSE 0 END) jml_dii_wanita,
SUM(CASE WHEN (max_pend.ijazah = 'D.III/Akademi' AND pgw.jenis_kelamin = 'Wanita') THEN 1 ELSE 0 END) jml_diii_akademi_wanita,
SUM(CASE WHEN (max_pend.ijazah = 'D.IV' AND pgw.jenis_kelamin = 'Wanita') THEN 1 ELSE 0 END) jml_div_wanita,
SUM(CASE WHEN (max_pend.ijazah = 'S.1' AND pgw.jenis_kelamin = 'Wanita') THEN 1 ELSE 0 END) jml_s1_wanita,
SUM(CASE WHEN (max_pend.ijazah = 'S.2' AND pgw.jenis_kelamin = 'Wanita') THEN 1 ELSE 0 END) jml_s2_wanita,
SUM(CASE WHEN (max_pend.ijazah = 'S.3' AND pgw.jenis_kelamin = 'Wanita') THEN 1 ELSE 0 END) jml_s3_wanita,
SUM(CASE WHEN (max_pend.ijazah = 'Spesialis I' AND pgw.jenis_kelamin = 'Wanita') THEN 1 ELSE 0 END) jml_spesialis_i_wanita,
SUM(CASE WHEN (max_pend.ijazah = 'Spesialis II' AND pgw.jenis_kelamin = 'Wanita') THEN 1 ELSE 0 END) jml_spesialis_ii_wanita,
SUM(CASE WHEN (max_pend.ijazah = 'Profesi' AND pgw.jenis_kelamin = 'Wanita') THEN 1 ELSE 0 END) jml_profesi_wanita,
SUM(CASE WHEN (max_pend.ijazah = 'AKTA IV' AND pgw.jenis_kelamin = 'Wanita') THEN 1 ELSE 0 END) jml_akta_iv_wanita
FROM tbl_pegawai pgw
LEFT JOIN (SELECT rpend.nip, pend.pendidikan ijazah
     FROM tbl_riwayat_pendidikan rpend, tbl_pendidikan pend
     WHERE rpend.id_pendidikan = pend.id_pendidikan
     GROUP BY rpend.nip) max_pend ON pgw.nip = max_pend.nip
LEFT JOIN tbl_struktur_jabatan stjbt ON pgw.id_struktur_jabatan = stjbt.id_struktur_jabatan
LEFT JOIN tbl_struktur_organisasi storg ON stjbt.id_struktur_organisasi = storg.id_struktur_organisasi 
LEFT JOIN tbl_sub_unit subunit ON storg.id_sub_unit = subunit.id_sub_unit
LEFT JOIN tbl_unit unit ON subunit.id_unit = unit.id_unit 
WHERE pgw.id_kedudukan_pegawai NOT IN (9,10,11)
AND pgw.jenis_kelamin IS NOT NULL
GROUP BY unit ORDER BY unit

SELECT COUNT(max_pend.ijazah) ijazah
FROM tbl_pegawai pgw
LEFT JOIN (SELECT rpend.nip, pend.pendidikan ijazah
     FROM tbl_riwayat_pendidikan rpend, tbl_pendidikan pend
     WHERE rpend.id_pendidikan = pend.id_pendidikan
     GROUP BY rpend.nip) max_pend ON pgw.nip = max_pend.nip
LEFT JOIN tbl_struktur_jabatan stjbt ON pgw.id_struktur_jabatan = stjbt.id_struktur_jabatan
LEFT JOIN tbl_struktur_organisasi storg ON stjbt.id_struktur_organisasi = storg.id_struktur_organisasi 
LEFT JOIN tbl_sub_unit subunit ON storg.id_sub_unit = subunit.id_sub_unit
LEFT JOIN tbl_unit unit ON subunit.id_unit = unit.id_unit 
WHERE pgw.id_kedudukan_pegawai NOT IN (9,10,11)
AND (max_pend.ijazah = 'S.3' AND pgw.jenis_kelamin = 'Wanita')

