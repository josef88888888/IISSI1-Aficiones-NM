
USE hobbies_nm_db;

DELIMITER //

-- Primera funcion
CREATE OR REPLACE FUNCTION f_get_hobby_id(
	p_hobby_name VARCHAR(128)
)
RETURNS INT
READS SQL DATA
BEGIN 
	DECLARE v_hobby_id INT;
	
	SELECT hobby_id INTO v_hobby_id
	FROM hobbies
	WHERE hobby_name = p_hobby_name;
	
	RETURN v_hobby_id;
END //

-- Segunda funcion
CREATE OR REPLACE FUNCTION f_hobby_users(
	p_hobby_name VARCHAR(128)
)
RETURNS INT
READS SQL DATA 
BEGIN 
	DECLARE v_res INT;
	
	SELECT COUNT(*) INTO v_res
	FROM users_hobbies uh
	JOIN hobbies h ON uh.hobby_id = h.hobby_id
	WHERE h.hobby_name = p_hobby_name;
	
	RETURN v_res;
END //
 


DELIMITER ;

-- SELECT f_get_hobby_id('Deporte');
-- SELECT hobby_name, f_hobby_users(hobby_name) AS num_de_usuarios FROM hobbies;

