import React from "react";
import Sqlrow from "./Sqlrow";
import '../static/table.css'

const Sqltable = ({ data, tableHeaders }) => {
 
  
  return (
    <table>
      <tr>
        {tableHeaders.map((header) => (
          <th>{header}</th>
        ))} 
      </tr>
      {data.map((row) => (
        <Sqlrow data={row}></Sqlrow>
      ))}
    </table>
  );
};

export default Sqltable;
