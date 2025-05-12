SELECT unit, 
SUM(CASE WHEN gol.max_gol = 'I/a' THEN 1 ELSE 0 END) gol_ia,
SUM(CASE WHEN gol.max_gol = 'I/b' THEN 1 ELSE 0 END) gol_ib,
SUM(CASE WHEN gol.max_gol = 'I/c' THEN 1 ELSE 0 END) gol_ic,
SUM(CASE WHEN gol.max_gol = 'I/d' THEN 1 ELSE 0 END) gol_id,
SUM(CASE WHEN gol.max_gol = 'II/a' THEN 1 ELSE 0 END) gol_iia,
SUM(CASE WHEN gol.max_gol = 'II/b' THEN 1 ELSE 0 END) gol_iib,
SUM(CASE WHEN gol.max_gol = 'II/c' THEN 1 ELSE 0 END) gol_iic,
SUM(CASE WHEN gol.max_gol = 'II/d' THEN 1 ELSE 0 END) gol_iid,
SUM(CASE WHEN gol.max_gol = 'III/a' THEN 1 ELSE 0 END) gol_iiia,
SUM(CASE WHEN gol.max_gol = 'III/b' THEN 1 ELSE 0 END) gol_iiib,
SUM(CASE WHEN gol.max_gol = 'III/c' THEN 1 ELSE 0 END) gol_iiic,
SUM(CASE WHEN gol.max_gol = 'III/d' THEN 1 ELSE 0 END) gol_iiid,
SUM(CASE WHEN gol.max_gol = 'IV/a' THEN 1 ELSE 0 END) gol_iva,
SUM(CASE WHEN gol.max_gol = 'IV/b' THEN 1 ELSE 0 END) gol_ivb,
SUM(CASE WHEN gol.max_gol = 'IV/c' THEN 1 ELSE 0 END) gol_ivc,
SUM(CASE WHEN gol.max_gol = 'IV/d' THEN 1 ELSE 0 END) gol_ivd
FROM tbl_pegawai pgw
LEFT JOIN (SELECT rkerja.nip, MAX(rkerja.golongan) max_gol
     FROM tbl_riwayat_pekerjaan rkerja
     GROUP BY rkerja.nip) gol ON pgw.nip = gol.nip
LEFT JOIN tbl_struktur_jabatan stjbt ON pgw.id_struktur_jabatan = stjbt.id_struktur_jabatan
LEFT JOIN tbl_struktur_organisasi storg ON stjbt.id_struktur_organisasi = storg.id_struktur_organisasi 
LEFT JOIN tbl_sub_unit subunit ON storg.id_sub_unit = subunit.id_sub_unit
LEFT JOIN tbl_unit unit ON subunit.id_unit = unit.id_unit 
WHERE pgw.id_kedudukan_pegawai NOT IN (9,10,11)
AND unit IS NOT NULL
GROUP BY unit ORDER BY unit

