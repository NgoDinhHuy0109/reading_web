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

import java.util.Objects;
import java.util.UUID;
@WebServlet(name = "ArticleServlet", urlPatterns = {"/article"})
public class ArticleServlet extends HttpServlet{
    private final Article articleApplication = new Article(new ArticlesEntity());
    private final Category categoryApplication = new Category(new CategoriesEntity());
    CategoriesEntity categories = new CategoriesEntity();
    private String convertPartToString(Part part) throws IOException {
        if (part != null) {
            // Read the input stream from the Part
            try (InputStream inputStream = part.getInputStream()) {
                // Use a ByteArrayOutputStream to read bytes from the input stream
                ByteArrayOutputStream result = new ByteArrayOutputStream();
                byte[] buffer = new byte[1024];
                int length;
                while ((length = inputStream.read(buffer)) != -1) {
                    result.write(buffer, 0, length);
                }
                // Convert the ByteArrayOutputStream to a String using UTF-8 encoding
                return result.toString("UTF-8");
            }
        }
        return null;
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{
            String url = "/article_home.jsp";
            String action = request.getParameter("action");
            HttpSession session = request.getSession();
            if (action == null) {
                action = "join";
            }
            if (action.equals("join")) {
                url = "/article_home.jsp";
            }
            if(action.equals("createNew")) {
                String title = request.getParameter("title");
                // Retrieve image part
                String titleImage = request.getParameter("titleImg");
                String categoryName = request.getParameter("categoryName");
                UUID category = null;
                categories = categoryApplication.getCategoryByName(categoryName);
                category = categories.getCategoryId();
                // Sử dụng getParameterValues với editorContent
                String[] contentArray = request.getParameterValues("editorContent");
                String content = (contentArray != null && contentArray.length > 0) ? contentArray[0] : "";
                if (session != null && !session.isNew()) {
                    // Retrieve the attribute
                    //Object obj = session.getAttribute("username");
                    //UserInfoEntity UserInformation = null;
                    //if (obj != null)
                    //    UserInformation = (UserInfoEntity) obj;
                    //assert UserInformation != null;
                    //UUID author = UUID.fromString(String.valueOf(UserInformation.getAccountsEntity()));
                    UUID author = UUID.fromString("f024f779-1839-45ba-acf1-9f9948cee82c");
                    ArticlesEntity articlesEntity = new ArticlesEntity(title,titleImage,content);
                    articleApplication.createArticle(articlesEntity, category, author);
                    // Rest of the code...
                }

                //UUID author = UUID.fromString("f024f779-1839-45ba-acf1-9f9948cee82c");

            }
            if(action.equals("edit")){
                // Retrieve the parameters from the request
                String articleIdParam = request.getParameter("articleId");
                String title = request.getParameter("title");
                String titleImage = request.getParameter("titleImg");
                String categoryName = request.getParameter("categoryName");
                String newContent = request.getParameter("editorContent");
                UUID articleId = UUID.fromString(articleIdParam);
                // Retrieve the existing article
                ArticlesEntity existingArticle = articleApplication.getArticleById(articleId);
                if (existingArticle != null) {
                    // Retrieve the category by name
                    CategoriesEntity category = categoryApplication.getCategoryByName(categoryName);
                    // Update the article with the new information
                    articleApplication.updateArticle(articleId, category, title,titleImage, newContent);
                } else {
                    System.out.println("Article with ID " + articleId + " not found.");
                }
            }
            if(action.equals("delete")){
                // Retrieve the article ID from the request
                String articleIdParam = request.getParameter("articleId");
                UUID articleId = UUID.fromString(articleIdParam);
                // Delete the article
                articleApplication.deleteArticle(articleId);

            }
            if(action.equals("back")){
                try{
                    List<ArticleDTO> articlesList = articleApplication.getAllArticles();
                    request.setAttribute("articlesList", articlesList);
                    url="/article_home.jsp";

                }catch (Exception e){
                    url = "/error_notification.jsp";
                    request.setAttribute("error", e.getMessage());
                }
            }
            List<ArticleDTO> articlesList = articleApplication.getAllArticles();
            request.setAttribute("articlesList", articlesList);
            getServletContext().getRequestDispatcher(url).forward(request, response);
        }catch (Exception e) {
            // Handle exceptions more gracefully, redirect to an error page
            response.sendRedirect(request.getContextPath() + "/error_notification.jsp?error=" + e.getMessage());
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{
            List<ArticleDTO> articlesList = articleApplication.getAllArticles();
            request.setAttribute("articlesList", articlesList);
            getServletContext().getRequestDispatcher("/article_home.jsp").forward(request, response);
        }catch (Exception e){
            response.sendRedirect(request.getContextPath()+"/error_notification.jsp?error=" + e.getMessage());
        }
    }
}