--Using the code below to retrieve the crime scene report
SELECT *
from crime_scene_report
WHERE date = 20180115
and city = 'SQL City'
and type = 'murder';
--Using the code below to find the name of the witness who lives at the last house on 'Northwestern Dr'
SELECT id, name, license_id, max(address_number) as address_number, address_street_name, ssn
from person
WHERE address_street_name = 'Northwestern Dr';
--Using the code below to get name of the second witness
SELECT *
from person
WHERE address_street_name = 'Franklin Ave'
and name like '%Annabel%';

--Using the code below to find the transcipt from the two witnesses' interview
--First witness
SELECT *
from interview i
join person p on person_id = id
where name = 'Morty Schapiro';
--Second witness
SELECT *
from interview i
join person p on person_id = id
where name = 'Annabel Miller';
--Using the code below to check the columns in the get_fit_now_member table
SELECT *
from get_fit_now_member;
--trying to query transcript from first witness
SELECT *
from get_fit_now_member
where membership_status = 'gold'
and id like '48Z%';
--Query the number plate clause and transcript from second 
--First take a look at the getget_fit_now_check_in table
SELECT *
from get_fit_now_check_in;
--Second witness said he was at the gym on january 9th
SELECT *
from get_fit_now_check_in
where check_in_date = 20180109
and membership_id like '48Z%';
/*the transcript of the two witness led us to the same two suspects so the number plate clause
in te first witness testimony will identify the killer*/
--checking the drivers_license table and querying the testimony of the first witness
SELECT *
from drivers_license
WHERE plate_number like '%H42w%';
/*Using primary and foreign key, join drivers_license, person_table and getget_fit_now_member table then query with 
witness testimonies*/
SELECT p.name, dl.id, p.ssn, p.address_street_name
from person p
join drivers_license dl on p.license_id = dl.id
join get_fit_now_member gfn on p.id = gfn.person_id
where gfn.id like '48Z%'
and dl.plate_number like '%H42w%';
/*Jeremy bowers committed the crime with Person_id 67318 based on the recorded
transcript of the interview that was conducted.*/