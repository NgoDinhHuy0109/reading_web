package Service;

import com.google.gson.Gson;
import models.AccountsEntity;
import models.CategoriesEntity;
import org.hibernate.Session;
import utils.HibernateUtils;

import java.util.Collections;
import java.util.List;

import org.hibernate.query.Query;

import java.util.UUID;
import java.util.stream.Collectors;

import DTO.*;

public class Category extends HibernateUtils {
    public Category() {
        super(new CategoriesEntity());
    }

    public Category(CategoriesEntity object) {
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

    public void createCategory(CategoriesEntity newCategory) {
        try {
            UUID categoryId = UUID.randomUUID();
            newCategory.setCategoryId(categoryId);
            Long current = System.currentTimeMillis();
            newCategory.setCreatedAt(current);
            newCategory.setUpdatedAt(current);
            newCategory.setIsDeleted(false);
            Category category = new Category(newCategory);
            category.save();
        } catch (Exception error) {
            System.out.println("Error creating user: " + error);
        }
    }

    public void updateCategory(UUID categoryId, String newCategoryName, String newDescription) {
        try {
            // Retrieve the existing category by its ID
            CategoriesEntity existingCategory = (CategoriesEntity) getEntityById(CategoriesEntity.class, categoryId);
            if (existingCategory != null) {
                // Update the properties of the existing category
                existingCategory.setCategoryName(newCategoryName);
                existingCategory.setDescription(newDescription);
                existingCategory.setUpdatedAt(System.currentTimeMillis());
                // Save the updated category
                updateEntity(existingCategory);
            } else {
                System.out.println("Category with ID " + categoryId + " not found.");
            }
        } catch (Exception error) {
            System.out.println("Error updating category: " + error);
        }
    }

    public void deleteCategory(UUID categoryId) {
        try {
            // Retrieve the category by its ID
            CategoriesEntity categoryToDelete = (CategoriesEntity) getEntityById(CategoriesEntity.class, categoryId);
            if (categoryToDelete != null) {
                categoryToDelete.setIsDeleted(true); // Set the 'isDeleted' flag to mark as deleted
                categoryToDelete.setUpdatedAt(System.currentTimeMillis());
                // Update the entity to mark as deleted (soft delete)
                updateEntity(categoryToDelete);
            } else {
                System.out.println("Category with ID " + categoryId + " not found.");
            }
        } catch (Exception error) {
            System.out.println("Error deleting category: " + error);
        }
    }

    public CategoriesEntity getCategoryById(UUID categoryId) {
        try {
            // Retrieve the category by its ID
            return (CategoriesEntity) getEntityById(CategoriesEntity.class, categoryId);
        } catch (Exception error) {
            System.out.println("Error retrieving category by ID: " + error);
            return null; // Return null in case of an error
        }
    }

    public CategoriesEntity getCategoryByName(String categoryName) {
        try {
            String query = "FROM CategoriesEntity WHERE isDeleted = false and categoryName = :categoryName";
            return executeQueryWithParameter(query, "categoryName", categoryName)
                    .stream()
                    .findFirst()
                    .orElse(null);
        } catch (Exception error) {
            // Log the error instead of printing to the console
            System.out.println("Error retrieving categories: " + error);
            throw new RuntimeException("Error retrieving account", error);
        }
    }

    public List<String> getCategoryNames() {
        try {
            // Query the database to get all category names
            String query = "SELECT categoryName FROM CategoriesEntity WHERE isDeleted = false";
            List<String> categoryNames = executeQueryForScalar(query, String.class);
            return categoryNames;
        } catch (Exception error) {
            System.out.println("Error retrieving category names: " + error);
            return Collections.emptyList(); // Return an empty list in case of an error
        }
    }

    private <T> List<T> executeQueryForScalar(String query, Class<T> returnType) {
        try (Session session = getSessionFactory().openSession()) {
            Query<T> hqlQuery = session.createQuery(query, returnType);
            return hqlQuery.getResultList();
        } catch (Exception e) {
            System.out.println("Error executing query: " + e);
            return Collections.emptyList(); // Return an empty list in case of an error
        }
    }

    private List<CategoriesEntity> executeQueryWithParameter(String query, String paramName, String paramValue) {
        try (Session session = getSessionFactory().openSession()) {
            Query<CategoriesEntity> hqlQuery = session.createQuery(query, CategoriesEntity.class);
            hqlQuery.setParameter(paramName, paramValue);
            return hqlQuery.getResultList();
        } catch (Exception e) {
            System.out.println("Error retrieving categories: " + e);
            throw new RuntimeException("Error executing query", e);
        }
    }

    public List<CategoryDTO> getAllCategories() {
        try {
            // Query the database to get all categories
            String query = "FROM CategoriesEntity WHERE isDeleted = false"; // Assuming there's an 'isDeleted' field in CategoriesEntity
            List<CategoriesEntity> categories = executeQuery(query);
            // Return the list of formatted categories
            return formatDateTimeInCategories(categories);
        } catch (Exception error) {
            System.out.println("Error retrieving categories: " + error);
            return Collections.emptyList(); // Return an empty list in case of an error
        }
    }

    public boolean isCategoryExists(String categoryName) {
        try {
            String query = "FROM CategoriesEntity WHERE isDeleted = false AND categoryName = :categoryName";
            return !executeQueryWithParameter(query, "categoryName", categoryName).isEmpty();
        } catch (Exception e) {
            // Log the error using a logging framework
            throw new RuntimeException("Error checking account existence", e);
        }
    }

    // Execute an HQL query and return the result list
    private List<CategoriesEntity> executeQuery(String query) {
        try (Session session = getSessionFactory().openSession()) {
            Query<CategoriesEntity> hqlQuery = session.createQuery(query, CategoriesEntity.class);
            return hqlQuery.getResultList();
        } catch (Exception e) {
            System.out.println("Error executing query: " + e);
            return Collections.emptyList(); // Return an empty list in case of an error
        }
    }

    private List<CategoryDTO> formatDateTimeInCategories(List<CategoriesEntity> categories) {
        return categories.stream()
                .map(CategoryDTO::new)
                .collect(Collectors.toList());
    }

    public long countCategories() {
        try {
            String query = "SELECT COUNT(*) FROM CategoriesEntity WHERE isDeleted = false";
            return executeCountQuery(query);
        } catch (Exception e) {
            System.out.println("Error counting categories: " + e);
            return 0; // Hoặc throw exception nếu bạn muốn xử lý đối với lỗi
        }
    }

    private long executeCountQuery(String query) {
        try (Session session = getSessionFactory().openSession()) {
            Query<Long> countQuery = session.createQuery(query, Long.class);
            return countQuery.uniqueResult();
        } catch (Exception e) {
            System.out.println("Error executing count query: " + e);
            return 0; // Hoặc throw exception nếu bạn muốn xử lý đối với lỗi
        }
    }
}
