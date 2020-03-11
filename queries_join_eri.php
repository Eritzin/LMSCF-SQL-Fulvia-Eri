SELECT first_name,last_name,title 
FROM `book`
INNER JOIN `author` on fk_author_id = author_id;

SELECT first_name,last_name,title 
FROM `book` 
LEFT JOIN `author` on fk_author_id = author_id;

SELECT first_name,last_name,title 
FROM `book` 
RIGHT JOIN `author`on fk_author_id = author_id

SELECT `user`.first_name,`user`.last_name,book.title  
FROM `user` 
INNER JOIN `read` on `user`.user_id=`read`.fk_user_id
INNER JOIN `book` on `read`.`read_id`=`book`.`fk_read_id`;