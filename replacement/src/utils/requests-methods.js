import axios from "axios";

const ENDPOINT = 'http://localhost:3003';

let config = {
  url: "/",
  method: "get",
  baseURL: ENDPOINT,
  headers: {},
  params: {},
  data: {},
  timeout: 5000,

  // `withCredentials` indicates whether or not cross-site Access-Control requests
  withCredentials: false, // default
  responseType: "json", // default
  xsrfCookieName: "XSRF-TOKEN", // default
  xsrfHeaderName: "X-XSRF-TOKEN", // default
  "Access-Control-Allow-Origin": "*"
};

// Add a response interceptor
axios.interceptors.response.use(
  function(response) {
    return response;
  },
  function(error) {
    return Promise.reject(error);
  }
);

export function get(url, data) {
  return axios({
    ...config,
    method: "get",
    url: url,
    params: data
  });
}
