var pool=require('./pool');

module.exports={
    // 查找用户名
    select_name(name) {
        var sql= 'select * from user where username ="'+name+'" ';
        return pool.execute(sql);
    },
    // 注册
    insert_user(name,pass) {
        var sql= 'insert into user values("'+name+'","'+pass+'")';
        return pool.execute(sql);
    },
    // 添加学生信息
    insert_student(student) {
        var sql="insert into t_student (Student_code,Student_name,Academy_name,Class_name,Sex,Email,username) values('"+student.Student_code+"','"
        +student.Student_name+"','"
        +student.Academy_name+"','"
        +student.Class_name+"','"
        +student.Sex+"','"
        +student.Email+"','"
        +student.Student_code+"')";
        console.log('object', sql)
        return pool.execute(sql);
    } 
}