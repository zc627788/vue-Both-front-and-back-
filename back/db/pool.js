require('babel-polyfill');
var mysql = require('mysql');
//建立连接池
var pool = mysql.createPool({
    host: 'localhost',
    user: 'root',
    password: '123456',
    database: 'expressdb',
    acquireTimeout: 15000, // 连接超时时间
    connectionLimit: 10000, // 最大连接数
    waitForConnections: true, // 超过最大连接时排队
    queueLimit: 0, // 排队最大数量(0 代表不做限制)

});
function getConnection() {
    return new Promise(function (resolve, reject) {
        pool.getConnection(function (err, conn) {
            if (!err) {
                resolve(conn);
            } else {
                reject(err);
            }
        });
    })
}
//执行sql
function execute(sql) {
    return new Promise(function (resolve, reject) {
        var connection;
        getConnection().then(function (conn) {
            conn.query(sql, function (err, result) {
                if (!err) {
                    resolve(result);
                    conn.release();
                    console.log("释放完成");
                } else {
                    reject(err);
                }
            });
        }).catch(function (err) {
            reject(err)
        })
    });
}
module.exports = {
    getConnection,
    execute
};