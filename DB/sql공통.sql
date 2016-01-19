
//Pkg Data저장 쿼리 수행결과 확인
SELECT *
FROM skt_meta.tb_pkg_data_collect_status
WHERE user_id = 'dev11';

SELECT *
FROM skt_meta.tb_run_script
WHERE req_id = '201405291538203015dev7';


//export query 정상 동작 확인 방법
1.req_time 조회
SELECT * FROM `tb_gui_inout_data`
WHERE user_id ='dev11';

2.req_time입력 후 req_id 조회
SELECT req_id, measdate, query_stmt FROM `tb_user_exp_sql`
WHERE req_time = '20150130131345'
limit 1;

3.쿼리문 확인
SELECT req_id,status FROM tb_run_script
WHERE req_id = '20150130131352382255'
AND STATUS != 'S';

//해석장표 수동 재집계 방법
1. 수동 재집계할 목록 조회
SELECT * FROM tb_gui_req_report
WHERE req_id >= 34156
AND server_id = 1;
SELECT * FROM tb_gui_req_report_list
WHERE req_id >= 34156
AND req_id IN(SELECT req_id FROM tb_gui_req_report
WHERE req_id >= 34156
AND server_id = 1);
SELECT * FROM tb_mng_exec_report
WHERE req_id >= 34156
AND req_id IN(SELECT req_id FROM tb_gui_req_report
WHERE req_id >= 34156
AND server_id = 1);
SELECT * FROM tb_mng_report_server
WHERE req_id >= 34156
AND req_id IN(SELECT req_id FROM tb_gui_req_report
WHERE req_id >= 34156
AND server_id = 1);

2. 해석장표 수동 작업 실시 (STATUS = 9, tb_mng_exec_report에 해당 req_id 삭제)
UPDATE tb_gui_req_report_list SET STATUS = 9
WHERE req_id >= 34156
AND req_id IN(SELECT req_id FROM tb_gui_req_report
WHERE req_id >= 34156
AND server_id = 1);

DELETE FROM tb_mng_exec_report
WHERE req_id >= 34156
AND req_id IN(SELECT req_id FROM tb_gui_req_report
WHERE req_id >= 34156
AND server_id = 1);

//db backup 방법
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

백업 
$/mysql/skt/mysql/bin/mysqldump -usktuser -psktuser000 --all-databases > /home/skt/db_backup_all_dump.sql  // 서버에 있는 모든 것의 논리 백업 생성
$/mysql/skt/mysql/bin/mysqldump -usktuser -psktuser000 --databases skt_meta > /home/skt/db_backup_skt_meta_dump.sql // 특정 데이터베이스만의 논리 백업 생성
$/mysql/skt/mysql/bin/mysqldump -usktuser -psktuser000 --databases skt_meta tb_pkg_get_query > /home/skt/db_backup_skt_meta_dump.sql // 특정 데이터베이스 내의 특정 테이블의 논리 백업 생성

복원 
2. mysql 접속한 후 : source dump.sql

/*
- 기타 옵션
-A, --all-databases : 모든 DB 덤프
-B, --databases : 특정 DB를 덤프
--opt : 버퍼링을 비확성화 하고, 많은 데이터를 덤프에 있는 소량의 SQL구문에 기록해 더효율적으로 동작하다록 한다.
--allow-keywords, --quote-names : 예약어를 사용하는 테이블을 덤프하고 복원할 수 있게 한다.
--lock-alltables : 전역적으로 일관된 백업을 만들도록 "FLUSH TABLES WITH READ LOCK"을 사용한다. 
--tab : "SELECT INTO OUTFILE"로 파일을 덤프하여, 덤프 및 복원 속도가 매우 빠르다.
-d, --no-data :  데이터는 제외하고 스키마만 덤프
-t, --no-create-info : 스키마는 제외하고 
*/

######################################
2) LOAD DATA를 이용하는 방법
특징) 각 테이블별 데이터를 파일로 개별 생성해서 처리해야 함
######################################
step1) 파일로 저장하기
select * into outfile "/home/skt/data/event_req/USERID_ENB_CELLID_YYYYMMDDHH24MISS.csv" 
fields terminated by ',' optionally enclosed by '"' lines terminated by '\n' 
from skt_meta.tb_pkg_get_query;

step2) 해당 파일 Remote에 복사

step3) 해당 파일 DB Load
my실행

truncate table skt_meta.tb_pkg_get_query;

LOAD DATA INFILE "/home/skt/work/db_patch/tb_pkg_get_query_20140613.csv" 
INTO TABLE skt_meta.tb_pkg_get_query 
fields terminated by ',' optionally enclosed by '"' lines terminated by '\n';
FIELDS TERMINATED BY '\t' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\n';



######################################
MATRIX DB 변경 시 처리 사항
######################################
1. Matrix.properties에 db 정보 변경
2. MTXRPTY.java와 MTXRPTY.class 파일삭제