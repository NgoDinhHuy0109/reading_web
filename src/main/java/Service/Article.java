package Service;

import utils.HibernateUtils;
import org.hibernate.query.Query;

import java.util.UUID;
import java.util.stream.Collectors;

import DTO.*;

import java.util.Collections;
import java.util.List;

import com.google.gson.Gson;
import models.*;
import org.hibernate.Session;

public class Article extends HibernateUtils {
    public Article() {
        super(new ArticlesEntity());
    }

    public Article(ArticlesEntity object) {
        super(object);
    }

    public void save() {
        Gson responseJson = new Gson();
        try {
            super.saveEntity();
        } catch (Exception error) {
            System.out.println(error);
        }
    }

    public void createArticle(ArticlesEntity newArticle, UUID categoryId, UUID accountId) {
        try {
            UUID articleId = UUID.randomUUID();
            newArticle.setArticleId(articleId);
            CategoriesEntity category = getEntityById(CategoriesEntity.class, categoryId);
            AccountsEntity account = getEntityById(AccountsEntity.class, accountId);
            Long current = System.currentTimeMillis();
            newArticle.setCreatedAt(current);
            newArticle.setUpdatedAt(current);
            newArticle.setCategoriesEntity(category);
            newArticle.setAccountsEntity(account);
            newArticle.setIsDeleted(false);
            Article article = new Article(newArticle);
            article.save();
        } catch (Exception error) {
            System.out.println("Error creating article" + error);
        }
    }
    public void updateArticle(UUID artircleId, CategoriesEntity category, String title,String titleImage, String content) {
        try {
            // Retrieve the existing category by its ID
            ArticlesEntity existingArtile = (ArticlesEntity) getEntityById(ArticlesEntity.class, artircleId);
            if (existingArtile != null) {
                // Update the properties of the existing category
                existingArtile.setTitle(title);
                existingArtile.setTitleImage(titleImage);
                existingArtile.setCategoriesEntity(category);
                existingArtile.setContent(content);
                existingArtile.setUpdatedAt(System.currentTimeMillis());
                // Save the updated category
                updateEntity(existingArtile);
            } else {
                System.out.println("Article with ID " + artircleId + " not found.");
            }
        } catch (Exception error) {
            System.out.println("Error updating category: " + error);
        }
    }
    public void deleteArticle(UUID artircleId) {
        try {
            // Retrieve the category by its ID
            ArticlesEntity existingArtile = (ArticlesEntity) getEntityById(ArticlesEntity.class, artircleId);

            if (existingArtile != null) {
                existingArtile.setIsDeleted(true); // Set the 'isDeleted' flag to mark as deleted
                existingArtile.setUpdatedAt(System.currentTimeMillis());

                // Update the entity to mark as deleted (soft delete)
                updateEntity(existingArtile);
            } else {
                System.out.println("Article with ID " + artircleId + " not found.");
            }
        } catch (Exception error) {
            System.out.println("Error deleting category: " + error);
        }
    }
    public List<ArticleDTO> getAllArticles() {
        try {
            // Query the database to get all categories
            String query = "FROM ArticlesEntity WHERE isDeleted = false"; // Assuming there's an 'isDeleted' field in CategoriesEntity
            List<ArticlesEntity> articles = executeQuery(query);
            // Return the list of formatted categories
            return formatDateTimeInArticles(articles);
        } catch (Exception error) {
            System.out.println("Error retrieving categories: " + error);
            return Collections.emptyList(); // Return an empty list in case of an error
        }
    }
    private List<ArticlesEntity> executeQuery(String query) {
        try (Session session = getSessionFactory().openSession()) {
            Query<ArticlesEntity> hqlQuery = session.createQuery(query, ArticlesEntity.class);
            return hqlQuery.getResultList();
        } catch (Exception e) {
            System.out.println("Error executing query: " + e);
            return Collections.emptyList(); // Return an empty list in case of an error
        }
    }
    private List<ArticleDTO> formatDateTimeInArticles(List<ArticlesEntity> articles) {
        return articles.stream()
                .map(article -> new ArticleDTO(article, getCategoryNameByCategoryId(article.getCategoriesByCategoryId().getCategoryId())))
                .collect(Collectors.toList());
    }
    public String getCategoryNameByCategoryId(UUID categoryId) {
        try {
            Category categoryService = new Category();
            CategoriesEntity categoryEntity = categoryService.getCategoryById(categoryId);
            if (categoryEntity != null) {
                return categoryEntity.getCategoryName();
            } else {
                System.out.println("Category with ID " + categoryId + " not found.");
                return null;
            }
        } catch (Exception error) {
            System.out.println("Error getting category name by ID: " + error);
            return null;
        }
    }


    // Add this method to execute a query and return a list of a specified type

    public ArticlesEntity getArticleById(UUID articleId) {
        try {
            // Retrieve the category by its ID
            return (ArticlesEntity) getEntityById(ArticlesEntity.class, articleId);
        } catch (Exception error) {
            System.out.println("Error retrieving article by ID: " + error);
            return null; // Return null in case of an error
        }
    }
    public List<ArticleDTO> getArticlesByCategoryID(UUID categoryID) {
        try {
            String query = "SELECT a FROM ArticlesEntity a WHERE a.isDeleted = false AND a.category.categoryId = :categoryID";
            List<ArticlesEntity> articles = executeQueryWithParameter(query, "categoryID", categoryID);
            return formatDateTimeInArticles(articles);
        } catch (Exception error) {
            System.out.println("Error retrieving articles by category ID: " + error);
            return Collections.emptyList();
        }
    }
    public List<ArticleDTO> getArticlesByUserID(UUID userID) {
        try {
            String query = "SELECT a FROM ArticlesEntity a WHERE a.isDeleted = false AND a.account.accountId = :accountId";
            List<ArticlesEntity> articles = executeQueryWithParameter(query, "accountId", userID);
            return formatDateTimeInArticles(articles);
        } catch (Exception error) {
            System.out.println("Error retrieving articles by category ID: " + error);
            return Collections.emptyList();
        }
    }

    private List<ArticlesEntity> executeQueryWithParameter(String query, String paramName, UUID paramValue) {
        try (Session session = getSessionFactory().openSession()) {
            Query<ArticlesEntity> hqlQuery = session.createQuery(query, ArticlesEntity.class);
            hqlQuery.setParameter(paramName, paramValue);
            return hqlQuery.getResultList();
        } catch (Exception e) {
            System.out.println("Error executing query with parameter: " + e);
            return Collections.emptyList(); // Return an empty list in case of an error
        }
    }


}