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


######################################
2) LOAD DATA�� �̿��ϴ� ���
Ư¡) �� ���̺� �����͸� ���Ϸ� ���� �����ؼ� ó���ؾ� ��
######################################
step1) ���Ϸ� �����ϱ�
select * into outfile "/home/skt/work/db_patch/tb_pkg_get_query_20140613.dat" 
fields terminated by '\t' optionally enclosed by '"' lines terminated by '\n' 
from skt_meta.tb_pkg_get_query;

step2) �ش� ���� Remote�� ����

step3) �ش� ���� DB Load
my����

truncate table skt_meta.tb_pkg_get_query;

LOAD DATA INFILE "/home/skt/work/db_patch/tb_pkg_get_query_20140613.dat" 
INTO TABLE skt_meta.tb_pkg_get_query FIELDS TERMINATED BY '\t' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\n';

