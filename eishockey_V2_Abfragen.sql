-- 1) Aktuelle Tabelle:
SELECT Verein.Name,
       SUM(Ergebnis.ToreHeim - Ergebnis.ToreGast) AS Tordifferenz,
       SUM(CASE
               WHEN Ergebnis.Endresultat = 'Reguläre Spielzeit' THEN 3
               WHEN Ergebnis.Endresultat = 'Verlängerung' THEN 2
               ELSE 1 END)                        AS Punkte
FROM Verein
         INNER JOIN Ergebnis ON Ergebnis.toreheim = Verein.VID OR Ergebnis.toregast = Verein.VID
GROUP BY Verein.Name
ORDER BY Punkte DESC;

-- 2) Mannschaft mit meisten Gegentoren pro Spiel
WITH GegentoreProSpiel AS (
    SELECT Verein.Name, SUM(Ergebnis.ToreGast) / COUNT(Ergebnis.SpielID) AS GegentoreProSpiel
    FROM Verein
             INNER JOIN Ergebnis ON Ergebnis.toreheim = Verein.VID
    GROUP BY Verein.Name
)
SELECT Name, GegentoreProSpiel FROM GegentoreProSpiel
ORDER BY GegentoreProSpiel DESC
LIMIT 1;

-- 3) Spiel mit den meisten Strafen:
SELECT Spielplan.SpielID, COUNT(Strafe.Dauer) as AnzahlStrafen
FROM Spielplan
         LEFT JOIN Strafe ON Strafe.SpielID = Spielplan.SpielID
GROUP BY Spielplan.SpielID
ORDER BY AnzahlStrafen DESC
LIMIT 1;

-- 4) Spieler mit den meisten Strafen wegen "Unnötiger Härte":
SELECT Spieler.Vorname, Spieler.Nachname, COUNT(Strafe.STID) as AnzahlStrafen
FROM Spieler
         LEFT JOIN Strafe ON Strafe.Spieler = Spieler.SID
WHERE Strafe.Grund = 'Unnötige Härte'
GROUP BY Spieler.SID
ORDER BY AnzahlStrafen DESC
LIMIT 1;

-- 5) Anzahl der Tore pro Spieler:
SELECT Spieler.Vorname, Spieler.Nachname, COUNT(Tore.TID) as AnzahlTore
FROM Spieler
         LEFT JOIN Tore ON Tore.torschütze = Spieler.SID
GROUP BY Spieler.SID
ORDER BY AnzahlTore DESC;

-- 6) Anzahl der Strafen pro Schiedsrichter:
SELECT Schiedsrichter.Vorname, Schiedsrichter.Nachname, COUNT(Strafe.schiedsrichter) as AnzahlStrafen
FROM Schiedsrichter
         LEFT JOIN Strafe ON Strafe.schiedsrichter = Schiedsrichter.SRID
GROUP BY Schiedsrichter.SRID
ORDER BY AnzahlStrafen DESC;

-- 7) Anzahl der Spiele pro Schiedsrichter:
SELECT Schiedsrichter.Vorname, Schiedsrichter.Nachname, COUNT(Spieleraufstellung.SpielID) as AnzahlSpiele
FROM Schiedsrichter
         LEFT JOIN Spieleraufstellung ON Spieleraufstellung.SRID = Schiedsrichter.SRID
GROUP BY Schiedsrichter.SRID
ORDER BY AnzahlSpiele DESC;

-- 8) Anzahl der Strafen pro Saison:
SELECT Saison.Jahr, COUNT(Strafe.schiedsrichter) as AnzahlStrafen
FROM Saison
         LEFT JOIN Spielplan ON Spielplan.SID = Saison.SID
         LEFT JOIN Strafe ON Strafe.SpielID = Spielplan.SpielID
GROUP BY Saison.SID
ORDER BY AnzahlStrafen DESC;







