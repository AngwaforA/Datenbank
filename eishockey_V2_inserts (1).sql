-- Einfügen von Daten in die Tabelle Landesverband
INSERT INTO Landesverband (Name, Strasse, Ort, Plz, Telefonnummer) VALUES ('Hessen', 'Teststrasse 1', 'Frankfurt', '60316', '+496912345678');
INSERT INTO Landesverband (Name, Strasse, Ort, Plz, Telefonnummer) VALUES ('Bayern', 'Teststrasse 2', 'München', '80538', '+498155555555');
INSERT INTO Landesverband (Name, Strasse, Ort, Plz, Telefonnummer) VALUES ('Bayern', 'Münchner Str. 1', 'München', '80331', '08912345678');
INSERT INTO Landesverband (Name, Strasse, Ort, Plz, Telefonnummer) VALUES ('Baden-Württemberg', 'Stuttgarter Str. 2', 'Stuttgart', '70173', '071112345678');

-- Einfügen von Daten in die Tabelle Verein
INSERT INTO Verein (Name, Heimatstadt, Gründungsjahr, Geschäftsführer, Strasse, Ort, Plz, Landesverband) VALUES ('Eisbären Berlin', 'Berlin', 1965, 'Hans Schmidt', 'Teststrasse 3', 'Berlin', '10115', 1);
INSERT INTO Verein (Name, Heimatstadt, Gründungsjahr, Geschäftsführer, Strasse, Ort, Plz, Landesverband) VALUES ('Adler Mannheim', 'Mannheim', 1983, 'Jürgen Bauer', 'Teststrasse 4', 'Mannheim', '68169', 1);
INSERT INTO Verein (Name, Heimatstadt, Gründungsjahr, Geschäftsführer, Strasse, Ort, Plz, Landesverband) VALUES ('EHC Red Bull München', 'München', 1999, 'Markus Eichenberger', 'Münchner Str. 10', 'München', '80331', 1);
INSERT INTO Verein (Name, Heimatstadt, Gründungsjahr, Geschäftsführer, Strasse, Ort, Plz, Landesverband) VALUES ('Adler Ludwigshafen', 'Mannheim', 1980, 'Karsten Mende', 'Mannheimer Str. 20', 'Ludwigshafen', '67059', 2);

-- Einfügen von Daten in die Tabelle Spieler
INSERT INTO Spieler (Vorname, Nachname, Vereinszugehörigkeit, Nationalität, Trikotnummer, Position) VALUES ('Max', 'Mustermann', 1, 'Deutschland', 17, 'Stürmer');
INSERT INTO Spieler (Vorname, Nachname, Vereinszugehörigkeit, Nationalität, Trikotnummer, Position) VALUES ('Anna', 'Musterfrau', 2, 'Deutschland', 19, 'Verteidiger');
INSERT INTO Spieler (Vorname, Nachname, Vereinszugehörigkeit, Nationalität, Trikotnummer, Position) VALUES ('Thomas', 'Müller', 1, 'Deutschland', 21, 'Stürmer');
INSERT INTO Spieler (Vorname, Nachname, Vereinszugehörigkeit, Nationalität, Trikotnummer, Position) VALUES ('Manuel', 'Neuer', 2, 'Deutschland', 1, 'Tor');

-- Einfügen von Daten in die Tabelle Schiedsrichter
INSERT INTO Schiedsrichter (Vorname, Nachname, Nationalität, Erfahrung) VALUES ('Hans', 'Meier', 'Deutschland', 10);
INSERT INTO Schiedsrichter (Vorname, Nachname, Nationalität, Erfahrung) VALUES ('Gisela', 'Müller', 'Deutschland', 5);
INSERT INTO Schiedsrichter (Vorname, Nachname, Nationalität, Erfahrung) VALUES ('Hans', 'Meier', 'Deutschland', 10);
INSERT INTO Schiedsrichter (Vorname, Nachname, Nationalität, Erfahrung) VALUES ('Maria', 'Schmidt', 'Österreich', 5);

