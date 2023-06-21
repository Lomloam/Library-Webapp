import React from "react";
import { useState, useEffect } from "react";
import Sqltable from "./Sqltable";
import "../App.css";
import "../static/viewBooks.css";
import "../static/table.css";

const ReaderDetails = ({ returnFunc }) => {
  const [readerNo, setReaderNo] = useState(1);
  const [bookClubData, setBookClubData] = useState(null);
  const [booksCheckedOutData, setbooksCheckedOutData] = useState(null);
  const [finesData, setFinesData] = useState(null);
  const booksCheckedOutDataHeaders = [
    "Reader Number",
    "Copy Id",
    "Checkout Date",
    "Date Due",
    "ISBN",
    "Title",
  ];

  const bookClubHeaders = ["Library", "Librarian", "Class Name", "Meeting Day", "Member Count"];
  useEffect(() => {
    fetchBooksCheckedOutData();
    fetchBookClubData();
    fetchFinesData();
  }, []);

  const fetchBooksCheckedOutData = async () => {
    const result = await fetch("/getCheckedOut", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify([readerNo]),
    });
    const resultJson = await result.json();
    setbooksCheckedOutData(resultJson.result[0]);
  };

  const fetchBookClubData = async () => {
    const result = await fetch("/getBookClubsForReader", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify([readerNo]),
    });
    const resultJson = await result.json();
    setBookClubData(resultJson.result[0]);
  };

  const fetchFinesData = async () => {
    const result = await fetch("/getFinesForReader", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify([readerNo]),
    });
    const resultJson = await result.json();
    setFinesData(resultJson.result[0]);
  };

  const handleChange = (e) => {
    // setFormData({
    //   ...formData,
    //   [e.target.name]: e.target.value,
    // });

    setReaderNo(e.target.value);
  };

  const checkOut = async (event) => {
    event.preventDefault();
    fetchBooksCheckedOutData();
    fetchBookClubData();
    fetchFinesData();
  };

  return (
    <>
      <button
        onClick={() => returnFunc()}
        className="optionsButton"
        style={{ position: "absolute", top: "10px", left: "10px" }}
      >
        Return
      </button>
      <form onSubmit={checkOut}>
        <label>Reader Number</label> <br></br>
        <input
          type="number"
          placeholder="12345"
          id="readerNo"
          name="readerNo"
          value={readerNo}
          onChange={handleChange}
          pattern="[0-9]+"
          required
        ></input>
        <br></br>
        <input className="submitButton" type="submit" />
      </form>

      <h3 style={{ marginBottom: "10px" }}>Books Checked Out</h3>

      {!booksCheckedOutData ? (
        "d"
      ) : (
        <Sqltable data={booksCheckedOutData} tableHeaders={booksCheckedOutDataHeaders}></Sqltable>
      )}
      <h3 style={{ marginBottom: "10px" }}>Book Clubs</h3>

      {!bookClubData ? (
        "d"
      ) : (
        <Sqltable data={bookClubData} tableHeaders={bookClubHeaders}></Sqltable>
      )}

      <h3 style={{ marginBottom: "10px" }}>Fines</h3>

      {!finesData ? "d" : <Sqltable data={finesData} tableHeaders={["Fines($)"]}></Sqltable>}
    </>
  );
};

export default ReaderDetails;
