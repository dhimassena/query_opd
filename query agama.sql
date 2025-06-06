SELECT CONCAT_WS(' ', pgw.gelar_depan, pgw.nama, pgw.gelar_belakang) nama, CONCAT_WS('',pgw.nip,',') nip, pgw.agama, CONCAT_WS(' pada ', jbt.jabatan, storg.struktur_organisasi) jabatan, unit.unit, subunit.sub_unit 
FROM tbl_pegawai pgw 
LEFT JOIN tbl_struktur_jabatan stjbt ON pgw.id_struktur_jabatan = stjbt.id_struktur_jabatan 
LEFT JOIN tbl_jabatan jbt ON stjbt.id_jabatan = jbt.id_jabatan 
LEFT JOIN tbl_struktur_organisasi storg ON stjbt.id_struktur_organisasi = storg.id_struktur_organisasi 
LEFT JOIN tbl_tingkatan tkt ON storg.id_tingkatan = tkt.id_tingkatan
LEFT JOIN tbl_sub_unit subunit ON storg.id_sub_unit = subunit.id_sub_unit 
LEFT JOIN tbl_unit unit ON subunit.id_unit = unit.id_unit
AND pgw.id_kedudukan_pegawai != 9 AND pgw.id_kedudukan_pegawai != 10 AND pgw.id_kedudukan_pegawai != 11
ORDER BY jbt.id_jabatan ASC