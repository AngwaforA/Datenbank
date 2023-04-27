--EISHOCKEY V2

-- Erstellung der Tabelle Landesverband
CREATE TABLE Landesverband
(
    LVID          SERIAL PRIMARY KEY,
    Name          VARCHAR(255) NOT NULL,
    Strasse       VARCHAR(255) NOT NULL,
    Ort           VARCHAR(255) NOT NULL,
    Plz           VARCHAR(255) NOT NULL,
    Telefonnummer VARCHAR(255) NOT NULL
);

-- Erstellung der Tabelle Verein
CREATE TABLE Verein
(
    VID             SERIAL PRIMARY KEY,
    Name            VARCHAR(255) NOT NULL,
    Heimatstadt     VARCHAR(255) NOT NULL,
    Gründungsjahr   INTEGER      NOT NULL,
    Geschäftsführer VARCHAR(255) NOT NULL,
    Adresse         VARCHAR(255) NOT NULL,
    Landesverband   INTEGER REFERENCES Landesverband (LVID)
);

-- Erstellung der Tabelle Spieler
CREATE TABLE Spieler
(
    SID                  SERIAL PRIMARY KEY,
    Vorname              VARCHAR(255) NOT NULL,
    Nachname             VARCHAR(255) NOT NULL,
    Vereinszugehörigkeit INTEGER REFERENCES Verein (VID),
    Nationalität         VARCHAR(255) NOT NULL,
    Trikotnummer         INTEGER      NOT NULL,
    Position             VARCHAR(255) NOT NULL,
    CHECK (Position IN ('Tor', 'Stürmer', 'Verteidiger'))
);

-- Erstellung der Tabelle Schiedsrichter
CREATE TABLE Schiedsrichter
(
    SRID         SERIAL PRIMARY KEY,
    Vorname      VARCHAR(255) NOT NULL,
    Nachname     VARCHAR(255) NOT NULL,
    Nationalität VARCHAR(255) NOT NULL,
    Erfahrung    INTEGER      NOT NULL
);

-- Erstellung der Tabelle Saison
CREATE TABLE Saison
(
    SID  SERIAL PRIMARY KEY,
    Jahr INTEGER NOT NULL
);

-- Erstellung der Tabelle Spielplan
CREATE TABLE Spielplan
(
    SID            INTEGER REFERENCES Saison (SID),
    SpielID        SERIAL PRIMARY KEY,
    Datum          DATE NOT NULL,
    Uhrzeit        TIME NOT NULL,
    Heimmannschaft INTEGER REFERENCES Verein (VID),
    Gastmannschaft INTEGER REFERENCES Verein (VID)
);

-- Erstellung der Tabelle Spieleraufstellung
CREATE TABLE Spieleraufstellung
(
    SpielID INTEGER REFERENCES Spielplan (SpielID),
    SID     INTEGER REFERENCES Spieler (SID),
    PRIMARY KEY (SpielID, SID)
);

-- Erstellung der Tabelle Ergebnis
CREATE TABLE Ergebnis
(
    SpielID     INTEGER REFERENCES Spielplan (SpielID),
    Endresultat VARCHAR(255) NOT NULL,
    CHECK (Endresultat IN ('Reguläre Spielzeit', 'Verlängerung', 'Penalty-Schießen')),
    ToreHeim    INTEGER      NOT NULL,
    ToreGast    INTEGER      NOT NULL,
    PRIMARY KEY (SpielID)
);

-- Erstellung der Tabelle Tore
CREATE TABLE Tore
(
    TID         SERIAL PRIMARY KEY,
    SpielID     INTEGER REFERENCES Spielplan (SpielID),
    Zeitstempel TIMESTAMP NOT NULL,
    Torschütze  INTEGER REFERENCES Spieler (SID),
    Assistent1  INTEGER REFERENCES Spieler (SID),
    Assistent2  INTEGER REFERENCES Spieler (SID)
);

-- Erstellung der Tabelle Strafe
CREATE TABLE Strafe
(
    STID           SERIAL PRIMARY KEY,
    SpielID        INTEGER REFERENCES Spielplan (SpielID),
    Zeitstempel    TIMESTAMP    NOT NULL,
    Dauer          INTEGER      NOT NULL,
    Spieler        INTEGER REFERENCES Spieler (SID),
    Schiedsrichter INTEGER REFERENCES Schiedsrichter (SRID),
    Grund          VARCHAR(255) NOT NULL
);