/* 
Traffic_Offence_Database_Data Manipulation
Author: Armin Berger
First created: 20/05/2020
Last edited: 10/06/2020 

OVERVIEW:

This SQL script inserts traffic offences into a relational traffic offence database and updates existing offences across multiple tables.

*/


SET SERVEROUTPUT ON;
--insert offences

INSERT INTO offence
VALUES
(1, TO_DATE('1-Jan-2016 07:30 AM', 'DD-MON-YYYY hh:mi AM') , '24 Nelson Road Calyton Victoria 3168', 99, 10000001, '100001', 'WBSBL93414JJ01961');
commit;

INSERT INTO offence
VALUES
(2, TO_DATE('2-Feb-2016 08:30 AM', 'DD-MON-YYYY hh:mi AM') , '28 North Road Calyton Victoria 3160', 108, 10000002, '100002', 'ZHWEF4ZF2LLA13803');
commit;

INSERT INTO offence
VALUES
(3, TO_DATE('3-Mar-2016 09:30 AM', 'DD-MON-YYYY hh:mi AM') , '74 South Road CBD Victoria 3051', 112, 10000003, '100003', 'WAUZZZF1XKD037356');
commit;

INSERT INTO offence
VALUES
(4, TO_DATE('4-Apr-2016 10:30 AM', 'DD-MON-YYYY hh:mi AM') , '1 Green Drive St Kilda Victoria 3048', 119, 10000004, '100004', 'ZHWES4ZF8KLA12259');
commit;

INSERT INTO offence
VALUES
(5, TO_DATE('5-May-2016 11:30 PM', 'DD-MON-YYYY hh:mi AM') , '34 Australia Boulevard Glen Waverly Victoria 3153', 100, 10000005, '100005', '5TDBK3FH50S049497');
commit;

INSERT INTO offence
VALUES
(6, TO_DATE('1-Feb-2017 12:30 AM', 'DD-MON-YYYY hh:mi AM') , '9 Monash Drive Clayton Victoria 3168', 131, 10000006, '100001', 'JM0ER10L200236251');
commit;

INSERT INTO offence
VALUES
(7, TO_DATE('2-Feb-2017 07:30 AM', 'DD-MON-YYYY hh:mi AM') , '2 West Drive Clayton Victoria 3168', 100, 10000007, '100001', 'WBSBL93414JJ01961');
commit;

INSERT INTO offence
VALUES
(8, TO_DATE('8-Apr-2017 07:30 AM', 'DD-MON-YYYY hh:mi AM') , '82  South Road CBD Victoria 3051', 100, 10000008, '100002', 'MPATFS85JDT005836');
commit;

INSERT INTO offence
VALUES
(9, TO_DATE('19-Apr-2017 07:30 AM', 'DD-MON-YYYY hh:mi AM') , '9 Nelson Road Calyton Victoria 3168', 100, 10000011, '100009', 'JM3TB2BV0F0452266');
commit;

INSERT INTO offence
VALUES
(10, TO_DATE('19-Oct-2017 07:30 AM', 'DD-MON-YYYY hh:mi AM') , '95 North Road CBD Victoria 3051', 131, 10000009, '100006', 'JT4RN55D1J7027072');
commit;

INSERT INTO offence
VALUES
(11, TO_DATE('1-Dec-2017 07:30 AM', 'DD-MON-YYYY hh:mi AM') , '7 South Road Glen Waverly Victoria 3168', 123, 10000010, '100007', 'YV449MRS0G2864142');
commit;

INSERT INTO offence
VALUES
(12, TO_DATE('11-Jan-2018 07:30 PM', 'DD-MON-YYYY hh:mi AM') , '2 Gold Drive Road CBD Victoria 3062', 130, 10000011, '100008', 'JTHCF1D29F104CU58');
commit;

INSERT INTO offence
VALUES
(13, TO_DATE('16-Feb-2018 11:20 AM', 'DD-MON-YYYY hh:mi AM') , '8 North Road Clayton Victoria 3861', 99, 10000012, '100009', 'SALSK25U57A118844');
commit;

