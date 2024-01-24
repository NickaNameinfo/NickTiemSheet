import React, { useState } from "react";
import "./style.css";
import axios from "axios";
import { useNavigate } from "react-router-dom";
import { Box, Button, TextField } from "@mui/material";
import { Controller, useForm } from "react-hook-form";
import commonData from "../common.json";
function Login() {
  const {
    handleSubmit,
    control,
    formState: { errors },
  } = useForm();
  const navigate = useNavigate();
  axios.defaults.withCredentials = true;
  const [error, setError] = useState("");
  const [roles, setRoles] = React.useState(null);

  console.log(commonData, "data1223423");
  const Submit = (data) => {
    console.log(commonData, "data1223423");

    axios
      .post(`${commonData?.APIKEY}/employeelogin`, data, {
        withCredentials: true,
      })
      .then((res) => {
        localStorage.setItem("token", res?.data.tokensss);
        if (res.status === 200) {
          axios
            .post(`${commonData?.APIKEY}/dashboard`, res?.data)
            .then((ress) => {
              console.log(ress, "ressressress");
              setRoles(ress.data.role?.split(","));
            });
        } else {
          setError(res.data.Error);
        }
      })
      .catch((err) => {
        if (err.response?.status === 401) {
          setError("User Name or Password is incorrect.");
        }
      });
  };

  React.useEffect(() => {
    if (roles?.includes("Admin")) {
      navigate("/Dashboard/EmployeeHome");
    } else if (roles?.includes("TL")) {
      navigate("/Dashboard/EmployeeHome");
    } else if (roles?.includes("Employee")) {
      navigate("/Dashboard/EmployeeHome");
    } else if (roles?.includes("HR")) {
      navigate("/Dashboard/EmployeeHome");
    }
  }, [roles]);

  return (
    <div className="d-flex justify-content-center align-items-center loginPage log">
      <div className="logn-design">
        {/* <svg
          xmlns="http://www.w3.org/2000/svg"
          width="50"
          height="50"
          fill="#fff"
          class="bi bi-person-circle"
          viewBox="0 0 16 16"
        >
          <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0" />
          <path
            fill-rule="evenodd"
            d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8m8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1"
          />
        </svg> */}
        <form onSubmit={handleSubmit(Submit)} className="loginform">
          <div className="mb-3">
            <Controller
              control={control}
              name="userName"
              rules={{ required: "UserName is required." }}
              render={({ field }) => (
                <Box>
                  <TextField
                    fullWidth
                    id="outlined-basic fullWidth"
                    placeholder="User Name"
                    // variant="outlined"
                    className=" textfield"
                    type="text"
                    {...field}
                    error={Boolean(errors.userName)}
                    helperText={errors.userName && errors.userName.message}
                    sx={{
                      '& .MuiOutlinedInput-root': {
                        borderRadius: 5, // Set the desired border radius
                        backgroundColor: 'white', // Set the background color to white
                      },
                    }}
                  />
                </Box>
              )}
            />
          </div>
          <div className="mb-3">
            <Controller
              control={control}
              name="password"
              rules={{ required: "password is Reqiured." }}
              render={({ field }) => (
                <Box sx={{}}>
                <TextField
                  fullWidth
                  id="outlined-basic fullWidth"
                  placeholder="Enter password"
                  variant="outlined"
                  className="  "
                  type="password"
                  {...field}
                  error={Boolean(errors.password)}
                  helperText={errors.password && errors.password.message}
                  sx={{
                    '& .MuiOutlinedInput-root': {
                      borderRadius: 5, // Set the desired border radius
                      backgroundColor: 'white', // Set the background color to white
                    },
                  }}
                />
              </Box>
              )}
            />
          </div>
          <small className="text-danger mb-2 d-flex justify-content-center align-items-center">
            {error && error}
          </small>

          <Button
            variant="contained"
            type="submit"
            className=" lognbtn  w-100 "
          >
            Log in
          </Button>
        </form>
      </div>
    </div>
  );
}

export default Login;
