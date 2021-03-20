21313# Library_System-master
### 前端使用的是VUE，后端使用的是express，数据库使用的是MySQL 图书管理系统
# 运行

## 1.先去把SQL文件在你的本地执行以下
## 2.cd 到 front目录下，然后执行 npm run dev 
## 3.cd 到backednpm start 



数据库报错:

### this is incompatible with sql_mode=only_full_group_by

### 在 mysql.ini文件 的[mysqld] 下加上  
### sql_mode=STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION