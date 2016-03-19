USE Passagerarmanifest
/*1A*/
SELECT Person.Förnamn, Person.Efternamn, Person.Avdelningsnamn, 
Person.Ursprungsplanet, Person.Kön, Ras.RasNamn, Rang.RangNamn

FROM Person

JOIN Ras ON Ras.RasID=Person.RasID
JOIN Rang ON Rang.RangID=Person.RangID
JOIN Status ON Status.StatusID=Person.StatusID;
 
/*1B*/
SELECT Person.Förnamn, Person.Efternamn, Status.Dödsorsak, Status.Tidpunkt
FROM Person
JOIN Status ON Person.StatusID=Status.StatusID;

/*1C*/
SELECT Person.Förnamn, Rang.RangNamn, Rang.Månadslön
FROM Person 
JOIN Status ON Status.StatusID=Person.StatusID
JOIN Rang ON Rang.RangID=Person.RangID

WHERE Rang.Månadslön>50000 AND Rang.RangNamn='Kapten'


/*1D*/
SELECT Person.Förnamn, Person.Ursprungsplanet
FROM Person
JOIN Status ON Status.StatusID=Person.StatusID
WHERE Person.Ursprungsplanet='Tellus'


/*1E*/
SELECT Person.Förnamn, Person.Efternamn, Status.Tidpunkt
FROM Person
JOIN Status on Status.StatusID=Person.StatusID
WHERE Status.Tidpunkt BETWEEN '2016-01-01' AND '2016-03-01'

/*1F*/
SELECT Person.Förnamn, Person.Efternamn, Rang.RangNamn COUNT
FROM Person
JOIN Status ON Status.StatusID=Person.StatusID
JOIN Rang ON Rang.RangID=Person.RangID

WHERE Rang.RangNamn='Vakt' OR Rang.RangNamn='Forskare'

/*2*/
SELECT MAX(Månadslön)
FROM Person
JOIN Status ON Status.StatusID=Person.StatusID
JOIN Rang ON Rang.RangID=Person.RangID

/*3*/
SELECT COUNT(*), Status.Dödsorsak
FROM Person
JOIN Status ON Status.StatusID=Person.StatusID
GROUP BY Status.Dödsorsak

/*4, döda*/
SELECT AVG(Rang.Månadslön)
FROM Person
JOIN Rang ON Rang.RangID=Person.RangID
JOIN Status ON Status.StatusID=Person.StatusID
WHERE Person.StatusID>0;

/*4,levande*/
SELECT AVG(Rang.Månadslön)
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