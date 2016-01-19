######################################
1) 특정 Table DUMP를 이용하는 방법
특징) 하나이상의 테이블 데이터를 한번에 처리할 수 있슴
######################################
Step1) 파일로 저장하기
/mysql/pqms/mysql/bin/mysqldump -usktuser -psktuser000 -P3312 -h127.0.0.1 -S /tmp/pqms.sock --single-transaction --no-create-db --add-drop-table skt_meta \
tb_pkg_get_query \
> /home/skt/work/db_patch/20140613_01.sql

Step2) 해당 파일 Remote에 복사

Step3) 해당 파일 DB Load
my실행

truncate table skt_meta.tb_pkg_get_query;

source /home/skt/work/db_patch/20140613_01.sql


######################################
2) LOAD DATA를 이용하는 방법
특징) 각 테이블별 데이터를 파일로 개별 생성해서 처리해야 함
######################################
step1) 파일로 저장하기
select * into outfile "/home/skt/work/db_patch/tb_pkg_get_query_20140613.dat" 
fields terminated by '\t' optionally enclosed by '"' lines terminated by '\n' 
from skt_meta.tb_pkg_get_query;

step2) 해당 파일 Remote에 복사

step3) 해당 파일 DB Load
my실행

truncate table skt_meta.tb_pkg_get_query;

LOAD DATA INFILE "/home/skt/work/db_patch/tb_pkg_get_query_20140613.dat" 
INTO TABLE skt_meta.tb_pkg_get_query FIELDS TERMINATED BY '\t' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\n';

