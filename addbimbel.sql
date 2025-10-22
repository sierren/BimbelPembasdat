CREATE TABLE kelas (
    kode_kelas  CHAR(4)      NOT NULL,
    nama_kelas  VARCHAR(3)  NOT NULL,
    PRIMARY KEY (kode_kelas)
);

CREATE TABLE mapel (
    kode_mapel  CHAR(5)      NOT NULL,
    nama_mapel  VARCHAR(40)  NOT NULL,
    PRIMARY KEY (kode_mapel) 
);

CREATE TABLE wali_siswa (
    nik         CHAR(16)     NOT NULL, 
    nama_w      VARCHAR(50)  NOT NULL, 
    alamat_w    VARCHAR(50)  NOT NULL, 
    tanggal_w   DATE         NOT NULL,
    PRIMARY KEY (nik)
);

CREATE TABLE tentor (
    id_tentor      CHAR(10)      NOT NULL, 
    nama_tentor    VARCHAR(50)  NOT NULL, 
    alamat_tentor  VARCHAR(50)  NOT NULL, 
    tanggal_t      DATE         NOT NULL,
    PRIMARY KEY (id_tentor)
);

CREATE TABLE siswa (
    id_siswa       CHAR(10)      NOT NULL, 
    nama_siswa     VARCHAR(50)  NOT NULL, 
    tanggal_lahir  DATE         NOT NULL,
    kelamin        CHAR(1)      NOT NULL CHECK (kelamin IN ('L', 'P')), 
    kode_kelas     CHAR(4)      NOT NULL,
    nik            CHAR(16)     NULL, 
    PRIMARY KEY (id_siswa),
    
    FOREIGN KEY (kode_kelas) REFERENCES kelas (kode_kelas) 
        ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY (nik) REFERENCES wali_siswa (nik) 
        ON UPDATE CASCADE ON DELETE RESTRICT 
);

CREATE TABLE jadwal (
	id_jadwal		CHAR(4)			NOT NULL,
	tanggal			DATE			NOT NULL,
	id_tentor		CHAR(6)			NOT NULL,
	kode_mapel		CHAR(5)			NOT NULL,
	kode_kelas		CHAR(4)			NOT NULL,
 	PRIMARY KEY	(id_jadwal),
 	
    FOREIGN KEY (kode_kelas) REFERENCES kelas (kode_kelas) 
        ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY (kode_mapel) REFERENCES mapel (kode_mapel) 
        ON UPDATE CASCADE ON DELETE RESTRICT,
	FOREIGN KEY (id_tentor) REFERENCES tentor (id_tentor) 
        ON UPDATE CASCADE ON DELETE RESTRICT
);