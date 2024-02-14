import React from "react";
import "./style.css";
import commonData from "../../common.json";
import Box from "@mui/material/Box";
import TextField from "@mui/material/TextField";
import {useNavigate} from 'react-router-dom';

const Hrms = () => {
  const navigate = useNavigate();
  const navigateform = () =>{
    navigate('/Dashboard/Hrms/Form');
  }
  
  return (
    <div className="container mt-5">
      <div className="row">
        <div className="col-md-1"></div>
        <div className="col-md-5 hrms-left-banner">
          <img src={`${commonData?.BASEURL}/src/assets/hrms-login-image.png`} />
        </div>
        <div className="col-md-5 hrms-left-banner-1">
          <div className="card">
            <div className="card-header-1 pt-3">
              <h2 className=" text-center">Login</h2>
            </div>
            <div className="google-login text-center mt-5">
              {/* <p> */}
                <a href="#">
                  Sign in with Google{" "}
                  <img
                    src={`${commonData?.BASEURL}/src/assets/google-icon.png`}
                    width={30}
                  />
                </a>
              {/* </p> */}
            </div>

            <div className="card-body">
              <form className="text-center">
                <div className="">
                  <Box className="p-0"
                    component="form"
                   
                    sx={{
                      "& > :not(style)": { m: 1, width: "85%" },
                      '& .MuiOutlinedInput-root': {
                        borderRadius: "15px", // Set the desired border radius
                        backgroundColor: 'white', // Set the background color to white
                      },
                    }}
                    noValidate
                    autoComplete="off"
                  >
                    <TextField
                      id="standard-basic"
                      label="Enter Your UserName"
                      variant="outlined"
                    />
                  </Box>
                  {/* <input type="text" className="form-control" id="firstName" placeholder=" Enter Your UserName" /> */}
                </div>

                <div className="">
                  <Box className="p-0"
                    component="form"
                    sx={{
                      "& > :not(style)": { m: 1, width: "85%" },
                      '& .MuiOutlinedInput-root': {
                        borderRadius: "15px", 
                        backgroundColor: 'white', 
                      },
                    }}
                    noValidate
                    autoComplete="off"
                  >
                    <TextField
                      id="standard-basic"
                      label="Enter your password"
                      variant="outlined"
                    />
                  </Box>
                  {/* <input
                    type="password"
                    className="form-control"
                    id="password"
                    placeholder="Enter your password"
                  /> */}
                </div>
                <div className="hrms-form-submit-button">
                  <button type="submit" className="btn hrms-submit-button" onClick={navigateform}>
                    Login
                  </button>
                </div>
                <div className="hrms-form-icons">
                  <i class="bi bi-facebook"></i>
                  <i class="bi bi-twitter"></i>
                  <i class="bi bi-linkedin"></i>
                  <i class="bi bi-whatsapp"></i>
                </div>
              </form>
            </div>
          </div>
        </div>
        <div className="col-md-1"></div>
        {/* <Car /> */}
      </div>
    </div>
  );
};

export default Hrms;
