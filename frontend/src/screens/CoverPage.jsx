import React from 'react';
import './CoverPage.css';
import coverImage from '../assets/cover.png';

const CoverPage = () => {
  return (
    <div className="cover-container">
      <div className="cover-image">
        <img src={coverImage} alt="Cocomelon Preschool & Day Care" className="cover" />
      </div>
      <div className="contact-info">
        <h1>COCOMELON</h1>
        <h2>Pre School & Day Care</h2>
        <div className='info'><p>51-8, 57/2, 60 Feet road, Eenadu, Nakkavanipalem,<br /> Visakhapatnam, Andhra Pradesh 530013</p>
        <p><strong>Contact:</strong></p>
        <p>+91 6302164335<br />+91 7659011189</p>
        <p><strong>Timings:</strong> 9:30 am to 12:30 pm</p>
        </div>
      </div>
      <div className="about-us">
        <h2>ABOUT US</h2>
        <p>
          At Cocomelon Preschool & Day Care, we provide a safe and nurturing 
          environment where children can learn, play, and grow. Join us in building 
          a strong foundation for your child’s future.
        </p>
      </div>
      {/* Enroll Button Section */}
      <div className="enroll-section">
        <a href="#enroll" className="enroll-butn">Enroll Now</a>
      </div>
    </div>
  );
};

export default CoverPage;

