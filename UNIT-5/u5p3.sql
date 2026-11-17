CREATE OR REPLACE TRIGGER trg_log_emp_insert
AFTER INSERT ON EMP
FOR EACH ROW
BEGIN
  INSERT INTO NEWEMP 
	(emp_id, 
	emp_name, 
	salary, 
	gender)
  VALUES 
	(:NEW.emp_id, 
	:NEW.emp_name, 
	:NEW.salary, 
	:NEW.gender);
END;
/