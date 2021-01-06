/* 
FIT9132 - Assignment 2 - TASK 2 - Armin Berger
First created: 20/05/2020
Last edited: 10/06/2020 

OVERVIEW:

This SQL script uses queries to retrieve required information on traffic offences from a relational database. 

*/



/*
2(ii) Query 1
Show the demerit points and demerit description for all the demerits that either contains the word “heavy” or “Heavy” or 
start with the word “Exceed” in the description. The column headings in your output should be renamed as Demerit Points 
and Demerit Description. The output must be sorted in ascending format by demerit points and where two demerits have the 
same points sort them in ascending format of demerit description. Your output must have the form shown below.
*/

SELECT
    dem_points        AS "Demerit Points",
    dem_description   AS "Demerit Description"
FROM
    demerit
WHERE
    dem_description LIKE '%heavy%'
    OR dem_description LIKE '%Heavy%'
    OR dem_description LIKE 'Exceed%'
ORDER BY
    dem_points,
    dem_description;

/*
2(ii) Query 2
For all “Range Rover” and “Range Rover Sport” models, show the main colour, VIN and manufacture year 
for all the vehicles that were manufactured from 2012 to 2014. The column headings in your output should 
be renamed as Main Colour, VIN and Year Manufactured. The output must be sorted by manufacture year in 
descending format and where more than one vehicle was manufactured in the same year sort them by colour 
in ascending format. Your output must have the form shown below.
*/

SELECT
    veh_maincolor   AS "Main Colour",
    veh_vin         AS "VIN",
    to_char(veh_yrmanuf, 'YYYY') AS "Year Manufactured"
FROM
    vehicle
WHERE
    ( veh_modname = 'Range Rover'
      OR veh_modname = 'Range Rover Sport' )
    AND to_char(veh_yrmanuf, 'YYYY') BETWEEN '2012' AND '2014'
ORDER BY
    veh_yrmanuf DESC,
    veh_maincolor;

/*
2(iii) Query 3
For all “Range Rover” and “Range Rover Sport” models, show the main colour, VIN and manufacture year for
all the vehicles that were manufactured from 2012 to 2014. The column headings in your output should be
renamed as Main Colour, VIN and Year Manufactured. The output must be sorted by manufacture year in descending
format and where more than one vehicle was manufactured in the same year sort them by colour in ascending format.
Your output must have the form shown below.
*/

SELECT
    s.lic_no AS "Licence No.",
    d.lic_fname
    || ' '
    || d.lic_lname AS "Driver Fullname",
    to_char(d.lic_dob, 'DD-Mon-YYYY') AS "DOB",
    d.lic_street
    || ' '
    || d.lic_town
    || ' '
    || d.lic_postcode AS "Driver Address",
    to_char(s.sus_date, 'DD/MON/YY') AS "Suspended On",
    to_char(s.sus_enddate, 'DD/MON/YY') AS "Suspended Till"
FROM
    driver       d
    JOIN suspension   s ON d.lic_no = s.lic_no
WHERE
    to_date(s.sus_date, 'DD-MON-YYYY') BETWEEN to_date(add_months(current_date, - 30), 'DD-MON-YYYY') AND to_date(current_date, 'DD-MON-YYYY'
    )
ORDER BY
    s.lic_no,
    s.sus_date DESC;

COMMIT;

/*
2(iv) Query 4
TDS would like to find out if there is any correlation between different months of a year and demerit codes so
you have been assigned to generate a report that shows for ALL the demerits, the code, description, total number 
of offences committed for the demerit code so far in any month (of any year) and then the total of offences committed
for the demerit code in each month (of any year). The column headings in your output should be renamed as
Demerit Code, Demerit Description, Total Offences (All Months), and then the first three letters of each month
(with the first letter in uppercase). The output must be sorted by Total Offences (All Months) column in descending
format and where there is more than one demerit code with the same total, sort them by demerit code in ascending format.
Your output must have the form shown below. Your output can clearly be different from the following output.
*/

