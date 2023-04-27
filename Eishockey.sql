CREATE TABLE verein (  --club
	vereinName varchar(10) PRIMARY KEY, 
	heimstadt varchar(20),
	gründungsjahr date, 
	geschäftsführer varchar(20),
	straße varchar(10),
	ort varchar(10),
	plz Integer,
	landesverband varchar(20),
);

CREATE Table spieler(
	vorname varchar(10),
	nachname varchar(10),
	vereinszugehörigkeit varchar(20) references verein(vereinName),
	nationalität varchar(20),
	trikotnummer Integer PRIMARY KEY;
	position Integer
);


CREATE Table mannschaft(
	mannschaftsName varchar(20) PRIMARY KEY
	verein varchar(20) references verein(vereinName),
	spieler integer references spieler(trikotnummer),
)

CREATE Table schiedrichter(
	schiedrichterID integer PRIMARY KEY,
	vorname varchar(10),
	nachname varchar(10)
);

CREATE Table spiel(
	spielID  integer PRIMARY KEY,
	zeitangabe time,
	datum date,
	heimmannschaft varchar(20) references mannschaft(mannschaftsName),
	gastmannschaft varchar(20) references mannschaft(mannschaftsName), 	--Difference btw references and using foreignkey constrains
	verein varchar(20) references verein(verein),
	schiedrichter integer references schiedrichter(schiedrichterID);
	endsituation text
);

CREATE Table tor(
	torNr integer PRIMARY KEY,
	zeitstempel timestamp,
	spieler integer references spieler(spielerID),
	assisten integer references spieler(spielerID)
);

CREATE Table zeitstrafen(
	spiel integer,
	schiedsrichter integer,
	PRIMARY KEY (spiel, schiedsrichter),
	zeitstempel timestamp,
	dauer time,
	spieler integer references spieler(spielerID),
	grund text
);

