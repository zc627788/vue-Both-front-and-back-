### 																								VUE+Express+MySQL 图书管理系统
# 运行方式:

## 1.下载MySQL,先去把SQL文件导入到数据库中
## 2.cd 到 front目录下，然后执行 yarn dev 
## 3.cd 到backed yarn start 



数据库报错:

### this is incompatible with sql_mode=only_full_group_by

### 在 mysql.ini文件 的[mysqld] 下加上  
### sql_mode=STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION