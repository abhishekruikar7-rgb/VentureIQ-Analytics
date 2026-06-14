CREATE DATABASE ventureIQ;

USE ventureIQ;

CREATE TABLE startups(
startup_id INT PRIMARY KEY AUTO_INCREMENT,
startup_name VARCHAR(100) NOT NULL,
industry VARCHAR(50),
founded_year INT,
location VARCHAR(50),
stage VARCHAR(30)
);

CREATE TABLE founders(
founder_id INT PRIMARY KEY AUTO_INCREMENT,
startup_id INT,
founder_name VARCHAR(100),
experience_years INT,
previous_company VARCHAR(100),
FOREIGN KEY(startup_id)
REFERENCES startups(startup_id)
);

CREATE TABLE funding_rounds(
round_id INT PRIMARY KEY AUTO_INCREMENT,
startup_id INT,
round_name VARCHAR(50),
amount DECIMAL(12,2),
valuation DECIMAL(12,2),
funding_date DATE,
FOREIGN KEY(startup_id)
REFERENCES startups(startup_id)
);

CREATE TABLE startup_metrics(
metric_id INT PRIMARY KEY AUTO_INCREMENT,
startup_id INT,
monthly_users INT,
monthly_revenue DECIMAL(12,2),
growth_rate DECIMAL(5,2),
retention_rate DECIMAL(5,2),
burn_rate DECIMAL(12,2),
FOREIGN KEY(startup_id)
REFERENCES startups(startup_id)
);

CREATE TABLE investors(
investor_id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(100),
risk_level VARCHAR(20),
preferred_industry VARCHAR(50)
);

CREATE TABLE investments(
investment_id INT PRIMARY KEY AUTO_INCREMENT,
investor_id INT,
startup_id INT,
amount DECIMAL(12,2),
equity DECIMAL(5,2),
investment_date DATE,
FOREIGN KEY(investor_id)
REFERENCES investors(investor_id),
FOREIGN KEY(startup_id)
REFERENCES startups(startup_id)

);

INSERT INTO startups
(startup_name,industry,founded_year,location,stage)
VALUES
('FinNova','FinTech',2021,'Mumbai','Series A'),
('HealthAI','Healthcare',2020,'Bangalore','Series B'),
('AgroTech','Agriculture',2022,'Pune','Seed');

SELECT * FROM startups;

SELECT *
FROM startups
WHERE industry='FinTech';

SELECT 
s.startup_name,
m.monthly_revenue
FROM startups s
JOIN startup_metrics m
ON s.startup_id=m.startup_id;

SELECT 
startup_name,
growth_rate
FROM startups s
JOIN startup_metrics m
ON s.startup_id=m.startup_id
ORDER BY growth_rate DESC
LIMIT 5;

SELECT startup_name
FROM startups s
JOIN startup_metrics m
ON s.startup_id=m.startup_id
WHERE burn_rate > monthly_revenue;

SELECT 
industry,
AVG(growth_rate)
FROM startups s
JOIN startup_metrics m
ON s.startup_id=m.startup_id
GROUP BY industry;

CREATE VIEW promising_startups AS

SELECT 
startup_name,
growth_rate,
retention_rate
FROM startups s
JOIN startup_metrics m
ON s.startup_id=m.startup_id
WHERE growth_rate > 20;

select * from startups;

SELECT COUNT(*) AS total_startups
FROM startups;

USE ventureiq;


-- ==========================
-- STARTUPS DATA
-- ==========================

INSERT INTO startups
(startup_name, industry, founded_year, location, stage)
VALUES

('FinNova','FinTech',2021,'Mumbai','Series A'),
('HealthAI','Healthcare',2020,'Bangalore','Series B'),
('AgroTech','Agriculture',2022,'Pune','Seed'),
('EduSpark','EdTech',2019,'Delhi','Series B'),
('GreenEnergy','Energy',2018,'Hyderabad','Series C'),
('CloudNova','SaaS',2021,'Bangalore','Series A'),
('TravelMate','Travel',2022,'Goa','Seed'),
('SecureNet','Cybersecurity',2019,'Pune','Series B'),
('FoodXpress','FoodTech',2023,'Mumbai','Seed'),
('AutoDrive','Automobile',2020,'Chennai','Series A'),
('RetailPro','Retail',2021,'Delhi','Series A'),
('LogiSmart','Logistics',2022,'Chennai','Seed'),
('BioLife','Biotech',2018,'Hyderabad','Series C'),
('SmartHome','IoT',2023,'Bangalore','Seed'),
('PayWorld','FinTech',2017,'Mumbai','Series C');


-- ==========================
-- FOUNDERS DATA
-- ==========================

INSERT INTO founders
(startup_id, founder_name, experience_years, previous_company)
VALUES

