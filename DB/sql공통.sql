
//Pkg Data���� ���� ������ Ȯ��
SELECT *
FROM skt_meta.tb_pkg_data_collect_status
WHERE user_id = 'dev11';

SELECT *
FROM skt_meta.tb_run_script
WHERE req_id = '201405291538203015dev7';


//export query ���� ���� Ȯ�� ���
1.req_time ��ȸ
SELECT * FROM `tb_gui_inout_data`
WHERE user_id ='dev11';

2.req_time�Է� �� req_id ��ȸ
SELECT req_id, measdate, query_stmt FROM `tb_user_exp_sql`
WHERE req_time = '20150130131345'
limit 1;

3.������ Ȯ��
SELECT req_id,status FROM tb_run_script
WHERE req_id = '20150130131352382255'
AND STATUS != 'S';

//�ؼ���ǥ ���� ������ ���
1. ���� �������� ��� ��ȸ
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

2. �ؼ���ǥ ���� �۾� �ǽ� (STATUS = 9, tb_mng_exec_report�� �ش� req_id ����)
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

//db backup ���
######################################
1) Ư�� Table DUMP�� �̿��ϴ� ���
Ư¡) �ϳ��̻��� ���̺� �����͸� �ѹ��� ó���� �� �ֽ�
######################################
Step1) ���Ϸ� �����ϱ�
/mysql/pqms/mysql/bin/mysqldump -usktuser -psktuser000 -P3312 -h127.0.0.1 -S /tmp/pqms.sock --single-transaction --no-create-db --add-drop-table skt_meta \
tb_pkg_get_query \
> /home/skt/work/db_patch/20140613_01.sql

Step2) �ش� ���� Remote�� ����

Step3) �ش� ���� DB Load
my����

truncate table skt_meta.tb_pkg_get_query;

source /home/skt/work/db_patch/20140613_01.sql

��� 
$/mysql/skt/mysql/bin/mysqldump -usktuser -psktuser000 --all-databases > /home/skt/db_backup_all_dump.sql  // ������ �ִ� ��� ���� �� ��� ����
$/mysql/skt/mysql/bin/mysqldump -usktuser -psktuser000 --databases skt_meta > /home/skt/db_backup_skt_meta_dump.sql // Ư�� �����ͺ��̽����� �� ��� ����
$/mysql/skt/mysql/bin/mysqldump -usktuser -psktuser000 --databases skt_meta tb_pkg_get_query > /home/skt/db_backup_skt_meta_dump.sql // Ư�� �����ͺ��̽� ���� Ư�� ���̺��� �� ��� ����

���� 
2. mysql ������ �� : source dump.sql

/*
- ��Ÿ �ɼ�
-A, --all-databases : ��� DB ����
-B, --databases : Ư�� DB�� ����
--opt : ���۸��� ��Ȯ��ȭ �ϰ�, ���� �����͸� ������ �ִ� �ҷ��� SQL������ ����� ��ȿ�������� �����ϴٷ� �Ѵ�.
--allow-keywords, --quote-names : ���� ����ϴ� ���̺��� �����ϰ� ������ �� �ְ� �Ѵ�.
--lock-alltables : ���������� �ϰ��� ����� ���鵵�� "FLUSH TABLES WITH READ LOCK"�� ����Ѵ�. 
--tab : "SELECT INTO OUTFILE"�� ������ �����Ͽ�, ���� �� ���� �ӵ��� �ſ� ������.
-d, --no-data :  �����ʹ� �����ϰ� ��Ű���� ����
-t, --no-create-info : ��Ű���� �����ϰ� 
*/

######################################
2) LOAD DATA�� �̿��ϴ� ���
Ư¡) �� ���̺� �����͸� ���Ϸ� ���� �����ؼ� ó���ؾ� ��
######################################
step1) ���Ϸ� �����ϱ�
select * into outfile "/home/skt/data/event_req/USERID_ENB_CELLID_YYYYMMDDHH24MISS.csv" 
fields terminated by ',' optionally enclosed by '"' lines terminated by '\n' 
from skt_meta.tb_pkg_get_query;

step2) �ش� ���� Remote�� ����

step3) �ش� ���� DB Load
my����

truncate table skt_meta.tb_pkg_get_query;

LOAD DATA INFILE "/home/skt/work/db_patch/tb_pkg_get_query_20140613.csv" 
INTO TABLE skt_meta.tb_pkg_get_query 
fields terminated by ',' optionally enclosed by '"' lines terminated by '\n';
FIELDS TERMINATED BY '\t' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\n';



######################################
MATRIX DB ���� �� ó�� ����
######################################
1. Matrix.properties�� db ���� ����
2. MTXRPTY.java�� MTXRPTY.class ���ϻ���