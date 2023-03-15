var pool = require("./pool");

module.exports = {
  // 查询所有借还记录
  findAll() {
    var sql =
      "select tb.Book_name,ts.Student_name,tbs.Id,tbs.Student_code,tbs.Book_num,tbs.borrow_date,tbs.return_date from t_book as tb,t_student as ts,t_book_student as tbs where tb.Book_num=tbs.Book_num and ts.username=tbs.username order by tbs.borrow_date desc";
    return pool.execute(sql);
  },
  // 学生查询借阅记录
  findRecords(name) {
    var sql =
      "select t_book_student.Book_num,Book_name,Student_name,borrow_date,return_date from t_book,t_student,t_book_student where t_book.Book_num=t_book_student.Book_num and t_student.username=t_book_student.username and t_book_student.username='" +
      name +
      "'";
    console.log(sql);
    return pool.execute(sql);
  },
  // 按书名模糊查询
  queryBook(keys) {
    //var sql="select * from t_book where Book_name like '%"+keys+"%' or Writer like '%"+keys+"%'";
    var sql =
      "select Book_name,Student_name,borrow_date,return_date from t_book,t_student,t_book_student where t_book.Book_num=t_book_student.Book_num and t_student.Student_code=t_book_student.Student_code and Book_name like '%" +
      keys +
      "%'";
    return pool.execute(sql);
  },
  // 按学生学号模糊查询
  queryStudent(keys) {
    var sql =
      "select Book_name,Student_name,borrow_date,return_date from t_book,t_student,t_book_student where t_book.Book_num=t_book_student.Book_num and t_student.Student_code=t_book_student.Student_code and Student_name like '%" +
      keys +
      "%' order by borrow_date desc";
    return pool.execute(sql);
  },
  // 管理员增加借还书记录
  /*save(book){
      var sql = "insert into t_book_student values(null,'"+book.Book_num+"','"
      +book.Student_code+"','"
      +book.borrow_date+"','"
      +book.return_date+"')";
      console.log(sql);
      return pool.execute(sql);
    },*/
  // 删除借还书记录
  deleteRecord(id) {
    var sql = "delete from t_book_student where ID='" + id + "'";
    console.log(sql);
    return pool.execute(sql);
  },
  // 学生增加借还书记录
  async save1(book) {
    console.log("book", book);

    var sql =
      "insert into t_book_student(Book_num,username,borrow_date,return_date) values('" +
      book.Book_num +
      "','" +
      book.username +
      "','" +
      book.borrow_date +
      "','" +
      book.return_date +
      "')";
    var sql3 = `select   money   FROM t_student  where username = ${book.username}`;
    const money = await pool.execute(sql3);
    if (money[0].money <= 0) {
      return [];
    }

    var sql2 = `update t_book set borrow = borrow + 1 where Book_num = ${book.Book_num}`;
    console.log("sql2 :>> ", sql2);
    await pool.execute(sql2);
    return pool.execute(sql);
  },
  // 修改借还书记录
  /*update(bookstudent){
      var sql="update t_book_student set return_date='"
      +bookstudent.return_date+"' where Id ="
      +bookstudent.Id;
      console.log(sql);
      return pool.execute(sql);
    },*/
  // 学生归还图书
  returnBook(id, name) {
    var sql =
      "delete from t_book_student where username='" +
      name +
      "' and Book_num='" +
      id +
      "'";
    console.log(sql);
    return pool.execute(sql);
  },
};
