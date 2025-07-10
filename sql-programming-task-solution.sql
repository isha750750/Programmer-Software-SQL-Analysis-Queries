CREATE TABLE programmer (
    programmer_id int primary key,
    name1 varchar(200),
    AGE int,
    gender VARCHAR(10),
    DOB DATE,
    DOJ DATE,
    languages_known varchar(500)
);


CREATE TABLE software (
    software_id int primary key,
    programmer_id int,
    software_name varchar(200),
    development_lang varchar(200),
    development_cost decimal(20, 2),
    selling_prize decimal(20, 2),
    foreign key (programmer_id) references programmer(programmer_id)
);


CREATE table studies (
    study_id INT PRIMARY KEY,
    programmer_id int,
    name_of_course VARCHAR(200),
    lang_name VARCHAR(200),
    foreign key (programmer_id) references programmer(programmer_id)
);


Inserting the values -------------------------------

INSERT INTO PROGRAMMER (PROGRAMMER_ID, name1, AGE, GENDER, DOB, DOJ, LANGUAGES_KNOWN)
VALUES
    (01, 'John', 21, 'Male', '1995-03-11', '2018-07-10', 'Java, Python, SQL'),
    (02, 'Jane', 22, 'Female', '1999-08-12', '2020-01-09', 'C#, C++, JavaScript'),
    (03, 'Mike ', 32, 'Male', '1989-11-13', '2012-05-08', 'PHP, HTML, CSS'),
    (04, 'Brown', 23, 'Female', '1994-06-14', '2016-09-07', 'Python, R, Java'),
    (05, 'David', 24, 'Male', '1997-12-15', '2019-11-06', 'Python, JavaScript');

	INSERT INTO software (software_id, programmer_id, software_name, development_lang, development_cost, selling_prize)
VALUES
    (1, 01, 'JDK', 'Java', 1400.00, 2500.00),
    (2, 02, 'net_beans', 'C#', 1500.00, 3200.00),
    (3, 03, 'net_beans', 'PHP', 1000.00, 2800.00),
    (4, 04, 'pycharm', 'Python', 9000.00, 3300.10),
    (5, 05, 'pycharm', 'Python', 500.00, 2200.00);

	INSERT INTO studies (study_id, programmer_id, name_of_course, lang_name)
VALUES
    (1, 01, 'DAP', 'Python'),
    (2, 02, 'DSA', 'C++'),
    (3, 03, 'Web Development', 'JavaScript'),
    (4, 04, 'ML', 'Python'),
    (5, 05, 'AI', 'Python');

Answers of the questions 1 to 10 -------------------

1.	SELECT AVG(selling_prize) AS AverageSellingCost
FROM SOFTWARE
WHERE development_lang = 'Pascal';


2.	SELECT PROGRAMMER.name1, PROGRAMMER.AGE
              FROM PROGRAMMER

3.	SELECT PROGRAMMER.name1 FROM PROGRAMMER
               INNER JOIN STUDIES ON PROGRAMMER.PROGRAMMER_ID = STUDIES.PROGRAMMER_ID
               WHERE STUDIES.name_of_course = 'DAP';

4.	SELECT name1, DOB
              FROM PROGRAMMER
              WHERE MONTH(DOB) = 11;

             SELECT name1, DOB
              FROM PROGRAMMER
             WHERE DATEPART(MONTH, DOB) = 12;

5.	SELECT SOFTWARE.SOFTWARE_NAME, SOFTWARE.DEVELOPMENT_LANG, SOFTWARE.selling_prize FROM SOFTWARE
              INNER JOIN PROGRAMMER ON SOFTWARE.PROGRAMMER_ID = PROGRAMMER.PROGRAMMER_ID
               WHERE PROGRAMMER.name1 = 'jane';

6.	SELECT SOFTWARE.SOFTWARE_NAME, SOFTWARE.DEVELOPMENT_LANG, SOFTWARE.DEVELOPMENT_COST FROM SOFTWARE
              WHERE SOFTWARE.DEVELOPMENT_COST <= SOFTWARE.selling_prize;

7.	SELECT PROGRAMMER.name1, PROGRAMMER.LANGUAGES_KNOWN FROM PROGRAMMER
               WHERE PROGRAMMER.LANGUAGES_KNOWN LIKE '%C%';

8.	SELECT DISTINCT STUDIES.name_of_course FROM PROGRAMMER
INNER JOIN STUDIES ON PROGRAMMER.PROGRAMMER_ID = STUDIES.PROGRAMMER_ID

9.	SELECT PROGRAMMER.name1, PROGRAMMER.DOJ FROM PROGRAMMER
               WHERE PROGRAMMER.DOJ < '2020-01-09';

10.	SELECT PROGRAMMER.name1 FROM PROGRAMMER
               INNER JOIN SOFTWARE ON PROGRAMMER.PROGRAMMER_ID = SOFTWARE.PROGRAMMER_ID
               WHERE SOFTWARE.selling_prize > (2 * SOFTWARE.DEVELOPMENT_COST);