INSERT INTO offence
VALUES
(14, TO_DATE('16-Apr-2018 09:17 PM', 'DD-MON-YYYY hh:mi AM') , '99 South Road Glen Waverly Victoria 3168', 100, 10000013, '100001', 'WAUZZZF15KD038432');

INSERT INTO suspension
VALUES
('100001', TO_DATE('16-Apr-2018', 'DD-MON-YYYY') , TO_DATE('16-Oct-2018', 'DD-MON-YYYY'));
commit;

INSERT INTO offence
VALUES
(15, TO_DATE('1-May-2018 07:30 AM', 'DD-MON-YYYY hh:mi AM') , '9 Nelson Road Calyton Victoria 3168', 99, 10000011, '100009', 'JM3TB2BV0F0452266');

INSERT INTO suspension
VALUES
('100009', TO_DATE('1-May-2018', 'DD-MON-YYYY') , TO_DATE('1-Nov-2018', 'DD-MON-YYYY'));
commit;

INSERT INTO offence
VALUES
(16, TO_DATE('6-May-2018 01:39 AM', 'DD-MON-YYYY hh:mi AM') , '42 Richmond Drive Clayton Victoria 3168', 118, 10000014, '100010', 'JA3AJ46EX2U027924');
commit;

INSERT INTO offence
VALUES
(17, TO_DATE('9-May-2018 03:37 AM', 'DD-MON-YYYY hh:mi AM') , '11 North Road Clayton Victoria 3051', 119, 10000015, '100011', '5UXZV4C52BL739734');
commit;

INSERT INTO offence
VALUES
(18, TO_DATE('9-Jan-2019 04:37 AM', 'DD-MON-YYYY hh:mi AM') , '26 South Road Glen Waverly Victoria 3168', 126, 10000011, '100006', 'YV449MRS0G2864142');
commit;

INSERT INTO offence
VALUES
(19, TO_DATE('12-Jan-2019 07:08 PM', 'DD-MON-YYYY hh:mi AM') , '83 Nelson Road Calyton Victoria 3168', 112, 10000016, '100012', '5YJSA3H10EFP46509');
commit;

INSERT INTO offence
VALUES
(20, TO_DATE('11-Feb-2019 05:20 AM', 'DD-MON-YYYY hh:mi AM') , '28 North Road Calyton Victoria 3160', 99, 10000017, '100013', '1HFSC2277PA500074');
commit;

INSERT INTO offence
VALUES
(21, TO_DATE('14-Feb-2019 09:15 AM', 'DD-MON-YYYY hh:mi AM') , '39 South Road Glen Waverly Victoria 3168', 99, 10000017, '100002', 'MPATFS85JDT005836');
commit;

INSERT INTO offence
VALUES
(22, TO_DATE('19-Feb-2019 07:20 PM', 'DD-MON-YYYY hh:mi AM') , '39 South Road Glen Waverly Victoria 3168', 101, 10000017, '100002', 'MPATFS85JDT005836');

INSERT INTO suspension
VALUES
('100002', TO_DATE('19-Feb-2019', 'DD-MON-YYYY') , TO_DATE('19-Aug-2019', 'DD-MON-YYYY'));
commit;

INSERT INTO offence
VALUES
(23, TO_DATE('8-Mar-2019 07:30 PM', 'DD-MON-YYYY hh:mi AM') , '58 South Road CBD Victoria 3051', 103, 10000018, '100003', 'JM3TB3CV9E0428583');
commit;

INSERT INTO offence
VALUES
(24, TO_DATE('2-Apr-2019 01:40 AM', 'DD-MON-YYYY hh:mi AM') , '11 South Road Glen Waverly Victoria 3168', 103, 10000007, '100005', 'ZHWEF4ZF2LLA13803');
commit;

INSERT INTO offence
VALUES
(25, TO_DATE('10-Apr-2019 08:10 AM', 'DD-MON-YYYY hh:mi AM') , '58 South Road CBD Victoria 3051', 99, 10000018, '100003', 'JM3TB3CV9E0428583');
commit;

