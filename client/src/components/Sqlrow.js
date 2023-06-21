import React from 'react'
import Sqldata from './Sqldata'
import '../static/table.css'
const Sqlrow = ({ data }) => {
  return (
    <tr>
        {Object.values(data).map((column) => (
          <Sqldata data ={column}></Sqldata>
        ))}

    </tr>
  )
}

export default Sqlrow