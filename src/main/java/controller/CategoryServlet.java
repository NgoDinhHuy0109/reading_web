package controller;

import models.CategoriesEntity;
import utils.Service.*;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import DTO.*;

import java.util.List;

@WebServlet(name = "CategoryServlet", urlPatterns = {"/category"})
public class CategoryServlet extends HttpServlet {
    private final Category categoryApplication = new Category(new CategoriesEntity());

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {

            String url = "/cate_home.jsp";
            String action = request.getParameter("action");
            if (action == null) {
                action = "join";  // default action6
            }
            if (action.equals("join")) {
                url = "/cate_home.jsp";    // the "join" page
            }
            if (action.equals("add") || action.equals("createNew")) {
                String categoryName = request.getParameter("categoryName");
                String description = request.getParameter("description");
                CategoriesEntity categoriesEntity = new CategoriesEntity(categoryName, description);
                try {
                    categoryApplication.createCategory(categoriesEntity);
                    // Redirect to cate_home.jsp after creating the category
                    response.sendRedirect(request.getContextPath() + "/category?action=join");
                    return;
                } catch (Exception e) {
                    url = "/error_notification.jsp";
                    request.setAttribute("error", e.getMessage());
                }
            }
            // Retrieve the updated list of categories from the database
            List<CategoryDTO> categoriesList = categoryApplication.getAllCategories();
            // Set the categoriesList attribute before forwarding
            request.setAttribute("categoriesList", categoriesList);
            // Forward to the JSP
            getServletContext().getRequestDispatcher(url).forward(request, response);
        } catch (Exception e) {
            // Handle exceptions more gracefully, redirect to an error page
            response.sendRedirect(request.getContextPath() + "/error_notification.jsp?error=" + e.getMessage());
        }
    }

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Retrieve the updated list of categories from the database
            List<CategoryDTO> categoriesList = categoryApplication.getAllCategories();
            // Set the categoriesList attribute in the request
            request.setAttribute("categoriesList", categoriesList);
            // Forward to the JSP
            getServletContext().getRequestDispatcher("/cate_home.jsp").forward(request, response);
        } catch (Exception e) {
            // Handle exceptions more gracefully, redirect to an error page
            response.sendRedirect(request.getContextPath() + "/error_notification.jsp?error=" + e.getMessage());
        }
    }


}
