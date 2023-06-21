import React from "react";
import { useState } from "react";

const CheckInBook = ({ returnFunc }) => {
  const [formData, setFormData] = useState({});
  const handleChange = (e) => {
    setFormData({
      ...formData,
      [e.target.name]: e.target.value,
    });
  };

  const checkIn = async (event) => {
    event.preventDefault();
    const result = await fetch("/returnBook", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(formData),
    });
    const resultJson = await result.json();
    const response = Object.values(resultJson.message[0])[0];
    alert(response);
  };

  return (
    <>
    <button onClick={() => returnFunc()} 
    className="optionsButton" style={{position: "absolute", top: "10px", left:"10px"}}>Return</button>
    <form onSubmit={checkIn}>
      <label>Reader Name</label> <br></br>
      <input
        placeholder="Liam Kosar"
        type="text"
        id="name"
        name="name"
        value={formData.name}
        onChange={handleChange}
        required
      />
      <br></br>
      <label>Reader Email</label> <br></br>
      <input
        placeholder="lol@gmail.com"
        type="email"
        id="email"
        name="email"
        value={formData.email}
        onChange={handleChange}
        required
      />
      <br></br>
      <label>Copy Id</label> <br></br>
      <input
        type="number"
        placeholder="12345"
        id="copyId"
        name="copyId"
        value={formData.copyId}
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

export default CheckInBook;