-- Einfügen von Daten in die Tabelle Saison
INSERT INTO Saison (Jahr) VALUES (2022);
INSERT INTO Saison (Jahr) VALUES (2021);
INSERT INTO Saison (Jahr) VALUES (2020);
INSERT INTO Saison (Jahr) VALUES (2023);

-- Einfügen von Daten in die Tabelle Spielplan
INSERT INTO Spielplan (SID, Datum, Uhrzeit, Heimmannschaft, Gastmannschaft) VALUES (1, '2022-01-01', '19:00:00', 1, 2);
INSERT INTO Spielplan (SID, Datum, Uhrzeit, Heimmannschaft, Gastmannschaft) VALUES (2, '2021-12-31', '20:30:00', 2, 1);
INSERT INTO Spielplan (SID, Datum, Uhrzeit, Heimmannschaft, Gastmannschaft) VALUES (1, '2022-02-01', '14:00:00', 1, 2);
INSERT INTO Spielplan (SID, Datum, Uhrzeit, Heimmannschaft, Gastmannschaft) VALUES (2, '2021-11-30', '10:30:00', 2, 1);

-- Einfügen von Daten in die Tabelle Spieleraufstellung
INSERT INTO Spieleraufstellung (SpielID, SID, SRID) VALUES (1, 1, 1);
INSERT INTO Spieleraufstellung (SpielID, SID, SRID) VALUES (2, 2, 2);
INSERT INTO Spieleraufstellung (SpielID, SID, SRID) VALUES (1, 2, 1);
INSERT INTO Spieleraufstellung (SpielID, SID, SRID) VALUES (2, 1, 2);

-- Einfügen von Daten in die Tabelle Ergebnis
INSERT INTO Ergebnis (SpielID, Endresultat, ToreHeim, ToreGast) VALUES (1, 'Reguläre Spielzeit', 5, 2);
INSERT INTO Ergebnis (SpielID, Endresultat, ToreHeim, ToreGast) VALUES (2, 'Penalty-Schießen', 2, 2);
INSERT INTO Ergebnis (SpielID, Endresultat, ToreHeim, ToreGast) VALUES (3, 'Reguläre Spielzeit', 5, 2);
INSERT INTO Ergebnis (SpielID, Endresultat, ToreHeim, ToreGast) VALUES (4, 'Verlängerung', 4, 4);

-- Einfügen von Daten in die Tabelle Tore
INSERT INTO Tore (SpielID, Torschütze, Assistent1, Assistent2, Zeitstempel) VALUES (1, 1, 1, 2, '2022-01-01 19:00:00');
INSERT INTO Tore (SpielID, Torschütze, Assistent1, Assistent2, Zeitstempel) VALUES (2, 2, 2, 1, '2021-12-31 20:30:00');
INSERT INTO Tore (SpielID, Torschütze, Assistent1, Assistent2, Zeitstempel) VALUES (1, 3, 2, 1, '2022-01-01 19:15:00');
INSERT INTO Tore (SpielID, Torschütze, Assistent1, Assistent2, Zeitstempel) VALUES (2, 1, NULL, NULL, '2021-12-31 20:45:00');

-- Einfügen von Daten in die Tabelle Strafe
INSERT INTO Strafe (SpielID, Zeitstempel, Dauer, Spieler, Schiedsrichter, Grund) VALUES (1, '2022-01-01 19:00:00', 2, 1, 1, 'Unnötige Härte');
INSERT INTO Strafe (SpielID, Zeitstempel, Dauer, Spieler, Schiedsrichter, Grund) VALUES (2, '2021-12-31 20:30:00', 5, 2, 2, 'Beleidigung');
INSERT INTO Strafe (SpielID, Zeitstempel, Dauer, Spieler, Schiedsrichter, Grund) VALUES (1, '2022-01-01 19:20:00', 2, 4, 1, 'Unsportliches Verhalten');
INSERT INTO Strafe (SpielID, Zeitstempel, Dauer, Spieler, Schiedsrichter, Grund) VALUES (2, '2021-12-31 21:00:00', 10, 3, 2, 'Schlägerei');