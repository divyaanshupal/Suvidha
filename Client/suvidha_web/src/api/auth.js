import axios from "axios";

// API Base URL - update this to match your server
// For Create React App, use process.env.REACT_APP_API_BASE_URL
const API_BASE = process.env.REACT_APP_API_BASE_URL || "http://localhost:5000/api";

export const signupUser = async (userData) => {
  try {
    const response = await axios.post(`${API_BASE}/auth/register`, userData);
    return response.data;
  } catch (error) {
    throw error.response?.data || { message: "Signup failed" };
  }
};

export const loginUser = async (userData) => {
  try {
    const response = await axios.post(`${API_BASE}/auth/login`, userData);
    return response.data;
  } catch (error) {
    throw error.response?.data || { message: "Login failed" };
  }
};
