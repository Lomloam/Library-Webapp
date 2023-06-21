import React from "react";
import { useState, useEffect } from "react";
import Sqltable from "./Sqltable";
import "../App.css";
import "../static/viewBooks.css";
import "../static/table.css";

const BookReview = ({ returnFunc }) => {
  const [formData, setFormData] = useState({});
  const handleChange = (e) => {
    setFormData({
      ...formData,
      [e.target.name]: e.target.value,
    });
  };

  const submit = async (event) => {
    console.log(formData)
    event.preventDefault();
    const result = await fetch("/leaveReview", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(formData),
    });
    const resultJson = await result.json();
    const response = Object.values(resultJson.message[0])[0]
    alert(response);
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
      <form onSubmit={submit}>
        <label>Reader Number</label> <br></br>
        <input
          type="number"
          placeholder="12345"
          id="readerNo"
          name="readerNo"
          value={formData.readerNo}
          onChange={handleChange}
          pattern="[0-9]+"
          required
        ></input>
        <br></br>
        <label>Book ISBN</label> <br></br>
        <input
          type="number"
          placeholder="12345"
          id="isbn"
          name="isbn"
          value={formData.isbn}
          onChange={handleChange}
          pattern="[0-9]+"
          required
        ></input>
        <br></br>
        <label>Book Review</label> <br></br>
        <textarea
        rows={8}
        cols={50}
          type="text"
          placeholder="I liked ..."
          id="review"
          name="review"
          value={formData.review}
          onChange={handleChange}
         
          required
        ></textarea>
        <br></br>
        <input className="submitButton" type="submit" />
      </form>
    </>
  );
};

export default BookReview;
