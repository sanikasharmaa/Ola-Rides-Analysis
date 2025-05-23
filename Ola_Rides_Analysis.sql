Create Database Ola;
Use Ola;

# 1. retrieve all successful bookings
Create View Successful_Bookings As #temporary storage instead of typing whole query repeatedly 
select * from bangalore_ride_data 
where Booking_Status = 'Success';
#alternative ans for 1.
Select * from Successful_Bookings;

#2. Find the average ride distance for each vehicle type:
Create View ride_distance_for_each_vehicle as
select Vehicle_Type , avg(Ride_Distance)
as avg_distance from bangalore_ride_data
group by Vehicle_Type;

Select * from ride_distance_for_each_vehicle;

#3. Get the total number of cancelled rides by customers:
create view total_number_of_cancelled_rides_by_customers as
select count(*) from bangalore_ride_data
where Cancelled_Rides_by_Customer=1;

select * from total_number_of_cancelled_rides_by_customers;


#4. List the top 5 customers who booked the highest number of rides:
create view top_5_customers as
select Customer_ID , count(Booking_ID) as total_rides
from bangalore_ride_data 
group by Customer_ID
order by total_rides DESC 
LIMIT 5;

select * from top_5_customers;

#5. Get the number of rides cancelled by drivers due to personal and car-related issues:
create view rides_cancelled_by_driver_P_C_issues as
select count(*) from bangalore_ride_data
where Reason_for_cancelling_by_Driver='Personal & Car related issues';

select * from rides_cancelled_by_driver_P_C_issues ;

#6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
create view max_min_driver_rating_prime_sedan as
select max(Driver_Ratings) as max_rating,
min(Driver_Ratings) as min_rating
From bangalore_ride_data
where Vehicle_Type='Prime Sedan';

select * from max_min_driver_rating_prime_sedan;


#7. Find the average customer rating per vehicle type:
#per -> use group by
create view avg_cust_rating_per_vehicle as
select Vehicle_Type , avg(Customer_rating) as avg_customer_rating
from bangalore_ride_data
group by Vehicle_Type;

select * from avg_cust_rating_per_vehicle;

#8. Calculate the total booking value of rides completed successfully:
#total -> sum
create view total_successful_ride_value as
select Booking_Status , sum(Booking_Value) as success_rides_sum
from bangalore_ride_data
where Booking_Status ='Success';

select * from total_successful_ride_value;

#9. List all incomplete rides along with the reason:
create view incomplete_rides_reason as
select Booking_ID , Incomplete_Rides_Reason
from bangalore_ride_data
where Incomplete_Rides = '1';  

select * from incomplete_rides_reason;
