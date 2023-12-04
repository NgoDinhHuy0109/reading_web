package controller;

import Service.Category;
import models.CategoriesEntity;
import DTO.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import java.io.IOException;
import java.util.UUID;

@WebServlet(name = "CategoryServlet", urlPatterns = {"/category"})
public class CategoryServlet extends HttpServlet {
    private final Category categoryApplication = new Category(new CategoriesEntity());

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String url = "/cate_home.jsp";
            String action = request.getParameter("action");
            if (action == null) {
                action = "join";
            }
            if (action.equals("join")) {
                url = "/cate_home.jsp";
            }
            if (action.equals("createNew")) {
                String categoryName = request.getParameter("categoryName");
                String description = request.getParameter("description");
                CategoriesEntity categoriesEntity = new CategoriesEntity(categoryName, description);
                if (categoryApplication.isCategoryExists(categoryName)) {
                    // Handle case where email already exists
                    url = "/cate_create.jsp";
                    request.setAttribute("error", "Category already exists");
                    getServletContext().getRequestDispatcher(url).forward(request, response);
                    //
                    //return;
                }
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
            if (action.equals("edit")) {
                // Code for editing an existing category
                String categoryIdParam = request.getParameter("categoryId");
                UUID categoryId = UUID.fromString(categoryIdParam);
                String categoryName = request.getParameter("categoryName");
                String description = request.getParameter("description");

                CategoriesEntity existingCategory = categoryApplication.getCategoryById(categoryId);

                if (existingCategory != null) {
                    categoryApplication.updateCategory(categoryId, categoryName, description);
                    response.sendRedirect(request.getContextPath() + "/category?action=join");
                    return;
                }
                else{
                    url = "/error_notification.jsp";
                    request.setAttribute("error", "Category not found.");
                }
            }
            if (action.equals("delete")) {
                String categoryIdParam = request.getParameter("categoryId");
                UUID categoryId = UUID.fromString(categoryIdParam);
                try {
                    categoryApplication.deleteCategory(categoryId);
                    // Redirect to cate_home.jsp after deleting the category
                    response.sendRedirect(request.getContextPath() + "/category?action=join");
                    return;
                } catch (Exception e) {
                    url = "/error_notification.jsp";
                    request.setAttribute("error", "Error deleting category: " + e.getMessage());
                }
            }
            if (action.equals("back")){
                try {
                    List<CategoryDTO> categoriesList = categoryApplication.getAllCategories();
                    // Set the categoriesList attribute before forwarding
                    request.setAttribute("categoriesList", categoriesList);
                    url = "/cate_home.jsp";
                }
                catch (Exception e) {
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
