CREATE OR REPLACE FUNCTION isi_siswa()
RETURNS TRIGGER AS $$
BEGIN

  IF NEW.nik IS NULL THEN
    SELECT nik INTO NEW.nik
    FROM wali_siswa
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

CREATE TRIGGER auto_isi
BEFORE INSERT ON siswa
FOR EACH ROW
EXECUTE FUNCTION isi_siswa();