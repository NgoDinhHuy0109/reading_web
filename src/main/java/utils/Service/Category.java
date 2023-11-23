    package utils.Service;

    import com.google.gson.Gson;
    import models.AccountsEntity;
    import models.ArticlesEntity;
    import models.CategoriesEntity;
    import org.hibernate.Session;
    import utils.HibernateUtils;
    import java.text.SimpleDateFormat;
    import java.util.ArrayList;
    import java.util.Collection;
    import java.util.Collections;
    import java.util.List;
    import org.hibernate.Session;
    import org.hibernate.SessionFactory;
    import org.hibernate.query.Query;
    import java.util.UUID;
    import java.util.stream.Collectors;
    import DTO.*;

    public class Category extends HibernateUtils{
        public Category() {
            super(new CategoriesEntity());
        }
        public Category(CategoriesEntity object) {
            super(object);
        }
        public void save(){
            Gson responseJson = new Gson();
            try {
                super.saveEntity();
            }
            catch (Exception error)
            {
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
    }
