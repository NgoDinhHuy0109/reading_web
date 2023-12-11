package controller;

import Service.*;
import jakarta.servlet.http.HttpSession;
import models.*;
import DTO.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.util.List;
import java.io.IOException;

import jakarta.servlet.http.Part;

import java.util.UUID;

@WebServlet(name = "MainArticleServlet", urlPatterns = {"/createArticle"})
public class MainArticleServlet extends HttpServlet {
    private final Article articleApplication = new Article(new ArticlesEntity());
    private final Category categoryApplication = new Category(new CategoriesEntity());
    CategoriesEntity categories = new CategoriesEntity();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String url = "/news_page/user_addarticle.jsp";
            String action = request.getParameter("action");
            HttpSession session = request.getSession();
            if (action == null) {
                action = "join";
            }
            if (action.equals("join")) {
                url = "/news_page/user_addarticle.jsp";
            }
            if (action.equals("createNew1")) {
                String title = request.getParameter("titleMain");
                // Retrieve image part
                String titleImage = request.getParameter("titleImg");
                String categoryName = request.getParameter("categoryName");
                UUID category1 = null;
                categories = categoryApplication.getCategoryByName(categoryName);
                category1 = categories.getCategoryId();
                // Sử dụng getParameterValues với editorContent
                String[] contentArray = request.getParameterValues("editorContent");
                String content = (contentArray != null && contentArray.length > 0) ? contentArray[0] : "";
                if (session != null && !session.isNew()) {
                    List<UserDTO> userList = (List<UserDTO>) session.getAttribute("UserInformation");
                    for(UserDTO user : userList)
                    {
                        String author = String.valueOf(user.getUserInfo().getAccountsEntity().getAccountId());
                        ArticlesEntity articlesEntity = new ArticlesEntity(title, titleImage, content);
                        articleApplication.createArticle(articlesEntity, category1, UUID.fromString(author));
                    }
                    // Rest of the code...
                }
            }
            getServletContext().getRequestDispatcher(url).forward(request, response);
        } catch (Exception e) {
            response.sendRedirect(request.getContextPath() + "/error_notification.jsp?error=" + e.getMessage());
        }
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
