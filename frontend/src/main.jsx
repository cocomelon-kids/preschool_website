import React from 'react';
import { createRoot } from 'react-dom/client';
import App from './App'; // Ensure you import the main App component
import Auth from './Auth'
import './index.css'; // Your CSS file

const root = createRoot(document.getElementById('root'));
root.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>
);

