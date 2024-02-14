import React, { useEffect, useState, useCallback, useMemo } from "react";
import Button from "@mui/material/Button";
import { Link } from "react-router-dom";
import axios from "axios";
import { AgGridReact } from "ag-grid-react";
import "ag-grid-community/styles/ag-grid.css";
import commonData from "../../../common.json";
import { Chip, MenuItem, Select } from "@mui/material";

const WeeklyReport = () => {
  const containerStyle = { width: "100%", height: "100%" };
  const gridStyle = { height: "100%", width: "100%" };
  const [projectDetails, setProjectDetails] = useState([]);
  const [workDetails, setWorkDetails] = useState([]);
  const [projectWorkHours, setProjectWorkHours] = React.useState(null);
  const [exportApi, setExportApi] = React.useState(null);
  const [selectedYear, setSelectedYear] = React.useState(
    new Date().getFullYear()
  );
  const [years, setYears] = React.useState(null);

  console.log(workDetails, "workDetailsworkDetails", projectDetails);
  React.useEffect(() => {
    onGetWorkDetails();
    onGridReady();
  }, [selectedYear]);

  useEffect(() => {
    let currentYear = new Date().getFullYear();
    const startYear = 2000;
    const years = Array.from(
      { length: currentYear - startYear + 1 },
      (_, index) => startYear + index
    );
    setYears(years);
  }, [selectedYear]);

  React.useEffect(() => {
    const projectData = workDetails.reduce((acc, entry) => {
      const projectName = entry.projectName;
      if (!acc[projectName]) {
        acc[projectName] = [];
      }
      acc[projectName].push(Number(entry.totalHours));
      return acc;
    }, {});

    const projectTotalHours = Object.keys(projectData).map((projectName) => {
      const totalHours = projectData[projectName].reduce(
        (sum, hours) => sum + hours,
        0
      );
      return { projectName, totalHours };
    });
    setProjectWorkHours(projectTotalHours);
    console.log(projectTotalHours, "projectTotalHours");
  }, [workDetails]);

  const onGridReady = (params) => {
    setExportApi(params?.api);

    axios
      .get(`${commonData?.APIKEY}/getProject`)
      .then((res) => {
        if (res.data.Status === "Success") {
          let tempResult = res.data.Result.filter(
            (item) => new Date(item.startDate).getFullYear() === selectedYear
          );
          console.log(tempResult, "tempResult453")
          setProjectDetails(tempResult);
        } else {
          alert("Error");
        }
      })
      .catch((err) => console.log(err));
  };

  const onGetWorkDetails = (params) => {
    axios
      .get(`${commonData?.APIKEY}/getWrokDetails`)
      .then((res) => {
        if (res.data.Status === "Success") {
          let resultData = res.data.Result?.filter(
            (item) =>
              item.status === "approved" &&
              new Date(item.approvedDate).getFullYear() === selectedYear
          );
          console.log(resultData, "resultData452345", selectedYear);
          setWorkDetails(resultData);
        } else {
          alert("Error");
        }
      })
      .catch((err) => console.log(err));
  };

  const getTotalHoursForWeek = (data) => {
    const totalHours = data.reduce(
      (acc, item) => acc + Number(item.totalHours),
      0
    );
    console.log(totalHours, "totalHours");
    return totalHours;
  };

  const columnDefs = useMemo(() => {
    const weekFields = [];

    // Generate fields for weeks 1 to 52
    for (let weekNumber = 1; weekNumber <= 52; weekNumber++) {
      const field = {
        field: weekNumber.toString(),
        filter: false,
        minWidth: 60,
        valueGetter: (params, index) => {
          const filteredData = workDetails.filter(
            (item) =>
              item.weekNumber === weekNumber.toString() &&
              item.projectName === String(params.data.projectName)
          );
          return getTotalHoursForWeek(filteredData);
        },
      };
      weekFields.push(field);
    }

    return [
      {
        field: "referenceNo",
        minWidth: 170,
      },
      {
        field: "allotatedHours",
        minWidth: 170,
        headerName: "Allotted Hours",
      },
      {
        field: "Consumed",
        headerName: "Consumed Hours",
        minWidth: 170,
        valueGetter: (params) => {
          const project = projectWorkHours?.find(
            (items) => items.projectName === params.data.projectName
          );

          return project?.totalHours || 0;
        },
      },
      // { field: "discipline" },
      { field: "projectName", minWidth: 170 },
      { field: "desciplineCode", headerName: "Discipline Code" },
      ...weekFields, // Include dynamically generated week fields
    ];
  }, [projectWorkHours, workDetails]);

  const autoGroupColumnDef = useMemo(
    () => ({
      headerName: "Group",
      minWidth: 170,
      field: "athlete",
      valueGetter: (params) => {
        if (params.node.group) {
          return params.node.key;
        } else {
          return params.data[params.colDef.field];
        }
      },
      headerCheckboxSelection: false,
      valueGetter: "agGroupvalueGetter",
      valueGetterParams: {
        checkbox: false,
      },
    }),
    []
  );

  const defaultColDef = useMemo(
    () => ({
      editable: false,
      enableRowGroup: true,
      enablePivot: true,
      enableValue: true,
      sortable: true,
      resizable: true,
      filter: true,
      floatingFilter: true,
      flex: 1,
      minWidth: 100,
    }),
    []
  );

  const onClickExport = () => {
    console.log(exportApi, "grdiApigrdiApi");
    exportApi.exportDataAsCsv();
  };

  return (
    <>
      <div className="text-center pb-1 my-3">
        <h4>Project Weekly Report</h4>
      </div>
      <div style={containerStyle}>
        <Button
          onClick={() => onClickExport()}
          variant="contained"
          className="mb-3 mx-3"
        >
          Export{" "}
        </Button>
        <Chip
          label="Clear Filter"
          onClick={() => {
            setSelectedYear(new Date().getFullYear());
          }}
          color={"warning"}
          className="me-3"
        />
        <Select
          className="noPaddingInput mb-3"
          value={selectedYear}
          defaultValue={selectedYear}
          onChange={(e, value) => setSelectedYear(value.props.value)}
        >
          {years?.map((res) => (
            <MenuItem value={res}>{res}</MenuItem>
          ))}
        </Select>
        <div style={gridStyle} className="ag-theme-alpine leavetable">
          <AgGridReact
            rowData={projectDetails}
            columnDefs={columnDefs}
            autoGroupColumnDef={autoGroupColumnDef}
            defaultColDef={defaultColDef}
            suppressRowClickSelection={true}
            groupSelectsChildren={true}
            rowSelection={"single"}
            rowGroupPanelShow={"always"}
            pivotPanelShow={"always"}
            pagination={true}
            onGridReady={onGridReady}
            onSelectionChanged={(event) => onSelectionChanged(event)}
          />
        </div>
      </div>
    </>
  );
};

export default WeeklyReport;
