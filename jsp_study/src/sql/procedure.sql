select * 
from board;


delimiter $$
create procedure p_for_exam(in size int)
begin
declare totalCnt int default 0;
declare loofCnt int default 0;
while(loofCnt<=size)do
set loofCnt = loofCnt + 1;
set totalCnt = totalCnt + loofCnt;
end while;
select concat('total=',totalCnt);
end $$
delimiter ;

call p_for_exam(2);

drop procedure p_for_exam;

delimiter $$
create procedure p_for_exam(in size int)
begin
	declare loofCnt int default 0;
	while(loofCnt<=size)do
		set loofCnt = loofCnt + 1;
		insert into board (title, content, reg_date, writer)
		values(concat('test', loofCnt),concat('test', loofCnt), now(),3);
	end while;
end $$
delimiter ;

call p_for_exam (1000);

select * from board;