SELECT unit, 
SUM(CASE WHEN gol.max_gol = 'I/a' AND pgw.jenis_kelamin = 'Pria' THEN 1 ELSE 0 END) gol_ia_pria,
SUM(CASE WHEN gol.max_gol = 'I/b' AND pgw.jenis_kelamin = 'Pria' THEN 1 ELSE 0 END) gol_ib_pria,
SUM(CASE WHEN gol.max_gol = 'I/c' AND pgw.jenis_kelamin = 'Pria' THEN 1 ELSE 0 END) gol_ic_pria,
SUM(CASE WHEN gol.max_gol = 'I/d' AND pgw.jenis_kelamin = 'Pria' THEN 1 ELSE 0 END) gol_id_pria,
SUM(CASE WHEN gol.max_gol = 'II/a' AND pgw.jenis_kelamin = 'Pria' THEN 1 ELSE 0 END) gol_iia_pria,
SUM(CASE WHEN gol.max_gol = 'II/b' AND pgw.jenis_kelamin = 'Pria' THEN 1 ELSE 0 END) gol_iib_pria, 
SUM(CASE WHEN gol.max_gol = 'II/c' AND pgw.jenis_kelamin = 'Pria' THEN 1 ELSE 0 END) gol_iic_pria,
SUM(CASE WHEN gol.max_gol = 'II/d'  AND pgw.jenis_kelamin = 'Pria' THEN 1 ELSE 0 END) gol_iid_pria,
SUM(CASE WHEN gol.max_gol = 'III/a' AND pgw.jenis_kelamin = 'Pria' THEN 1 ELSE 0 END) gol_iiia_pria,
SUM(CASE WHEN gol.max_gol = 'III/b' AND pgw.jenis_kelamin = 'Pria' THEN 1 ELSE 0 END) gol_iiib_pria,
SUM(CASE WHEN gol.max_gol = 'III/c' AND pgw.jenis_kelamin = 'Pria' THEN 1 ELSE 0 END) gol_iiic_pria,
SUM(CASE WHEN gol.max_gol = 'III/d' AND pgw.jenis_kelamin = 'Pria' THEN 1 ELSE 0 END) gol_iiid_pria,
SUM(CASE WHEN gol.max_gol = 'IV/a' AND pgw.jenis_kelamin = 'Pria' THEN 1 ELSE 0 END) gol_iva_pria,
SUM(CASE WHEN gol.max_gol = 'IV/b' AND pgw.jenis_kelamin = 'Pria' THEN 1 ELSE 0 END) gol_ivb_pria,
SUM(CASE WHEN gol.max_gol = 'IV/c' AND pgw.jenis_kelamin = 'Pria' THEN 1 ELSE 0 END) gol_ivc_pria,
SUM(CASE WHEN gol.max_gol = 'IV/d' AND pgw.jenis_kelamin = 'Pria' THEN 1 ELSE 0 END) gol_ivd_pria,
SUM(CASE WHEN gol.max_gol = 'I/a' AND pgw.jenis_kelamin = 'Wanita' THEN 1 ELSE 0 END) gol_ia_wanita,
SUM(CASE WHEN gol.max_gol = 'I/b' AND pgw.jenis_kelamin = 'Wanita' THEN 1 ELSE 0 END) gol_ib_wanita,
SUM(CASE WHEN gol.max_gol = 'I/c' AND pgw.jenis_kelamin = 'Wanita' THEN 1 ELSE 0 END) gol_ic_wanita,
SUM(CASE WHEN gol.max_gol = 'I/d' AND pgw.jenis_kelamin = 'Wanita' THEN 1 ELSE 0 END) gol_id_wanita,
SUM(CASE WHEN gol.max_gol = 'II/a' AND pgw.jenis_kelamin = 'Wanita' THEN 1 ELSE 0 END) gol_iia_wanita,
SUM(CASE WHEN gol.max_gol = 'II/b' AND pgw.jenis_kelamin = 'Wanita' THEN 1 ELSE 0 END) gol_iib_wanita, 
SUM(CASE WHEN gol.max_gol = 'II/c' AND pgw.jenis_kelamin = 'Wanita' THEN 1 ELSE 0 END) gol_iic_wanita,
SUM(CASE WHEN gol.max_gol = 'II/d'  AND pgw.jenis_kelamin = 'Wanita' THEN 1 ELSE 0 END) gol_iid_wanita,
SUM(CASE WHEN gol.max_gol = 'III/a' AND pgw.jenis_kelamin = 'Wanita' THEN 1 ELSE 0 END) gol_iiia_wanita,
SUM(CASE WHEN gol.max_gol = 'III/b' AND pgw.jenis_kelamin = 'Wanita' THEN 1 ELSE 0 END) gol_iiib_wanita,
SUM(CASE WHEN gol.max_gol = 'III/c' AND pgw.jenis_kelamin = 'Wanita' THEN 1 ELSE 0 END) gol_iiic_wanita,
SUM(CASE WHEN gol.max_gol = 'III/d' AND pgw.jenis_kelamin = 'Wanita' THEN 1 ELSE 0 END) gol_iiid_wanita,
SUM(CASE WHEN gol.max_gol = 'IV/a' AND pgw.jenis_kelamin = 'Wanita' THEN 1 ELSE 0 END) gol_iva_wanita,
SUM(CASE WHEN gol.max_gol = 'IV/b' AND pgw.jenis_kelamin = 'Wanita' THEN 1 ELSE 0 END) gol_ivb_wanita,
SUM(CASE WHEN gol.max_gol = 'IV/c' AND pgw.jenis_kelamin = 'Wanita' THEN 1 ELSE 0 END) gol_ivc_wanita,
SUM(CASE WHEN gol.max_gol = 'IV/d' AND pgw.jenis_kelamin = 'Wanita' THEN 1 ELSE 0 END) gol_ivd_wanita
FROM tbl_pegawai pgw
LEFT JOIN (SELECT rkerja.nip, MAX(rkerja.golongan) max_gol
     FROM tbl_riwayat_pekerjaan rkerja
     GROUP BY rkerja.nip) gol ON pgw.nip = gol.nip
LEFT JOIN tbl_struktur_jabatan stjbt ON pgw.id_struktur_jabatan = stjbt.id_struktur_jabatan
LEFT JOIN tbl_struktur_organisasi storg ON stjbt.id_struktur_organisasi = storg.id_struktur_organisasi 
LEFT JOIN tbl_sub_unit subunit ON storg.id_sub_unit = subunit.id_sub_unit
LEFT JOIN tbl_unit unit ON subunit.id_unit = unit.id_unit 
WHERE pgw.id_kedudukan_pegawai NOT IN (9,10,11)
AND unit IS NOT NULL
GROUP BY unit ORDER BY unit

SELECT COUNT(gol.max_gol) golongan
FROM tbl_pegawai pgw
LEFT JOIN (SELECT rkerja.nip, MAX(rkerja.golongan) max_gol
		     FROM tbl_riwayat_pekerjaan rkerja
		     GROUP BY rkerja.nip) gol ON pgw.nip = gol.nip
LEFT JOIN tbl_struktur_jabatan stjbt ON pgw.id_struktur_jabatan = stjbt.id_struktur_jabatan
LEFT JOIN tbl_struktur_organisasi storg ON stjbt.id_struktur_organisasi = storg.id_struktur_organisasi 
LEFT JOIN tbl_sub_unit subunit ON storg.id_sub_unit = subunit.id_sub_unit
LEFT JOIN tbl_unit unit ON subunit.id_unit = unit.id_unit 
WHERE pgw.id_kedudukan_pegawai NOT IN (9,10,11)
AND gol.max_gol = 'I/a'
AND pgw.jenis_kelamin = 'Pria'