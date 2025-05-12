SELECT unit, 
		SUM(CASE WHEN pgw.jenis_kelamin = 'Pria' THEN 1 ELSE 0 END) jml_pria,
		SUM(CASE WHEN pgw.jenis_kelamin = 'Wanita' THEN 1 ELSE 0 END) jml_wanita 
		FROM tbl_pegawai pgw
		LEFT JOIN tbl_struktur_jabatan stjbt ON pgw.id_struktur_jabatan = stjbt.id_struktur_jabatan
		LEFT JOIN tbl_struktur_organisasi storg ON stjbt.id_struktur_organisasi = storg.id_struktur_organisasi 
		LEFT JOIN tbl_sub_unit subunit ON storg.id_sub_unit = subunit.id_sub_unit
		LEFT JOIN tbl_unit unit ON subunit.id_unit = unit.id_unit 
		WHERE pgw.id_kedudukan_pegawai NOT IN (9,10,11)
		AND pgw.jenis_kelamin IS NOT NULL
		GROUP BY unit ORDER BY unit

SELECT COUNT(pgw.jenis_kelamin) jenkel
		FROM tbl_pegawai pgw
		LEFT JOIN tbl_struktur_jabatan stjbt ON pgw.id_struktur_jabatan = stjbt.id_struktur_jabatan
		LEFT JOIN tbl_struktur_organisasi storg ON stjbt.id_struktur_organisasi = storg.id_struktur_organisasi 
		LEFT JOIN tbl_sub_unit subunit ON storg.id_sub_unit = subunit.id_sub_unit
		LEFT JOIN tbl_unit unit ON subunit.id_unit = unit.id_unit 
		WHERE pgw.id_kedudukan_pegawai NOT IN (9,10,11)
		AND pgw.jenis_kelamin IN ('Pria')

SELECT COUNT(pgw.jenis_kelamin) jenkel
			FROM tbl_pegawai pgw
			LEFT JOIN tbl_struktur_jabatan stjbt ON pgw.id_struktur_jabatan = stjbt.id_struktur_jabatan
			LEFT JOIN tbl_struktur_organisasi storg ON stjbt.id_struktur_organisasi = storg.id_struktur_organisasi 
			LEFT JOIN tbl_sub_unit subunit ON storg.id_sub_unit = subunit.id_sub_unit
			LEFT JOIN tbl_unit unit ON subunit.id_unit = unit.id_unit 
			WHERE pgw.id_kedudukan_pegawai NOT IN (9,10,11)
			AND pgw.jenis_kelamin IN ('Wanita')