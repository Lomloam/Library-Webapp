const express = require("express");
const bodyParser = require("body-parser");
const mysql = require("mysql");
const password = "";
const PORT = process.env.PORT || 3001;

const app = express();
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.listen(PORT, () => {
  console.log(`Server listening on ${PORT}`);
});

app.post("/submit", (req, res) => {
  const data = req.body;
  console.log(data);
  res.json({ message: "meow" });
});

var con = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: password,
  database: "coollibrarysystem",
});

con.connect(function (err) {
  if (err) throw err;
  console.log("Successful connection");
});

app.post("/getBooks", (req, res) => {
  const data = req.body;
  const sql = "call get_books(?, ?)";
  con.query(sql, [data[0], data[1]], function (err, result, fields) {
    if (err) throw err;
    res.json({ result });
  });
});

//parseInt(data.telephone.split(" ").join(""))

app.post("/registerReader", (req, res) => {
  const data = req.body;
  var sql = "call register_new_user(?, ?, ?, ?, ?, ?, ?)";
  con.query(
    sql,
    [
      data.name,
      data.email,
      data.telephone,
      data.streetNo,
      data.streetName,
      data.stateAbr,
      data.zip,
    ],
    (error, result, fields) => {
      if (error) {
        return console.error(error.message);
      }
      // console.log({result})
      res.json({ message: result[0][0].message });
    }
  );
});

app.post("/removeReader", (req, res) => {
  const data = req.body;
  var sql = "select remove_reader(?, ?, ?)";
  con.query(sql, [data.name, data.email, data.readerNo], (error, result, fields) => {
    if (error) {
      return console.error(error.message);
    }
    // console.log({result})
    res.json({ message: result });
  });
});

app.post("/checkOutBook", (req, res) => {
  const data = req.body;
  var sql = "select check_out_book(?, ?, ?)";
  const returnValue = "";
  con.query(sql, [data.readerNo, data.isbn, data.library], (error, result, fields) => {
    if (error) {
      return console.error(error.message);
    }
    // console.log({result})
    res.json({ message: result });
  });
});

app.post("/leaveReview", (req, res) => {
  const data = req.body;
  var sql = "select create_book_review(?, ?, ?)";
  const returnValue = "";
  con.query(sql, [data.readerNo, data.isbn, data.review], (error, result, fields) => {
    if (error) {
      return console.error(error.message);
    }
    res.json({ message: result });
  });
});

app.post("/returnBook", (req, res) => {
  const data = req.body;
  var sql = "select return_book(?, ?, ?, ?)";
  con.query(sql, [data.name, data.email, data.copyId, data.library], (error, result, fields) => {
    if (error) {
      return console.error(error.message);
    }
    res.json({ message: result });
  });
});

app.post("/getCheckedOut", (req, res) => {
  const data = req.body;
  const sql = "call get_books_checked_out(?)";
  con.query(sql, [data[0]], function (err, result, fields) {
    if (err) throw err;
    res.json({ result });
  });
});

app.post("/getBookClubsForReader", (req, res) => {
  const data = req.body;
  const sql = "call get_classes(?)";
  con.query(sql, [data[0]], function (err, result, fields) {
    if (err) throw err;
    res.json({ result });
  });
});

app.post("/getFinesForReader", (req, res) => {
  const data = req.body;
  const sql = "call get_fines(?)";
  con.query(sql, [data[0]], function (err, result, fields) {
    if (err) throw err;
    res.json({ result });
  });
});

app.post("/getReviews", (req, res) => {
  const data = req.body;
  const sql = "call get_reviews(?)";
  con.query(sql, [data[0]], function (err, result, fields) {
    if (err) throw err;
    res.json({ result });
  });
});
