/* 
FIT9132 - Assignment 2 - TASK 3 - Armin Berger
First created: 20/05/2020
Last edited: 10/06/2020 

OVERVIEW:

This SQL script changes the structure of relational database tables (add conditional attributes, etc.).

*/



/*
3(i) Changes to live database 1
TDS would like to be able to easily determine the total number of times each police officer has booked
a driver for a traffic offence. Add a new attribute which will record the number of times each officer has booked drivers.
This attribute must be initialised to the correct current number of times each officer has booked drivers based on
the data which is currently stored in the system.
*/

ALTER TABLE officer
ADD officer_off_count NUMBER(6) ;

UPDATE officer meme
SET
    officer_off_count = (
        SELECT
            cooouuunnnt
        FROM
            (
                SELECT
                    offe.officer_id AS ofid,
                    nvl(off_count, 0) AS cooouuunnnt
                FROM
                    officer offe
                    LEFT OUTER JOIN (
                        SELECT
                            o.officer_id AS off_id,
                            COUNT(officer_id) AS off_count
                        FROM
                            offence o
                        GROUP BY
                            o.officer_id
                    ) ON off_id = offe.officer_id
            )
        WHERE
            ofid = meme.officer_id
    );
    
COMMIT;

/*
3(ii) Changes to live database 2
The problem TDS might face with the current database is if an offence is revoked for some valid reason, 
it is impossible for them to keep the offence information for the revoked offence in the database. 
TDS would like to fix this problem such that they are able to keep information about a revoked offence 
along with the other required information such as when it was revoked, who revoked the offence and the reason 
for revocation. For quick access, it has been decided that a column is also required to indicate Yes or No if an
offence has been revoked or not. T here will always be only one reason that can be associated with a revocation. 
TDS will not be able to add all the reasons for a revocation of the offences initially and so your solution should
allow them to add new reasons as and when there is a need. At this stage, the only reasons for revocation
of an offence TDS is interested in recording are First offence exceeding the speed limit by less than 10km/h (FOS),
Faulty equipment used (FEU), Driver objection upheld (DOU), Court hearing (COH), and Error in proceedings (EIP).
Each reason code will have exactly 3 letters.
When providing the solution, you must consider the following:

a. only around 1% of offences recorded are revoked and there can be hundreds of thousands of offences in the offence table,
b. all existing offences, after implementing this requirement, must automatically be recorded as not revoked,
c. no need to record unsuccessful appeals in the database.

*/

--record revoked offence codes
DROP TABLE revok_off_reason cascade constraints PURGE;

create table revok_off_reason (
    revok_reason VARCHAR2(3 BYTE) not null,
    revok_reason_descrip VARCHAR2(80 BYTE) not null,
    constraint revok_reason_code primary key (revok_reason));
Commit;
    
--insert the given codes
insert INTO revok_off_reason VALUES('FEU','Faulty equipment used');
insert INTO revok_off_reason VALUES('FOS','First offence exceeding the speed limit by less than 10km/h');
insert INTO revok_off_reason VALUES('DOU','Driver objection upheld');
insert INTO revok_off_reason VALUES('COH','Court hearing');
insert INTO revok_off_reason VALUES('EIP','Error in proceedings');
Commit;

--record revoked offences
DROP TABLE revok_off cascade constraints PURGE;

create table revok_off (
    off_no NUMBER(8,0) not null,
    revok_date DATE not null,
    officer_id NUMBER(8,0) not null,
    revok_reason VARCHAR2(3 BYTE) not null,
    constraint revok_no primary key (off_no,revok_date),
    constraint revok_off_no foreign key (off_no) references offence(off_no),
    constraint revok_officer_id foreign key (officer_id) references officer(officer_id)
    
);  
    
ALTER TABLE offence
ADD off_revok VARCHAR2(3 BYTE) ;

UPDATE offence
SET off_revok = 'No';

commit;

/*
3(iii) Changes to live database
TDS has found that having just the vehicle's main colour in the database, in some cases, is inadequate in helping identify
a vehicle that has been involved in a traffic offence. As a consequence, they have decided to now also record
if any outer part other than the body of the vehicle is of a different colour. At this stage, the only other
parts TDS is interested in recording the colour of are the Spoiler (SP), Bumper (BM) and Grilles (GR) but this may change
if the need arises and so it should be able to be changed easily. Each outer part code will have exactly 2 letters. 
Where the colour of grilles, spoiler (if any) or Bumper is the same as that of the body colour, there is no need
to record anything in the database. TDS is also intending to find a solution such that new colours can be easily introduced
when a manufacturer releases a new colour. Each colour must be identified by a unique colour number (which is auto-generated by the system) and
has its colour description recorded.

This data must be collected from the current state of the vehicle table via SQL only (you cannot assume the presence of
any particular colour). Subsequent colours will be added directly to this collection via INSERT statements.

*/

--###COLOR###   
--create color sequence    
DROP sequence veh_col_no;

CREATE SEQUENCE veh_col_no
START WITH 1
INCREMENT BY 1;
-- record all possible colors   
DROP TABLE vehicle_colors cascade constraints PURGE;

create table vehicle_colors (
    veh_col_no NUMBER(8,0) not null,
    veh_col_description CHAR(20 BYTE) not null unique,
    constraint vehicle_colors_code primary key (veh_col_no)
    );
    
--insert all current colors
INSERT INTO vehicle_colors ( select veh_col_no.nextval, bb from (select distinct VEH_MAINCOLOR as bb from vehicle));
commit;

INSERT INTO vehicle_colors values (veh_col_no.nextval,'Magenta');
commit;


--###PARTS###
-- record outer parts of car    
DROP TABLE vehicle_parts cascade constraints PURGE;

create table vehicle_parts (
    veh_part CHAR(2 BYTE) not null,
    veh_part_desc CHAR(40 BYTE) not null,
    constraint vehicle_parts_code primary key (veh_part)
    );
commit;

--insert the outer parts of cars mentioned so far
INSERT INTO vehicle_parts VALUES('SP','Spoiler');
INSERT INTO vehicle_parts VALUES('GR','Grilles');
INSERT INTO vehicle_parts VALUES('BM','Bumper');
commit;

--###VEHICLE MODS SUMMARY###
--record outerpart car color
DROP TABLE vehicle_mods cascade constraints PURGE;

create table vehicle_mods (
    veh_vin CHAR(17 BYTE) not null,
    veh_part CHAR(2 BYTE) not null,
    veh_partcolor CHAR(20 BYTE) not null,
    constraint vehicle_mods_code primary key (veh_vin, veh_part),
    constraint veh_partcolor_code foreign key (veh_partcolor) references vehicle_colors(veh_col_description),
    constraint veh_vin_code foreign key (veh_vin) references vehicle(veh_vin)
    );
    


--insert color of outer parts that were provided
insert INTO vehicle_mods VALUES('ZHWEF4ZF2LLA13803',(select veh_part from vehicle_parts where veh_part_desc LIKE '%Spoiler%'),'Black');
insert INTO vehicle_mods VALUES('ZHWEF4ZF2LLA13803',(select veh_part from vehicle_parts where veh_part_desc LIKE '%Grilles%'),'Magenta');
insert INTO vehicle_mods VALUES('ZHWES4ZF8KLA12259',(select veh_part from vehicle_parts where veh_part_desc LIKE '%Spoiler%'),'Yellow');
insert INTO vehicle_mods VALUES('ZHWES4ZF8KLA12259',(select veh_part from vehicle_parts where veh_part_desc LIKE '%Bumper%'),'Blue');

commit;


