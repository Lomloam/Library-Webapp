import { useState } from "react";
import "../static/forms.css";
import "../App.css";

const RegisterNewReader = ({ returnFunc }) => {
  const [formData, setFormData] = useState({});

  const register = async (event) => {
    event.preventDefault();
    const result = await fetch("/registerReader", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(formData),
    });
    const resultJson = await result.json();
    alert(resultJson.message);
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

      <form onSubmit={register}>
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
        <label>Phone Number</label> <br></br>
        <input
          placeholder="1234567890"
          pattern="[0-9]{10}"
          maxlength="12"
          type="text"
          id="telephone"
          name="telephone"
          value={formData.telephone}
          onChange={handleChange}
          required
        />
        <br></br>
        <label>Street Number</label> <br></br>
        <input
          type="number"
          placeholder="12345"
          id="streetNo"
          name="streetNo"
          value={formData.streetNo}
          onChange={handleChange}
          pattern="[0-9]+"
          required
        ></input>
        <br></br>
        <label>Street Name</label> <br></br>
        <input
          type="text"
          placeholder="White Blvd"
          id="streetName"
          name="streetName"
          value={formData.streetName}
          onChange={handleChange}
          required
        ></input>
        <br></br>
        <label>State Abbreviation</label> <br></br>
        <input
          type="text"
          placeholder="MA"
          id="stateAbr"
          name="stateAbr"
          value={formData.stateAbr}
          onChange={handleChange}
          pattern="[A-Za-z]{2}"
          required
        ></input>
        <br></br>
        <label>Zipcode</label> <br></br>
        <input
          type="number"
          placeholder="98059"
          id="zip"
          name="zip"
          value={formData.zip}
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

export default RegisterNewReader;
