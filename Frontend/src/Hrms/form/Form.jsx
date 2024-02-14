import React from "react";
import { styled } from "@mui/material/styles";
import {
  Box,
  Button,
  TextField,
  InputLabel,
  MenuItem,
  FormControl,
  // Select
} from "@mui/material";
import { AdapterDayjs } from "@mui/x-date-pickers/AdapterDayjs";
import { LocalizationProvider } from "@mui/x-date-pickers/LocalizationProvider";
import { DatePicker } from "@mui/x-date-pickers/DatePicker";
import Select from "@mui/material/Select";
import { useNavigate } from "react-router-dom";

const VisuallyHiddenInput = styled("input")({
  clip: "rect(0 0 0 0)",
  clipPath: "inset(50%)",
  height: 1,
  overflow: "hidden",
  position: "absolute",
  bottom: 0,
  left: 0,
  whiteSpace: "nowrap",
  width: 100,
});

export default function Form() {
  const [age, setAge] = React.useState("");

  const navigate = useNavigate();
  const handlenave = () => {
    navigate("/Dashboard/Hrms/FormDatalist");
  };

  const handleChange = (event) => {
    setAge(event.target.value);
  };

  return (
    <div className="formInput">
      <form action="">
        <div className="row">
          <div className="col-sm-6">
            <Box
              className="p-0"
              component="form"
              sx={{
                "& > :not(style)": { m: 1, width: "85%" },
                "& .MuiOutlinedInput-root": {
                  borderRadius: "12PX", // Set the desired border radius
                  backgroundColor: "white", // Set the background color to white
                },
              }}
              noValidate
              autoComplete="off"
            >
              <TextField
                id="standard-basic"
                label="Enter Your Email"
                variant="outlined"
              />
            </Box>
          </div>
          <div className="col-sm-6">
            <Box
              className="p-0"
              component="form"
              sx={{
                "& > :not(style)": { m: 1, width: "85%" },
                "& .MuiOutlinedInput-root": {
                  borderRadius: "12PX", // Set the desired border radius
                  backgroundColor: "white", // Set the background color to white
                },
              }}
              noValidate
              autoComplete="off"
            >
              <TextField
                id="standard-basic"
                label="Enter Your Phone"
                variant="outlined"
              />
            </Box>
          </div>
          <div className="col-sm-6">
            <Box
              className="p-0"
              component="form"
              sx={{
                "& > :not(style)": { m: 1, width: "85%" },
                "& .MuiOutlinedInput-root": {
                  borderRadius: "12PX", // Set the desired border radius
                  backgroundColor: "white", // Set the background color to white
                },
              }}
              noValidate
              autoComplete="off"
            >
              <TextField
                id="standard-basic"
                label="Enter Your Emp No
                "
                variant="outlined"
              />
            </Box>
          </div>
          <div className="col-sm-6">
            <Button
              component="label"
              role={undefined}
              variant="contained"
              tabIndex={-1}
              fullWidth
              sx={{
                width: "85%",
                padding: "15px",
                marginTop: "15px",
                marginLeft: "8px",
                background: "white",
                color: "#00000099",
                fontWeight: "500",
                borderRadius: "12px",
              }}
            >
              Upload file
              <VisuallyHiddenInput type="file" />
            </Button>
          </div>
          <div className="col-sm-6">
            <LocalizationProvider dateAdapter={AdapterDayjs}>
              {/* <DemoItem label="" className="kapil"> */}
              <DatePicker
                label="Date Picker"
                slotProps={{ textField: { size: "Large" } }}
                fullWidth
                sx={{
                  width: "85%",
                  borderRadius: "12PX",
                  "& .MuiStack-root": {
                    marginTop: "18px", // Apply border radius to the input field
                  },
                }}
              />
              {/* </DemoItem> */}
            </LocalizationProvider>
          </div>
          <div className="col-sm-6">
            <Box
              className="p-0"
              component="form"
              sx={{
                "& > :not(style)": { m: 1, width: "85%" },
                "& .MuiOutlinedInput-root": {
                  borderRadius: "12PX", // Set the desired border radius
                  backgroundColor: "white", // Set the background color to white
                },
              }}
              noValidate
              autoComplete="off"
            >
              <TextField
                id="standard-basic"
                label="Enter Your Work Email"
                variant="outlined"
              />
            </Box>
          </div>
          <div className="col-sm-6">
            <Box
              className="p-0"
              component="form"
              sx={{
                "& > :not(style)": { m: 1, width: "85%" },
                "& .MuiOutlinedInput-root": {
                  borderRadius: "12PX", // Set the desired border radius
                  backgroundColor: "white", // Set the background color to white
                },
              }}
              noValidate
              autoComplete="off"
            >
              <TextField
                id="standard-basic"
                label="Enter Your Address"
                variant="outlined"
              />
            </Box>
          </div>
          <div className="col-sm-6">
            <Box
              className="p-0"
              component="form"
              sx={{
                "& > :not(style)": { m: 1, width: "85%" },
                "& .MuiOutlinedInput-root": {
                  borderRadius: "12PX", // Set the desired border radius
                  backgroundColor: "white", // Set the background color to white
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
          </div>
          <div className="col-sm-6">
            <Box
              sx={{
                width: "85%",
                marginLeft: "7px",
                borderRadius: "12px",
                marginTop: "12px",
                margin: "0 auto",
                paddingTop: "14px",
              }}
            >
              <FormControl fullWidth>
                <InputLabel id="demo-simple-select-label">
                  dropdown list
                </InputLabel>
                <Select
                  labelId="demo-simple-select-label"
                  id="demo-simple-select"
                  value={age}
                  label="dropdown list"
                  onChange={handleChange}
                  sx={{ width: "100%", borderRadius: "12px" }}
                >
                  <MenuItem value={10}>Ten</MenuItem>
                  <MenuItem value={20}>Twenty</MenuItem>
                  <MenuItem value={30}>Thirty</MenuItem>
                </Select>
              </FormControl>
            </Box>
          </div>
          <div className="text-center col-sm-12">
            <button className="continue" onClick={handlenave}>
              Continue
            </button>
          </div>
        </div>
      </form>
    </div>
  );
}