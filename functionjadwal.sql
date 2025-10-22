CREATE OR REPLACE FUNCTION isi_jadwal()
RETURNS TRIGGER AS $$
BEGIN

  IF NEW.id_tentor IS NULL THEN
    SELECT id_tentor INTO NEW.id_tentor
    FROM tentor
    ORDER BY RANDOM()
    LIMIT 1;
  END IF;
  
  IF NEW.kode_mapel IS NULL THEN
    SELECT kode_mapel INTO NEW.kode_mapel
    FROM mapel
    ORDER BY RANDOM()
    LIMIT 1;
  END IF;
  
  IF NEW.kode_kelas IS NULL THEN
    SELECT kode_kelas INTO NEW.kode_kelas
    FROM kelas
    ORDER BY RANDOM()
    LIMIT 1;
  END IF;

  RETURN NEW;
END;
$$ LANGUAGE plpgsql;
