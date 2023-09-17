-- 1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
SELECT `students`.`name` AS 'student_name', `students`.`surname` AS 'student_surname', `degrees`.`name` AS 'degrees_course'
FROM `students`
INNER JOIN `degrees` ON `students`.`degree_id` = `degrees`.`id`
WHERE `degrees`.`name` = 'Corso di Laurea in Economia';

-- 2. Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze
SELECT `departments`.`name` AS 'department_name', `degrees`.`name` AS 'degrees_course', `degrees`.`level` AS 'degrees_level'
FROM `departments`
INNER JOIN `degrees` ON `departments`.`id` = `degrees`.`department_id`
WHERE `departments`.`name` = "Dipartimento di Neuroscienze"
AND `degrees`.`level` = "magistrale";

-- 3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)
SELECT `courses`.`name` AS 'course_name', `teachers`.`name` AS 'teacher_name', `teachers`.`surname` AS 'teacher_surname'
FROM `course_teacher`
INNER JOIN `courses` ON `courses`.`id` = `course_teacher`.`course_id`
INNER JOIN `teachers` ON `teachers`.`id` = `course_teacher`.`teacher_id`
WHERE `teachers`.`id` = 44;

-- 4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome
SELECT `students`.`name` AS 'student_name', `students`.`surname` AS 'student_surname', `degrees`.`name` AS 'degrees_course', `departments`.`name` AS 'department_name'
FROM `students`
INNER JOIN `degrees` ON `degrees`.`id` = `students`.`degree_id`
INNER JOIN `departments` ON `departments`.`id` = `degrees`.`department_id`
ORDER BY `students`.`name`, `students`.`surname`;

-- 5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti
SELECT `degrees`.`name` AS 'degrees_course', `courses`.`name` AS 'course_name', `teachers`.`name` AS 'teacher_name', `teachers`.`surname` AS 'teacher_surname'
FROM `degrees`
INNER JOIN `courses` ON `degrees`.`id` = `courses`.`degree_id`
INNER JOIN `course_teacher` ON `courses`.`id` = `course_teacher`.`course_id`
INNER JOIN `teachers` ON `course_teacher`.`teacher_id` = `teachers`.`id`;

-- 6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)
SELECT `teachers`.`name` AS 'teacher_name', `teachers`.`surname` AS 'teacher_surname', `departments`.`name` AS 'department_name'
FROM `departments`
INNER JOIN `degrees` ON `degrees`.`department_id` = `departments`.`id`
INNER JOIN `courses` ON `courses`.`degree_id` = `degrees`.`id`
INNER JOIN `course_teacher` ON `course_teacher`.`course_id` = `courses`.`id`
INNER JOIN `teachers` ON `course_teacher`.`teacher_id` = `teachers`.`id`
WHERE `departments`.`name` = "Dipartimento di Matematica";