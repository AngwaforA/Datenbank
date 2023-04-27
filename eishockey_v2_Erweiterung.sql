-- Erstellung der Tabelle Zuschauer
CREATE TABLE Zuschauer
(
    ZID           SERIAL PRIMARY KEY,
    Name          VARCHAR(255) NOT NULL,
    Strasse       VARCHAR(255) NOT NULL,
    Ort           VARCHAR(255) NOT NULL,
    Plz           VARCHAR(255) NOT NULL,
    Email         VARCHAR(255) NOT NULL,
    Telefonnummer VARCHAR(255) NOT NULL
);

-- Erstellung der Tabelle Sitzplatz
CREATE TABLE Sitzplatz
(
    SPID    INTEGER PRIMARY KEY,
    Bereich VARCHAR(255) NOT NULL,
    Reihe   INTEGER      NOT NULL,
    Sitzklasse INTEGER NOT NULL
        CHECK (Sitzklasse IN ('1', '2'))
);

-- Erstellung der Tabelle Ticket
CREATE TABLE Ticket
(
    TID     SERIAL PRIMARY KEY,
    SPID    SERIAL REFERENCES Sitzplatz (SPID),
    Preis   MONEY        NOT NULL,
    Datum   DATE         NOT NULL,
    Uhr     TIME         NOT NULL,
    Sitzart INTEGER NOT NULL REFERENCES Sitzplatz (SPID)
);

-- Erstellung der Tabelle Reservierung
CREATE TABLE Reservierung
(
    RID SERIAL PRIMARY KEY,
    ZID SERIAL REFERENCES Zuschauer (ZID) ON DELETE CASCADE,
    TID SERIAL REFERENCES Ticket (TID) ON DELETE CASCADE
);




