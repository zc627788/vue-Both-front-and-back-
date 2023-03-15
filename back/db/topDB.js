var pool = require('./pool');

module.exports = {

    //DAO层去查询借阅书籍排行榜
    async  findTop() {
        await pool.execute('set @t_student.username= 0')
        var sql = "select @t_student.username:=@t_student.username + 1 AS num,a.* from (SELECT t_student.Student_name ,t_student.Academy_name, COUNT(t_student.username) AS Total_num FROM  t_book_student   JOIN t_student ON t_student.username = t_book_student.username JOIN  t_book   ON t_book.Book_num = t_book_student.Book_num GROUP  BY t_student.Academy_name,t_student.Student_name) a";
        console.log('object :>> ', pool.execute(sql));
        return pool.execute(sql);
    },
}