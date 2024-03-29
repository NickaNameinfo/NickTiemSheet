import React, { useEffect } from "react";
import "bootstrap-icons/font/bootstrap-icons.css";
import { Link, Outlet, useNavigate } from "react-router-dom";
import axios from "axios";
import commonData from "../../common.json"
function TeamLeadDashboard() {
  const navigate = useNavigate();
  const token = localStorage.getItem("token");
  axios.defaults.withCredentials = true;
  useEffect(() => {
    axios.post(`${commonData?.APIKEY}/dashboard`, { tokensss: token }).then((res) => {
      console.log(res, "resresresres");
    });
  }, []);

  const handleLogout = () => {
    axios
      .get(`${commonData?.APIKEY}/logout`)
      .then((res) => {
        navigate("/");
      })
      .catch((err) => console.log(err));
  };
  return (
    <div className="container-fluid nickname-page">
      <div className="row flex-nowrap min-vh-91">
        <div className="col-auto px-sm-2 px-0 sidebar">
          <div className="logo">
            <img src={`${commonData?.BASEURL}/src/assets/logo.png`} width={100} />
            {/* <h2> nickname</h2> */}
          </div>
          <ul className="links">
            <h4 className="fs-4 text-center mb-2 txt_col">Tl Dashboard</h4>
            <li>
              <span className="material-symbols-outlined fs-5 bi-collection"></span>
              <Link to="/TeamLead">
                <span className="txt_col">Dashboard</span>
              </Link>
            </li>

            <li>
              <span className="material-symbols-outlined fs-5 bi-person-workspace"></span>
              <Link to="/TeamLead/ProjectWorkDetails">
                <span className="txt_col">Project Work Details</span>
              </Link>
            </li>
            <li onClick={() => handleLogout()}>
              <span className="material-symbols-outlined  fs-5 bi-power"></span>
              <Link>
                <span className="txt_col">Logout</span>
              </Link>
            </li>
          </ul>
        </div>
        <div className="col p-0 m-0 nicknametable">
          {/* <div className="p-2 d-flex justify-content-center shadow">
            <h4>Employee Management System</h4>
          </div> */}
          <Outlet />
        </div>
      </div>
    </div>
  );
}

export default TeamLeadDashboard;
