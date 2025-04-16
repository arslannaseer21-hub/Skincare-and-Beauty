/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.beauty.skincare.servlet;

import com.beauty.skincare.dao.StaffDAO;
import com.beauty.skincare.helper.DBResponse;
import com.beauty.skincare.model.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author 120123
 */
public class ManageStaffServlet extends HttpServlet {

 
    private StaffDAO staffService=new StaffDAO();
    
    public void init()throws ServletException
    {
        staffService=new StaffDAO();
      
    }
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       
       
       DBResponse dbResponse=staffService.insertStaff(request.getParameter("s_name"),request.getParameter("s_userName"),request.getParameter("s_password"),request.getParameter("s_email"),request.getParameter("s_phone"));
        if(dbResponse.isSuccess())
        {
            request.setAttribute("msg",dbResponse.getMsg());
            request.getRequestDispatcher("/manager_pages/add_staff.jsp").forward(request, response);

        }
        else
        {
            
             request.setAttribute("msg",dbResponse.getMsg());
            request.getRequestDispatcher("/manager_pages/add_staff.jsp").forward(request, response);

        }
            
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
