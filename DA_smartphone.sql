-- 1. Tổng quan dữ liệu
SELECT TOP 10 *
FROM user_behavior_dataset

-- 1.1 Tổng số người dùng, thiết bị, hệ điều hành, giới tính và nhóm người dùng
SELECT
   COUNT(*) AS total_user,
   COUNT(DISTINCT Device_Model) AS model_count,
   COUNT(DISTINCT Operating_System) AS os_count,
   COUNT(DISTINCT Gender) AS gender_count,
   COUNT(DISTINCT User_Behavior_Class) AS class_count
FROM user_behavior_dataset

-- 1.2 Số người dùng theo hệ điều hành
SELECT
   Operating_System,
   COUNT(*) AS total_user
FROM user_behavior_dataset
GROUP BY Operating_System
ORDER BY total_user DESC

-- 1.3 Số người dùng theo giới tính
SELECT
   Gender,
   COUNT(*) AS total_user
FROM user_behavior_dataset
GROUP BY Gender
ORDER BY total_user DESC

-- 1.4 Thống kê trung bình thời gian sử dụng ứng dụng và màn hình theo OS
SELECT Operating_System,
       ROUND(AVG(App_Usage_Time_min_day), 2) AS avg_app_time,
       ROUND(AVG(Screen_On_Time_hours_day), 2) AS avg_screen_time
FROM user_behavior_dataset
GROUP BY Operating_System

-- 1.5 Số người dùng theo thiết bị
SELECT TOP 10
    Device_Model,
    COUNT(*) AS total_user,
    ROUND(AVG("App_Usage_Time_min_day"),2) AS avg_app_time
FROM user_behavior_dataset
GROUP BY Device_Model
ORDER BY total_user DESC

-- 2. Phân tích mức độ sử dụng
-- 2.1  Tương quan giữa app usage, pin và data
SELECT
    ROUND(AVG(App_Usage_Time_min_day),2) AS avg_app_time,
    ROUND(AVG(Battery_Drain_mAh_day),2) AS avg_battery_drain,
    ROUND(AVG(Data_Usage_MB_day),2) AS avg_data_usage
FROM user_behavior_dataset

-- 2.2 So sánh theo từng nhóm hành vi
SELECT User_Behavior_Class,
       ROUND(AVG(App_Usage_Time_min_day),2) AS avg_app_time,
       ROUND(AVG(Battery_Drain_mAh_day),2) AS avg_battery_drain,
       ROUND(AVG(Data_Usage_MB_day),2) AS avg_data_usage,
       COUNT(*) AS total_user
FROM user_behavior_dataset
GROUP BY User_Behavior_Class
ORDER BY User_Behavior_Class

-- 3. Phân tích nhân khẩu học
-- 3.1  Ảnh hưởng của giới tính đến hành vi
SELECT Gender,
       ROUND(AVG(App_Usage_Time_min_day),2) AS avg_app_time,
       ROUND(AVG(Number_of_Apps_Installed),2) AS avg_app,
       ROUND(AVG(Data_Usage_MB_day),2) AS avg_data_usage
FROM user_behavior_dataset
GROUP BY Gender

-- 3.2 Ảnh hưởng của độ tuổi
SELECT
    CASE
        WHEN Age < 25 THEN 'Dưới 25'
        WHEN Age BETWEEN 25 AND 40 THEN '25-40'
        ELSE 'Trên 40'
    END AS age_group,
    ROUND(AVG(App_Usage_Time_min_day),2) AS avg_app_time,
    ROUND(AVG(Data_Usage_MB_day),2) AS avg_data_usage,
    ROUND(AVG(Battery_Drain_mAh_day),2) AS avg_battery_drain
FROM user_behavior_dataset
GROUP BY
    CASE
        WHEN Age < 25 THEN 'Dưới 25'
        WHEN Age BETWEEN 25 AND 40 THEN '25-40'
        ELSE 'Trên 40'
    END
ORDER BY avg_app_time,avg_data_usage,avg_battery_drain

-- 4. Phân khúc người dùng
SELECT
    CASE
        WHEN App_Usage_Time_min_day > 300 THEN 'Heavy User'
        WHEN App_Usage_Time_min_day BETWEEN 150 AND 300 THEN 'Moderate User'
        ELSE 'Light User'
    END AS usage_roup,
    COUNT(*) AS total_user,
    ROUND(AVG(Battery_Drain_mAh_day),2) AS avg_battery_drain,
    ROUND(AVG(Data_Usage_MB_day),2) AS avg_data_usage,
    ROUND(AVG(Number_of_Apps_Installed),2) AS avg_app
FROM user_behavior_dataset
GROUP BY
    CASE
        WHEN App_Usage_Time_min_day > 300 THEN 'Heavy User'
        WHEN App_Usage_Time_min_day BETWEEN 150 AND 300 THEN 'Moderate User'
        ELSE 'Light User'
    END
ORDER BY total_user DESC

-- 5. So sánh theo hệ điều hành
SELECT Operating_System,
       ROUND(AVG(App_Usage_Time_min_day),2) AS avg_app_time,
       ROUND(AVG(Battery_Drain_mAh_day),2) AS avg_battery_drain,
       ROUND(AVG(Data_Usage_MB_day),2) AS avg_data_usage,
       ROUND(AVG(Number_of_Apps_Installed),2) AS avg_app
FROM user_behavior_dataset
GROUP BY Operating_System

-- 6. Tổng kết hành vi theo lớp
SELECT User_Behavior_Class,
       ROUND(AVG(Age),2) AS avg_age,
       ROUND(AVG(App_Usage_Time_min_day),2) AS avg_app_time,
       ROUND(AVG(Screen_On_Time_hours_day),2) AS avg_screen_time,
       ROUND(AVG(Battery_Drain_mAh_day),2) AS avg_battery_drain,
       ROUND(AVG(Data_Usage_MB_day),2) AS avg_data_usage,
       ROUND(AVG(Number_of_Apps_Installed),2) AS avg_app
FROM user_behavior_dataset
GROUP BY User_Behavior_Class
ORDER BY User_Behavior_Class