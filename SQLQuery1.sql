USE Passagerarmanifest
/*1A*/
SELECT Person.F�rnamn, Person.Efternamn, Person.Avdelningsnamn, 
Person.Ursprungsplanet, Person.K�n, Ras.RasNamn, Rang.RangNamn

FROM Person

JOIN Ras ON Ras.RasID=Person.RasID
JOIN Rang ON Rang.RangID=Person.RangID
JOIN Status ON Status.StatusID=Person.StatusID;
 
/*1B*/
SELECT Person.F�rnamn, Person.Efternamn, Status.D�dsorsak, Status.Tidpunkt
FROM Person
JOIN Status ON Person.StatusID=Status.StatusID;

/*1C*/
SELECT Person.F�rnamn, Rang.RangNamn, Rang.M�nadsl�n
FROM Person 
JOIN Status ON Status.StatusID=Person.StatusID
JOIN Rang ON Rang.RangID=Person.RangID

WHERE Rang.M�nadsl�n>50000 AND Rang.RangNamn='Kapten'


/*1D*/
SELECT Person.F�rnamn, Person.Ursprungsplanet
FROM Person
JOIN Status ON Status.StatusID=Person.StatusID
WHERE Person.Ursprungsplanet='Tellus'


/*1E*/
SELECT Person.F�rnamn, Person.Efternamn, Status.Tidpunkt
FROM Person
JOIN Status on Status.StatusID=Person.StatusID
WHERE Status.Tidpunkt BETWEEN '2016-01-01' AND '2016-03-01'

/*1F*/
SELECT Person.F�rnamn, Person.Efternamn, Rang.RangNamn COUNT
FROM Person
JOIN Status ON Status.StatusID=Person.StatusID
JOIN Rang ON Rang.RangID=Person.RangID

WHERE Rang.RangNamn='Vakt' OR Rang.RangNamn='Forskare'

/*2*/
SELECT MAX(M�nadsl�n)
FROM Person
JOIN Status ON Status.StatusID=Person.StatusID
JOIN Rang ON Rang.RangID=Person.RangID

/*3*/
SELECT COUNT(*), Status.D�dsorsak
FROM Person
JOIN Status ON Status.StatusID=Person.StatusID
GROUP BY Status.D�dsorsak

/*4, d�da*/
SELECT AVG(Rang.M�nadsl�n)
FROM Person
JOIN Rang ON Rang.RangID=Person.RangID
JOIN Status ON Status.StatusID=Person.StatusID
WHERE Person.StatusID>0;

/*4,levande*/
SELECT AVG(Rang.M�nadsl�n)
FROM Person
JOIN Rang ON Rang.RangID=Person.RangID
WHERE Person.StatusID=0

/*SELECT CrewMember.FirstName, CrewMember.LastName, 
Planet.PlanetName, CrewMember.Gender, 
Species.SpeciesName, [Rank].RankName

FROM CrewMember
	JOIN Species
		ON Species.SpeciesID = CrewMember.SpeciesID
	JOIN CauseOfDeath
		ON CauseOfDeath.DeathID = CrewMember.CauseOfDeathID
	JOIN Planet
		ON Planet.PlanetID = CrewMember.PlanetID
	JOIN [Rank]
		ON [Rank].RankID = CrewMember.RankID */