INSERT INTO offence
VALUES
(26, TO_DATE('17-Apr-2019 08:30 PM', 'DD-MON-YYYY hh:mi AM') , '2 Gold Drive Road CBD Victoria 3062', 126, 10000019, '100013', '1HGCM66884A055153');
commit;

INSERT INTO offence
VALUES
(27, TO_DATE('3-May-2019 11:56 AM', 'DD-MON-YYYY hh:mi AM') , '79 Gold Drive Road CBD Victoria 3062', 99, 10000013, '100005', 'ZHWEF4ZF2LLA13803');

INSERT INTO suspension
VALUES
('100005', TO_DATE('3-May-2019', 'DD-MON-YYYY') , TO_DATE('3-Nov-2019', 'DD-MON-YYYY'));
commit;

INSERT INTO offence
VALUES
(28, TO_DATE('15-May-2019 08:30 AM', 'DD-MON-YYYY hh:mi AM') , '21 Nelson Road Calyton Victoria 3168', 126, 10000011, '100094', 'WBSBL93414JJ01961');
commit;

INSERT INTO offence
VALUES
(29, TO_DATE('19-May-2019 09:10 PM', 'DD-MON-YYYY hh:mi AM') , '56 Gold Drive Road CBD Victoria 3062', 126, 10000011, '100094', 'WBSBL93414JJ01961');
commit;

/*

Created a sequence which will allow entry of data into the OFFENCE table - the sequence begins at 100 and goes up in steps of 1.

*/


DROP SEQUENCE off_no;

CREATE SEQUENCE off_no START WITH 100 INCREMENT BY 1;

COMMIT;


INSERT INTO offence VALUES (
    off_no.NEXTVAL,
    TO_DATE('10-Aug-2019 08:04 AM', 'DD-MON-YYYY hh:mi AM'),
    '24 Nelson Road Calyton Victoria 3168',
    (
        SELECT
            dem_code
        FROM
            demerit
        WHERE
            lower(dem_description) = lower('Blood alcohol charge')
    ),
    10000011,
    '100389',
    'JYA3HHE05RA070562'
);

COMMIT;

INSERT INTO offence VALUES (
    off_no.NEXTVAL,
    TO_DATE('16-Oct-2019 09:00 PM', 'DD-MON-YYYY hh:mi AM'),
    '27 South Road Calyton Victoria 3132',
    (
        SELECT
            dem_code
        FROM
            demerit
        WHERE
            lower(dem_description) = lower('Level crossing offence')
    ),
    10000015,
    '100389',
    'JYA3HHE05RA070562'
);

COMMIT;

INSERT INTO offence VALUES (
    off_no.NEXTVAL,
    TO_DATE('07-Jan-2020 07:07 AM', 'DD-MON-YYYY hh:mi AM'),
    '1 River Drive CBD Victoria 3039',
    (
        SELECT
            dem_code
        FROM
            demerit
        WHERE
            lower(dem_description) = lower('Exceeding the speed limit by 25 km/h or more')
    ),
    10000015,
    '100389',
    'JYA3HHE05RA070562'
);

COMMIT;

INSERT INTO suspension VALUES (
    '100389',
    to_date('07-Jan-2020'),
    to_date(add_months('07-Jan-2020', 6), 'dd-Mon-yyyy')
);

/*

Updated existing records.

*/


UPDATE offence
SET
    dem_code = (
        SELECT
            dem_code
        FROM
            demerit
        WHERE
            lower(dem_description) = lower('Exceeding the speed limit by 10 km/h or more but less than 25 km/h')
    )
WHERE
    lic_no = '100389'
    AND dem_code = (
        SELECT
            dem_code
        FROM
            demerit
        WHERE
            lower(dem_description) = lower('Exceeding the speed limit by 25 km/h or more')
    )
    AND to_char(off_datetime, 'DD-MON-YYYY hh:mi AM') = '07-JAN-2020 07:07 AM';

DELETE FROM suspension
WHERE
    lic_no = '100389'
    AND to_char(sus_date, 'DD-MON-YYYY') = '07-JAN-2020';

select * from suspension;

COMMIT;



