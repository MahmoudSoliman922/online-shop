import React from 'react';
import logo from './logo.svg';
import './App.css';
import Table from './components/Table';

function App() {
  return (
    <div className='App'>
      <h3>Frontend Pagination</h3>
      <Table />
      <br />
      <div>
        <h3>Backend Pagination</h3>
      </div>
      <Table />
    </div>
  );
}

export default App;
