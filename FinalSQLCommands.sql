SELECT *
FROM countrychairman;

SELECT COORDINATOR_coordinator_id, sub_type
FROM sub_entity_chapter	S, coordinator C
WHERE sub_type = "Veteran";

SELECT member_id, member_name
FROM member
WHERE position = "ACM assistant";

SELECT *
FROM member, city_chapter
WHERE position = "Chapter assistant";

SELECT *
FROM member, city_chapter
WHERE state_name ="Texas";

Select member_id, member_name
FROM member
WHERE date_of_joining > 2019;

Select *
FROM coordinator
WHERE state_name = "Texas";



