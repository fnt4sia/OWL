import React from 'react';
import ReactDOM from 'react-dom/client';
import './index.css';
import {
  createBrowserRouter,
  RouterProvider,
} from "react-router-dom";
import LoginPage from './Features/Login/LoginPage';
import TestPage from './Features/Home/Test';

const router = createBrowserRouter([
  {
    path: "/",
    element: <LoginPage/>,
  },
  {
    path: "/login",
    element: <TestPage/>
  }
]);

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
  <RouterProvider router={router}/>
);