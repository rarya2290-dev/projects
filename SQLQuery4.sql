
--QS 1
create view successfull_bookings as
select*
from bookings
where Booking_Status = 'Success'

--QS 2
create view avg_ride as
select Vehicle_Type, 
avg(ride_distance) as avg_ride
from Bookings
group by Vehicle_Type
select* from avg_ride

--QS 3
create view canceled_by_customer as 
select count(*) as total
from Bookings
where Booking_Status = 'canceled by customer'
select* from canceled_by_customer

--QS 4
CREATE VIEW TOP_5_REPEAT_CUSTOMERS AS
select TOP 5
CUSTOMER_ID,
COUNT(Booking_ID) AS TOTAL_RIDES
FROM BOOKINGS
GROUP BY Customer_ID
ORDER BY TOTAL_RIDES DESC
SELECT * FROM TOP_5_REPEAT_CUSTOMERS

--QS 5
create view CancelledDueToPersonalReasons as
SELECT COUNT(*) as cancelled
FROM Bookings
WHERE Canceled_Rides_by_Driver = 'Personal & Car related issue'
select * from CancelledDueToPersonalReasons;

--QS 6 
CREATE VIEW MAX_MIN_RATINGS AS
SELECT MAX(DRIVER_RATINGS) AS MAX_RATINGS, MIN(DRIVER_RATINGS) AS MIN_RATINGS
FROM Bookings
WHERE Vehicle_Type = 'Prime Sedan'
SELECT* FROM MAX_MIN_RATINGS

--QS 7
CREATE VIEW UPI AS
SELECT* FROM Bookings
WHERE Payment_Method = 'UPI'
SELECT* FROM UPI

--QS 8
CREATE VIEW AVG_CUSTOMER_RATINGS AS
SELECT 
VEHICLE_TYPE,
AVG(CUSTOMER_RATING) AS AVG_RATING
FROM Bookings
GROUP BY Vehicle_Type
SELECT * FROM AVG_CUSTOMER_RATINGS

--QS 9 
 CREATE VIEW TOTAL_AMT AS
 SELECT 
 SUM(BOOKING_VALUE) TOTAL_VALUE
 FROM Bookings
 WHERE Booking_Status = 'Success'
 SELECT* FROM TOTAL_AMT

 --QS 10
 CREATE VIEW INCOMPLETE_RIDES AS
 SELECT Booking_ID,Incomplete_Rides_Reason
 FROM BOOKINGS
 WHERE Incomplete_Rides_Reason <> 'null'
 SELECT * FROM INCOMPLETE_RIDES