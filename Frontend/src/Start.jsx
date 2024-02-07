import React from "react";
// import { useNavigate } from "react-router-dom";
import Login from "./Login";
import commonData from "../common.json";
import axios from "axios";

function Start() {
  const [rowData, setRowData] = React.useState([]);
  const [lastValue, setLastValue] = React.useState(null);
  console.log(rowData, "rowData", lastValue);
  React.useEffect(() => {
    axios
      .get(`${commonData?.APIKEY}/settings`)
      .then((res) => {
        if (res.data.Status === "Success") {
          setRowData(res.data.Result);
          const lastIndex = res.data.Result.length - 1;
          const lastItem = res.data.Result[lastIndex];
          setLastValue(lastItem);
        } else {
          alert("Error");
        }
      })
      .catch((err) => console.log(err));
  }, []);

  return (
    <>
      <div className="vh-100 loginPage">
        <div className="row h-100">
          <div className="col-sm-4 p-0">
            <div className="startDesign">
              <div className="position-relative w-100">
                <div className="four">
                  <h3 className="text-center updatetag ">Updates</h3>
                </div>
                <marquee direction="up" scrollamount="5">
                  {rowData?.map((res) => {
                    return (
                      <div className="updates" key={res.id}>
                        <div>
                          <h4>{res?.updateTitle}</h4>
                          <p className="m-0">{res?.UpdateDisc}</p>
                        </div>
                      </div>
                    );
                  })}
                </marquee>
                <div className="support-info">
                  <div className="support-team">
                    <div className="supImg">
                      <img
                        src={`${commonData?.BASEURL}/src/assets/technical-support.png`}
                        width={"100%"}
                      />
                    </div>
                    <p>
                      <b>Email :</b>nicknameinfotec@gmail
                    </p>
                    <p>
                      <b>Mobile no :</b>8270564998
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div className="col-sm-4 p-0">
            <div className="center-sec">
              <div class="three">
                <h3 className="announcement ">Announcement</h3>
              </div>

              <div className="flashUpdate">
                <p>{lastValue?.Announcements}</p>
              </div>
            </div>
            {/* <div className="banner">
                <div
                  id="carouselExampleInterval"
                  className="carousel slide"
                  data-bs-ride="carousel"
                >
                  <div className="carousel-inner">
                    <div
                      className="carousel-item active"
                      data-bs-interval="10000"
                    >
                      <img
                        src={`${commonData?.BASEURL}/src/assets/banner.jpg`}
                        className="d-block w-100"
                        alt="..."
                      />
                    </div>
         
                  </div>
              
                </div>
              </div> */}
          </div>
          <div className="col-sm-4 p-0">
            <div className="startDesign updatemarquee">
              <div className="w-100">
                <div className="w-100">
                  <div className="d-flex align-items-center justify-content-center h-100 flex-column">
                    <div className="w-100 text-center logo-clips">
                      <img
                        src={`${commonData?.BASEURL}/src/assets/logo.png`}
                        width={150}
                      />
                    </div>

                    {/* <ul className="updateslist">
                        <li>
                          <a href={`${lastValue?.Circular}`} target="_blank">
                            Circular
                          </a>
                        </li>
                        <li>
                          <a href={`${lastValue?.Gallery}`} target="_blank">
                            Photo Gallery
                          </a>
                        </li>
                        <li>
                          <a href={`${lastValue?.ViewExcel}`} target="_blank">
                            View Excel / Word
                          </a>
                        </li>
                      </ul> */}
                  </div>
                </div>
                <div className="log-form">
                  <div className="loginSection">
                    <Login />
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </>
  );
}

export default Start;
