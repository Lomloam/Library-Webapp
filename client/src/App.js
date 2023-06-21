import "./App.css";
import CheckInBook from "./components/CheckInBook";
import CheckOutBook from "./components/CheckOutBook";
import RegisterNewReader from "./components/RegisterNewReader";
import { useState, useEffect } from "react";
import ViewBooks from "./components/ViewBooks";
import ReaderDetails from "./components/ReaderDetails";
import BookReview from "./components/BookReview";
import SeeReviews from "./components/SeeReviews";
import RemoveReader from "./components/RemoveReader";

function App() {
  const [inner, setInner] = useState(<></>);
  useEffect(() => {
    setInner(
      <div className="App">
        <div className="mass_button_div">
          <button onClick={() => registerNewReader()} className="optionsButton">
            Register New Reader
          </button>
          <button onClick={() => checkOutBook()} className="optionsButton">Check Out Book</button>
          <button onClick={() => checkInBook()} className="optionsButton">Check In Book</button>
          <button onClick={() => viewBooks()} className="optionsButton">View Books</button>
          <button onClick={() => readerDetails()} className="optionsButton">Reader Details</button>
          <button onClick={() => bookReview()} className="optionsButton">Write Review</button>
          <button onClick={() => seeReview()} className="optionsButton">See Reviews</button>
          <button onClick={() => removeReader()} className="optionsButton">
            Remove Reader
          </button>
        </div>
      </div>
    );
  }, []);
 
 const refreshInner = async () => {
  setInner(
      <div className="App">
        <div className="mass_button_div">
          <button onClick={() => registerNewReader()} className="optionsButton">
            Register New Reader
          </button>
          <button onClick={() => checkOutBook()} className="optionsButton">Check Out Book</button>
          <button onClick={() => checkInBook()} className="optionsButton">Check In Book</button>
          <button onClick={() => viewBooks()} className="optionsButton">View Books</button>
          <button onClick={() => readerDetails()} className="optionsButton">Reader Details</button>
          <button onClick={() => bookReview()} className="optionsButton">Write Review</button>
          <button onClick={() => seeReview()} className="optionsButton">See Reviews</button>
          <button onClick={() => removeReader()} className="optionsButton">
            Remove Reader
          </button>

        </div>
      </div>
    );
 }
 const readerDetails = async () => {
  setInner(<ReaderDetails returnFunc={refreshInner}></ReaderDetails>)
};
  const registerNewReader = async () => {
    setInner(<RegisterNewReader returnFunc={refreshInner}></RegisterNewReader>);
  };
  const checkOutBook = async () => {
    setInner(<CheckOutBook returnFunc={refreshInner}></CheckOutBook>)
  };
  const checkInBook = async () => {
    setInner(<CheckInBook returnFunc={refreshInner}></CheckInBook>)
  };
  const viewBooks = async () => {
    setInner(<ViewBooks returnFunc={refreshInner}></ViewBooks>)
  };
  const bookReview = async () => {
    setInner(<BookReview returnFunc={refreshInner}></BookReview>)
  };
  const seeReview = async () => {
    setInner(<SeeReviews returnFunc={refreshInner}></SeeReviews>)
  };
  const removeReader = async () => {
    setInner(<RemoveReader returnFunc={refreshInner}></RemoveReader>)
  };

  return (
    inner
  );
}

export default App;
