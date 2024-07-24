import React, { useState, useEffect } from "react";
import {
  Chart as ChartJS,
  CategoryScale,
  LinearScale,
  PointElement,
  LineElement,
  Title,
  Tooltip,
  Legend,
} from "chart.js";
import { Line } from "react-chartjs-2";
import faker from "faker";
import axios from "axios";

ChartJS.register(
  CategoryScale,
  LinearScale,
  PointElement,
  LineElement,
  Title,
  Tooltip,
  Legend
);

export const options = {
  responsive: true,
  interaction: {
    mode: "index" as const,
    intersect: false,
  },
  stacked: false,
  plugins: {
    title: {
      display: true,
      text: "Chart.js Line Chart - Multi Axis",
    },
  },
  scales: {
    y: {
      type: "linear" as const,
      display: true,
      position: "left" as const,
    },
    y1: {
      type: "linear" as const,
      display: true,
      position: "right" as const,
      grid: {
        drawOnChartArea: false,
      },
    },
  },
};

const labels = ["January", "February", "March", "April", "May", "June", "July"];

export const data = {
  labels,
  datasets: [
    {
      label: "Dataset 1",
      data: labels.map(() => faker.datatype.number({ min: -1000, max: 1000 })),
      borderColor: "rgb(255, 99, 132)",
      backgroundColor: "rgba(255, 99, 132, 0.5)",
      yAxisID: "y",
    },
    {
      label: "Dataset 2",
      data: labels.map(() => faker.datatype.number({ min: -1000, max: 1000 })),
      borderColor: "rgb(53, 162, 235)",
      backgroundColor: "rgba(53, 162, 235, 0.5)",
      yAxisID: "y1",
    },
  ],
};

export function App() {
  const [dataRows, setDataRows] = useState(null);
  const [temperatureEpochArray, setTemperatureEpochArray] = useState(null);
  const [temperatureValueArray, setTemperatureValueArray] = useState(null);
  const [isLoading, setIsLoading] = useState(false);

  const getDataRows = async () => {
    setIsLoading(true);
    console.log("# getDataRows");
    try {
      const response = await axios.get(
        "https://kbdi4drokxti3klqw6m7rixgcq0tnnlz.lambda-url.us-east-1.on.aws/"
      );
      console.log(
        "### res.data.ResultSet.Rows: ",
        response.data.ResultSet.Rows
      );
      setDataRows(response.data.ResultSet.Rows);

      // Epoch temperature time array
      let temperature_epoch_array: number[] = [];
      let temperature_value_array: number[] = [];

      const temperature_array = response.data.ResultSet.Rows.map((row) => {
        if (row.Data[1].VarCharValue === "Temperature") {
          temperature_epoch_array.push(row.Data[3].VarCharValue);
          temperature_value_array.push(row.Data[0].VarCharValue);
          return row.Data[3].VarCharValue;
        }
      });

      console.log("temperature_epoch_array: ", temperature_epoch_array);
      console.log("temperature_value_array: ", temperature_value_array);

      setIsLoading(false);
    } catch (error) {
      setIsLoading(false);
      throw error;
    }
  };

  useEffect(() => {
    getDataRows();
  }, []);

  return (
    <>
      {isLoading && <h6>Loading</h6>}
      <Line options={options} data={data} />
      <div>{dataRows ? JSON.stringify(dataRows) : "null"}</div>
    </>
  );
}
