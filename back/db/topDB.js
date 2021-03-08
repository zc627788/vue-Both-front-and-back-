var pool=require('./pool');

module.exports = {

        //DAO层去查询借阅书籍排行榜
        findTop(){
            var sql = "SELECT t_student.Academy_name,t_student.Student_name , COUNT(t_student.Student_name) AS Total_num FROM  t_book_student    JOIN t_student ON t_student.username = t_book_student.username JOIN  t_book   ON t_book.Book_num = t_book_student.Book_num GROUP  BY t_student.Student_name ";
            console.log('sql', sql)
            return pool.execute(sql);
          },
}