import React from "react";
import { useState } from "react";
import "../static/forms.css";

const CheckOutBook = ({ returnFunc }) => {
  const [formData, setFormData] = useState({});
  const handleChange = (e) => {
    setFormData({
      ...formData,
      [e.target.name]: e.target.value,
    });
  };

  const checkOut = async (event) => {
    event.preventDefault();
    const result = await fetch("/checkOutBook", {
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
    <button onClick={() => returnFunc()} 
    className="optionsButton" style={{position: "absolute", top: "10px", left:"10px"}}>Return</button>
    <form onSubmit={checkOut}>
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
      <label>Library</label> <br></br>
      <input
        type="text"
        placeholder="Central Library"
        id="library"
        name="library"
        value={formData.library}
        onChange={handleChange}
    
        required
      ></input>
      <br></br>
      <input className="submitButton" type="submit" />
    </form>
    </>
  );
};

export default CheckOutBook;
