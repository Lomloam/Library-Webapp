import React from 'react'
import { useState, useEffect } from "react";
import Sqltable from "./Sqltable";
import "../App.css";
import "../static/viewBooks.css";
import "../static/table.css";

const SeeReviews = ({ returnFunc }) => {
  const [isbn, setIsbn] = useState(0);
  const [reviewData, setReviewData] = useState(null)
  const handleChange = (e) => {
    setIsbn(e.target.value);
  };

  useEffect(() => {
    fetchReviews();
  }, []);
  
  const fetchReviews = async () => {
    const result = await fetch("/getReviews", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify([isbn]),
    });
    const resultJson = await result.json();
    setReviewData(resultJson.result[0]);
  };

  const submit = async (event) => {
    event.preventDefault();
    fetchReviews();
  }
  return (
    <>
    <button
        onClick={() => returnFunc()}
        className="optionsButton"
        style={{ position: "absolute", top: "10px", left: "10px" }}
      >
        Return
      </button>
        <form onSubmit={submit} style={{margin: "20px", paddingTop: "100px"}}>
        <label>ISBN</label> <br></br>
        <input
          type="number"
          placeholder="12345"
          id="readerNo"
          name="readerNo"
          value={isbn}
          onChange={handleChange}
          pattern="[0-9]+"
          required
        ></input>
        <br></br>
        <input className="submitButton" type="submit" />
      </form>


      {!reviewData ? "Loading..." : <Sqltable data={reviewData} tableHeaders={["Reader Number", "Review"]}></Sqltable>}
    </>
  )
}

export default SeeReviews