SELECT
    dem_code          AS "Demerit Code",
    dem_description   AS "Demerit Description",
    COUNT(dem_code) AS "Total Offences(All Months)",
    COUNT(jan) AS "Jan",
    COUNT(feb) AS "Feb",
    COUNT(mar) AS "Mar",
    COUNT(apr) AS "Apr",
    COUNT(may) AS "May",
    COUNT(jun) AS "Jun",
    COUNT(jul) AS "Jul",
    COUNT(aug) AS "Aug",
    COUNT(sep) AS "Sep",
    COUNT(oct) AS "Oct",
    COUNT(nov) AS "Nov",
    COUNT(dec) AS "Dec"
FROM
    (
        SELECT
            dem_code,
            CASE to_char(off_datetime, 'MON')
                WHEN 'JAN' THEN
                    + 1
            END AS jan,
            CASE to_char(off_datetime, 'MON')
                WHEN 'FEB' THEN
                    + 1
            END AS feb,
            CASE to_char(off_datetime, 'MON')
                WHEN 'MAR' THEN
                    + 1
            END AS mar,
            CASE to_char(off_datetime, 'MON')
                WHEN 'APR' THEN
                    + 1
            END AS apr,
            CASE to_char(off_datetime, 'MON')
                WHEN 'MAY' THEN
                    + 1
            END AS may,
            CASE to_char(off_datetime, 'MON')
                WHEN 'JUN' THEN
                    + 1
            END AS jun,
            CASE to_char(off_datetime, 'MON')
                WHEN 'JUL' THEN
                    + 1
            END AS jul,
            CASE to_char(off_datetime, 'MON')
                WHEN 'AUG' THEN
                    + 1
            END AS aug,
            CASE to_char(off_datetime, 'MON')
                WHEN 'SEP' THEN
                    + 1
            END AS sep,
            CASE to_char(off_datetime, 'MON')
                WHEN 'OCT' THEN
                    + 1
            END AS oct,
            CASE to_char(off_datetime, 'MON')
                WHEN 'NOV' THEN
                    + 1
            END AS nov,
            CASE to_char(off_datetime, 'MON')
                WHEN 'DEC' THEN
                    + 1
            END AS dec
        FROM
            offence
    )
    NATURAL JOIN demerit
GROUP BY
    dem_code,
    dem_description
ORDER BY
    "Total Offences(All Months)" DESC,
    "Demerit Code";



/*
2(v) Query 5
Find out which manufacturer's vehicles are involved in the highest number of offences which incur 2 or more demerit points.
Show the manufacturer name and the total number of offences that the manufacturer’s vehicles are involved in.
The column headings in your output should be renamed as Manufacturer Name and Total No. of Offences. The output must
be sorted by Total No. of Offences column in descending format and where there is more than one manufacturer 
with the same total, sort them by manufacturer name in ascending format. Your output can clearly be different from the
following output.
*/

SELECT
    veh_manufname AS "Manufacturer Name",
    COUNT(off_no) AS "Total No. of Offences"
FROM
    demerit
    NATURAL JOIN ( offence   o
    JOIN vehicle   v ON o.veh_vin = v.veh_vin )
WHERE
    dem_points >= 2
GROUP BY
    veh_manufname
HAVING
    COUNT(off_no) = (
        SELECT
            MAX(COUNT(dem_code))
        FROM
            demerit
            NATURAL JOIN ( offence   o
            JOIN vehicle   v ON o.veh_vin = v.veh_vin )
        WHERE
            dem_points >= 2
        GROUP BY
            veh_manufname
    )
ORDER BY
    COUNT(o.off_no) DESC,
    v.veh_manufname;

COMMIT;

/*
2(vi) Query 6
Find out the drivers who have been booked more than once for the same offence by an officer with the last name
as that of their last name. Show the driver licence number, driver full name (firstname and lastname together),
officer number, officer full name (firstname and lastname together). The column headings in your output should
be renamed as Licence No., Driver Name, Officer ID, Officer Name. The output must be sorted by
driver licence number column in ascending format.

*/

SELECT
    lic_no         AS "Licence No.",
    lic_fname || ' '
                 || lic_lname AS "Driver Name",
    o.officer_id   AS "Officer ID",
    o.officer_fname
    || ' '
       || o.officer_lname AS "Officer Name"
