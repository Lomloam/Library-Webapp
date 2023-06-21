import React from "react";
import { useState, useEffect } from "react";
import Sqltable from "./Sqltable";
import "../App.css";
import "../static/viewBooks.css";
import "../static/table.css";

const ViewBooks = ({ returnFunc }) => {
  const [data, setData] = useState(null);
  const tableHeaders = [
    "ISBN",
    "Title",
    "Genre",
    "Reading Level",
    "Publisher",
    "Description",
    "Copies",
    "Copies Available",
    "Authors",
  ];
  const [genre, setGenre] = useState("any");
  const [readingLevel, setReadingLevel] = useState("any");

  useEffect(() => {
    fetchData(genre, readingLevel);
  });
  const fetchData = async () => {
    const result = await fetch("/getBooks", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify([genre, readingLevel]),
    });
    const resultJson = await result.json();
    setData(resultJson.result[0]);
  };

  const changeGenre = async (newGenre) => {
    setGenre(newGenre);
    fetchData();
  };
  const changeReadingLevel = async (newLevel) => {
    setReadingLevel(newLevel);
    fetchData();
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
      <h3>Genre</h3>
      <div className="options_button_books">
        <button
          onClick={() => changeGenre("Any")}
          className="optionsButton smallFont"
          style={{ width: "80px", height: "30px" }}
        >
          Any
        </button>
        <button
          onClick={() => changeGenre("Fiction")}
          className="optionsButton smallFont"
          style={{ width: "80px", height: "30px" }}
        >
          Fiction
        </button>
        <button
          onClick={() => changeGenre("Non-Fiction")}
          className="optionsButton smallFont"
          style={{ width: "80px", height: "30px" }}
        >
          NonFic
        </button>
        <button
          onClick={() => changeGenre("Mystery")}
          className="optionsButton smallFont"
          style={{ width: "80px", height: "30px" }}
        >
          Mystery
        </button>
        <button
          onClick={() => changeGenre("Science Fiction")}
          className="optionsButton smallFont"
          style={{ width: "80px", height: "30px" }}
        >
          SciFi
        </button>
        <button
          onClick={() => changeGenre("Fantasy")}
          className="optionsButton smallFont"
          style={{ width: "80px", height: "30px" }}
        >
          Fantasy
        </button>
        <button
          onClick={() => changeGenre("Romance")}
          className="optionsButton smallFont"
          style={{ width: "80px", height: "30px" }}
        >
          Romance
        </button>
        <button
          onClick={() => changeGenre("Horror")}
          className="optionsButton smallFont"
          style={{ width: "80px", height: "30px" }}
        >
          Horror
        </button>
        <button
          onClick={() => changeGenre("Thriller")}
          className="optionsButton smallFont"
          style={{ width: "80px", height: "30px" }}
        >
          Thriller
        </button>
        <button
          onClick={() => changeGenre("Historical Fiction")}
          className="optionsButton smallFont"
          style={{ width: "80px", height: "30px" }}
        >
          Hist Fic
        </button>
        <button
          onClick={() => changeGenre("Biography")}
          className="optionsButton smallFont"
          style={{ width: "80px", height: "30px" }}
        >
          Biography
        </button>
      </div>

      <h3>Reading Level</h3>

      <div className="options_button_books">
        <button
          onClick={() => changeReadingLevel("Any")}
          className="optionsButton smallFont"
          style={{ width: "80px", height: "30px" }}
        >
          Any
        </button>
        <button
          onClick={() => changeReadingLevel("Childrens")}
          className="optionsButton smallFont"
          style={{ width: "80px", height: "30px" }}
        >
          Children's
        </button>
        <button
          onClick={() => changeReadingLevel("Beginner")}
          className="optionsButton smallFont"
          style={{ width: "80px", height: "30px" }}
        >
          Beginner
        </button>
        <button
          onClick={() => changeReadingLevel("Intermediate")}
          className="optionsButton smallFont"
          style={{ width: "80px", height: "30px" }}
        >
          Intermediate
        </button>
        <button
          onClick={() => changeReadingLevel("Hard")}
          className="optionsButton smallFont"
          style={{ width: "80px", height: "30px" }}
        >
          Hard
        </button>
        <button
          onClick={() => changeReadingLevel("Expert")}
          className="optionsButton smallFont"
          style={{ width: "80px", height: "30px" }}
        >
          Expert
        </button>
      </div>
      {!data ? "d" : <Sqltable data={data} tableHeaders={tableHeaders}></Sqltable>}
    </>
  );
};

export default ViewBooks;