(1,'Rahul Sharma',8,'Google'),
(2,'Ananya Patil',10,'Microsoft'),
(3,'Rohit Verma',6,'Tata'),
(4,'Neha Singh',7,'Byju'),
(5,'Amit Joshi',12,'Tesla'),
(6,'Karan Mehta',9,'Amazon'),
(7,'Priya Shah',5,'MakeMyTrip'),
(8,'Vikas Rao',11,'Cisco'),
(9,'Sneha Kulkarni',4,'Zomato'),
(10,'Arjun Nair',8,'BMW'),
(11,'Riya Gupta',6,'Flipkart'),
(12,'Manish Jain',7,'DHL'),
(13,'Pooja Desai',13,'Pfizer'),
(14,'Akash Yadav',5,'Samsung'),
(15,'Nitin Roy',14,'Paytm');



-- ==========================
-- FUNDING ROUND DATA
-- ==========================

INSERT INTO funding_rounds
(startup_id, round_name, amount, valuation, funding_date)
VALUES

(1,'Seed',500000,5000000,'2021-05-10'),
(1,'Series A',3000000,20000000,'2023-02-15'),

(2,'Series A',5000000,30000000,'2022-07-20'),
(2,'Series B',10000000,70000000,'2024-01-12'),

(3,'Seed',800000,8000000,'2023-04-05'),

(4,'Series A',2000000,15000000,'2021-09-18'),
(5,'Series C',25000000,200000000,'2023-11-11'),

(6,'Series A',4000000,25000000,'2022-08-08'),

(7,'Seed',600000,6000000,'2023-03-21'),

(8,'Series B',8000000,60000000,'2024-02-14'),

(9,'Seed',300000,3000000,'2023-06-30'),

(10,'Series A',6000000,45000000,'2022-12-10'),

(11,'Series A',3500000,25000000,'2023-10-01'),

(12,'Seed',700000,7000000,'2022-05-15'),

(13,'Series C',20000000,150000000,'2024-04-20'),

(14,'Seed',400000,4000000,'2023-08-25'),

(15,'Series C',30000000,250000000,'2022-11-05');



-- ==========================
-- STARTUP METRICS
-- ==========================

INSERT INTO startup_metrics
(startup_id, monthly_users, monthly_revenue, growth_rate, retention_rate, burn_rate)
VALUES

(1,80000,90000,35,85,40000),
(2,150000,250000,45,90,120000),
(3,30000,25000,18,70,30000),
(4,120000,180000,30,80,90000),
(5,250000,600000,25,88,250000),
(6,100000,220000,40,92,100000),
(7,45000,50000,22,75,35000),
(8,90000,150000,28,82,80000),
(9,20000,15000,10,60,25000),
(10,70000,120000,32,78,70000),
(11,85000,140000,26,80,75000),
(12,40000,45000,15,68,40000),
(13,300000,900000,50,94,300000),
(14,25000,20000,12,65,30000),
(15,500000,1500000,55,95,500000);



-- ==========================
-- INVESTORS
-- ==========================

INSERT INTO investors
(name,risk_level,preferred_industry)
VALUES

('Alpha Ventures','High','FinTech'),
('Blue Capital','Medium','Healthcare'),
('Growth Partners','Low','SaaS'),
('Future Fund','High','AI'),
('Vertex Investors','Medium','Energy'),
('Skyline Ventures','High','Cybersecurity'),
('Nova Capital','Low','Retail'),
('Peak Ventures','Medium','Agriculture');



-- ==========================
-- INVESTMENTS
-- ==========================

INSERT INTO investments
(investor_id,startup_id,amount,equity,investment_date)
VALUES

(1,1,1000000,10,'2023-01-10'),
(2,2,5000000,15,'2023-05-15'),
(3,6,3000000,12,'2022-10-20'),
(4,8,4000000,18,'2024-03-12'),
(5,5,7000000,20,'2023-12-01'),
(6,8,2000000,8,'2024-05-18'),
(7,11,1500000,7,'2023-11-11'),
(8,3,500000,10,'2023-07-07'),
(1,15,10000000,12,'2024-01-20'),
(2,13,8000000,15,'2024-06-01'),
(3,4,2000000,10,'2022-09-09'),
(5,10,3000000,11,'2023-04-14');



-- ==========================
-- VERIFY DATA
-- ==========================

SELECT COUNT(*) AS startups
FROM startups;

SELECT COUNT(*) AS founders
FROM founders;

SELECT COUNT(*) AS funding_rounds
FROM funding_rounds;

SELECT COUNT(*) AS metrics
FROM startup_metrics;

SELECT COUNT(*) AS investors
FROM investors;

SELECT COUNT(*) AS investments
FROM investments;

USE ventureiq;

SELECT COUNT(*) 
FROM startups;

SELECT * 
FROM startups;