-- 1. Contare quanti iscritti ci sono stati ogni anno
SELECT COUNT(*) AS 'enrolled_students' , YEAR(`enrolment_date`) AS 'academic_year'
FROM `students`
GROUP BY YEAR(`enrolment_date`);

-- 2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio
SELECT COUNT(*) AS 'teachers_number', `office_address` AS 'academic_address'
FROM `teachers`
GROUP BY `office_address`;

-- 3. Calcolare la media dei voti di ogni appello d'esame
SELECT AVG(`vote`) AS 'average_grades', `exam_id` AS 'exam_appeal'
FROM `exam_student`
GROUP BY `exam_id`;

-- 4. Contare quanti corsi di laurea ci sono per ogni dipartimento
SELECT COUNT(*) AS 'degree_courses', `department_id` AS 'department'
FROM `degrees`
GROUP BY `department_id`;
