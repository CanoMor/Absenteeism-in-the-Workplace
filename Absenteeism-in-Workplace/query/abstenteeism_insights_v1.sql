--JOIN TABLE
SELECT *
FROM Absenteeism_at_work a
left join dbo.compensation b 
	on a.ID = b.ID
left join dbo.Reasons r
	on a.Reason_for_absence = r.Number;

--find the healthiest
select * from Absenteeism_at_work
where 0 in (Social_drinker, Social_drinker) 
and Body_mass_index < 25 
and Absenteeism_time_in_hours < (select avg(Absenteeism_time_in_hours) from Absenteeism_at_work)

--compensation rate increase for non-smokers/ budget $983,221/0.68 increase in hourly pay/ $1,414.4 increase in pay per year
select count(*) as nonsmokers from Absenteeism_at_work
where Social_smoker = 0

--optimize query
SELECT a.ID, r.Reason,Body_mass_index,
	CASE
		WHEN Body_mass_index < 18.5 THEN 'Underweight'
		WHEN Body_mass_index between 18.5 and 25 THEN 'Healthy Weight'
		WHEN Body_mass_index between 25 and 30 THEN 'Overweight'
		WHEN Body_mass_index > 18.5 THEN 'Obese'
		ELSE 'Unknown' END as BMI_Category
		,
	CASE 
		WHEN Month_of_absence IN (12,1,2) THEN 'Winter'
		WHEN Month_of_absence IN (3,4,5) THEN 'Spring'
		WHEN Month_of_absence IN (6,7,8) THEN 'Summer'
		WHEN Month_of_absence IN (9,10,11) THEN 'Fall'
		ELSE 'Unkown' END as Season_Name,
		Month_of_absence,
		Day_of_the_week,
		Transportation_expense,
		Education,
		Son,
		Social_drinker,
		Social_smoker,
		Pet,
		Disciplinary_failure,
		Age,
		Work_load_Average_day,
		Absenteeism_time_in_hours

FROM Absenteeism_at_work a
left join dbo.compensation b 
	on a.ID = b.ID
left join dbo.Reasons r
	on a.Reason_for_absence = r.Number;