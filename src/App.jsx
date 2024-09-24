import React from 'react';
import { BrowserRouter as Router, Routes, Route, useLocation } from 'react-router-dom';
import Navbar from './screens/Navbar.jsx';
import CoverPage from './screens/CoverPage.jsx';
import Curriculum from './screens/Curriculam.jsx';
import Admissions from './screens/Admissions.jsx';
import Activities from './screens/Activities.jsx';
import Contact from './screens/Contact.jsx';
import Enroll from './Auth.jsx';

function App() {
  const location = useLocation();

  // Check if the current path is for the enrollment page
  const isEnrollPage = location.pathname === '/enroll-now';

  return (
    <div className={isEnrollPage ? 'enroll-background' : ''}>
      {isEnrollPage && <div className="overlay"></div>}
      {location.pathname !== '/enroll-now' && <Navbar />}
      <Routes>
        <Route path="/" element={<CoverPage />} />
        <Route path="/curriculum" element={<Curriculum />} />
        <Route path="/admissions" element={<Admissions />} />
        <Route path="/activities" element={<Activities />} />
        <Route path="/contact" element={<Contact />} />
        <Route path="/enroll-now" element={<Enroll />} />
      </Routes>
    </div>
  );
}

function AppWrapper() {
  return (
    <Router>
      <App />
    </Router>
  );
}

export default AppWrapper;
