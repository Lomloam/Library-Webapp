import { useState } from "react";
import "../static/forms.css";
import "../App.css";

const RemoveReader = ({returnFunc}) => {
  const [formData, setFormData] = useState({});

  const remove = async (event) => {
    event.preventDefault();
    const result = await fetch("/removeReader", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(formData),
    });
    const resultJson = await result.json();
    const response = Object.values(resultJson.message[0])[0]
    alert(response);
  };

  const handleChange = (e) => {
    setFormData({
      ...formData,
      [e.target.name]: e.target.value,
    });
  };

  return (
    <>
        <button onClick={() => returnFunc()} 
    className="optionsButton" style={{position: "absolute", top: "10px", left:"10px"}}>Return</button>

<form onSubmit={remove}>
        <label>Full Name</label> <br></br>
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
        <label>Email</label> <br></br>
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
        <input className="submitButton" type="submit" />
      </form>

    </>


  );
};

export default RemoveReader;
