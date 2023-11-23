import models.CategoriesEntity;
import utils.HibernateUtils;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import java.io.FileNotFoundException;
import models.*;
import utils.Service.*;
import DTO.*;
import java.io.FileReader;
import java.util.List;
public class TestData {
    public static void main(String[] args) throws FileNotFoundException {
//        Gson gson = new Gson();
//        List<ProductsEntity> productsEntities = gson.fromJson(new FileReader("\\test\\java\\data\\phones.json"), new TypeToken<List<ProductsEntity>>() {}.getType());
//        System.out.println(productsEntities);
//        //
//        List<CategoriesEntity> categoryEntities = gson.fromJson(new FileReader("\\test\\java\\data\\categories.json"), new TypeToken<List<CategoriesEntity>>() {}.getType());
//
//        for (CategoriesEntity item: categoryEntities
//        ) {
//            HibernateUtils hibernateUtils = new HibernateUtils(item);
//            hibernateUtils.saveEntity();
//        }
//
//        for (ProductsEntity item : productsEntities
//             ) {
//            HibernateUtils hibernateUtils = new HibernateUtils(item);
//            hibernateUtils.saveEntity();
//        }
        testGetAllCategories();

    }

    public static void createData() {
        CategoriesEntity categoriesTD = new CategoriesEntity();
        categoriesTD.setCategoryName("thoisu");
        categoriesTD.setDescription("18+");
        //
        HibernateUtils hibernateUtils = new HibernateUtils(categoriesTD);
        hibernateUtils.saveEntity();
    }
    public static void testGetAllCategories() {
        Category categoryService = new Category();

        // Retrieve all categories and print the results
        List<CategoryDTO> allCategories = categoryService.getAllCategories();

        if (!allCategories.isEmpty()) {
            System.out.println("All Categories:");
            for (CategoryDTO categoryDTO : allCategories) {
                CategoriesEntity category = categoryDTO.getCategory();
                System.out.println("Category ID: " + category.getCategoryId());
                System.out.println("Category Name: " + category.getCategoryName());
                System.out.println("Description: " + category.getDescription());
                System.out.println("Created At: " + categoryDTO.getCreatedAtString());
                System.out.println("Updated At: " + categoryDTO.getUpdatedAtString());
                System.out.println("Is Deleted: " + category.getIsDeleted());
                System.out.println("--------------------");
            }
        } else {
            System.out.println("No categories found.");
        }
    }
}