FROM
    driver
    NATURAL JOIN ( offence   offen
    JOIN officer   o ON offen.officer_id = o.officer_id )
GROUP BY
    lic_no,
    lic_fname,
    lic_lname,
    o.officer_id,
    o.officer_fname,
    o.officer_lname
HAVING lic_lname = officer_lname
       AND COUNT(unique(offen.off_no)) <= 2
ORDER BY
    lic_no;

/*
2(vii) Query 7
For each demerit code for which an offence has been recorded, find out the driver/s who has/have been booked the most
number of times. Show the demerit code, demerit description, driver licence number, driver full name
(firstname and lastname together) and the total number of times the driver has been booked in the output.
The column headings in your output should be renamed as Demerit Code, Demerit Description, Licence No., Driver Fullname
and Total Times Booked. The output must be sorted by demerit code in ascending format and where for one demerit
there is more than one driver booked the most number of times sort them by licence number in ascending format. 
Your output must have the form shown below. Your output can clearly be different from the following output.
*/

SELECT
    dem_code          AS "Demerit Code",
    dem_description   AS "Demerit Description",
    lic_no            AS "Licence No.",
    lic_fname 
    || ' '
    || lic_lname AS "Driver Name",
    COUNT(dem_code) AS "Total Times Booked"
FROM
    driver
    NATURAL JOIN ( offence
    NATURAL JOIN demerit )
GROUP BY
    dem_code,
    dem_description,
    lic_no,
    lic_fname,
    lic_lname
ORDER BY
    dem_code,
    lic_no;


/*
2(viii) Query 8
For each region, show the number of vehicles manufactured in the region and the percentage of vehicles manufactured
in the region. The last row of the output shows the totals - the second column which shows the total number of
vehicles manufactured in all regions (which is the total of all the individual totals in this column) and the 
third column of which shows the total percentage of vehicles manufactured in all the regions (which is the total of
all the individual percentages in this column). The first character of the VIN represents the region where the vehicle
was manufactured.
*/


SELECT
    region,
    COUNT(veh_vin) AS "Total Vehicles Manufactured",
    lpad(to_char(COUNT(veh_vin) /(
        SELECT
            COUNT(veh_vin)
        FROM
            vehicle
    ) * 100, 9999.99)
         || '%', 30, ' ') AS "Percentage of Vehicles Manufactured"
FROM
    (
        SELECT
            veh_vin,
            CASE
                WHEN veh_vin BETWEEN 'A' AND 'D' THEN
                    'Africa'
                WHEN veh_vin BETWEEN 'J' AND 'S' THEN
                    'Asia'
                WHEN veh_vin > 'S' THEN
                    'Europe'
                WHEN veh_vin BETWEEN '1' AND '6' THEN
                    'North America'
                WHEN veh_vin BETWEEN '6' AND '8' THEN
                    'Oceania'
                WHEN veh_vin > '8' THEN
                    'South America'
                ELSE
                    'Unknown'
            END AS region
        FROM
            vehicle
    )
GROUP BY
    region
UNION ALL
SELECT
    nvl(null, 'Total'),
    sum(veh_coun),
    lpad(to_char(sum(veh_per) * 100, 9999.99)
         || ''
         || '%', 30, ' ')
FROM
    (
        SELECT
            region,
            COUNT(*) AS veh_coun,
            round(COUNT(*) /(
                SELECT
                    COUNT(*)
                FROM
                    vehicle
            ), 4) AS veh_per
            from(select
            CASE
                WHEN veh_vin BETWEEN 'A' AND 'D' THEN
                    'Africa'
                WHEN veh_vin BETWEEN 'J' AND 'S' THEN
                    'Asia'
                WHEN veh_vin > 'S' THEN
                    'Europe'
                WHEN veh_vin BETWEEN '1' AND '6' THEN
                    'North America'
                WHEN veh_vin BETWEEN '6' AND '8' THEN
                    'Oceania'
                WHEN veh_vin > '8' THEN
                    'South America'
                ELSE
                    'Unknown'
            END AS region
        FROM
            vehicle
    )
    group by
    region
    )
;

