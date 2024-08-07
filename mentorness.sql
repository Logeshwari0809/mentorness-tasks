-- 1. What is the total number of reservations in the dataset? 
SELECT 
    COUNT(Booking_ID) AS Total_Reservations
FROM
    mentorness.`hotel reservation dataset`;

-- 2. Which meal plan is the most popular among guests?
SELECT 
    type_of_meal_plan, COUNT(*) AS num_reservations
FROM
    mentorness.`hotel reservation dataset`
GROUP BY type_of_meal_plan
ORDER BY num_reservations DESC
LIMIT 1;


-- 3. What is the average price per room for reservations involving children?
SELECT 
    ROUND(AVG(avg_price_per_room), 2) AS Average_Price_per_Room
FROM
    mentorness.`hotel reservation dataset`
WHERE
    no_of_children > 0;

-- 4. How many reservations were made for the year 20XX (replace XX with the desired year)? 
SELECT 
    SUBSTRING(arrival_date, - 4) AS year,
    COUNT(*) AS total_reservations
FROM
    mentorness.`hotel reservation dataset`
WHERE
    SUBSTRING(arrival_date, - 4) = '2017'
        OR '2018'
GROUP BY year;

-- 5.What is the most commonly booked room type?
SELECT 
    room_type_reserved,
    COUNT(room_type_reserved) AS total_bookings
FROM
    mentorness.`hotel reservation dataset`
GROUP BY room_type_reserved
ORDER BY total_bookings DESC;

-- 6. How many reservations fall on a weekend (no_of_weekend_nights > 0)? 
SELECT 
    COUNT(*) AS weekend_reservations
FROM
    mentorness.`hotel reservation dataset`
WHERE
    no_of_weekend_nights > 0;

-- 7. What is the highest and lowest lead time for reservations? 
SELECT 
    MAX(lead_time) AS highest_lead_time,
    MIN(lead_time) AS lowest_lead_time
FROM
    mentorness.`hotel reservation dataset`;

-- 8. What is the most common market segment type for reservations?
SELECT 
    market_segment_type, COUNT(*) AS segment_count
FROM
    mentorness.`hotel reservation dataset`
GROUP BY market_segment_type
ORDER BY segment_count DESC;
 
-- 9. How many reservations have a booking status of "Confirmed"? 
SELECT 
    COUNT(*) AS confirmed_reservations
FROM
    mentorness.`hotel reservation dataset`
WHERE
    booking_status = 'Not_Canceled';

-- 10. What is the total number of adults and children across all reservations? 
SELECT 
    SUM(no_of_adults) AS total_adults,
    SUM(no_of_children) AS total_children
FROM
    mentorness.`hotel reservation dataset`;

-- 11. What is the average number of weekend nights for reservations involving children?
SELECT 
    ROUND(AVG(no_of_weekend_nights), 2) AS Avg_Weekend_Nights_with_Children
FROM
    mentorness.`hotel reservation dataset`
WHERE
    no_of_children > 0;

-- 12. How many reservations were made in each month of the year? 
SELECT 
    MONTH(STR_TO_DATE(arrival_date, '%d-%m-%Y')) AS month,
    COUNT(*) AS num_reservations
FROM
    mentorness.`hotel reservation dataset`
GROUP BY MONTH(STR_TO_DATE(arrival_date, '%d-%m-%Y'))
ORDER BY month;

-- 13. What is the average number of nights (both weekend and weekday) spent by guests for each room type?
SELECT 
    room_type_reserved,
    ROUND(AVG(no_of_weekend_nights + no_of_week_nights),
            2) AS avg_nights
FROM
    mentorness.`hotel reservation dataset`
GROUP BY room_type_reserved;

-- 14. For reservations involving children, what is the most common room type, and what is the average price for that room type? 
SELECT 
    room_type_reserved AS most_common_room_type,
    ROUND(AVG(avg_price_per_room), 2) AS average_price
FROM
    mentorness.`hotel reservation dataset`
WHERE
    no_of_children > 0
GROUP BY room_type_reserved
ORDER BY average_price DESC;

-- 15. Find the market segment type that generates the highest average price per room.
SELECT 
    market_segment_type,
    ROUND(AVG(avg_price_per_room), 2) AS average_price
FROM
    mentorness.`hotel reservation dataset`
GROUP BY market_segment_type
ORDER BY average_price DESC;