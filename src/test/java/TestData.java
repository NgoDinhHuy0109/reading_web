import models.CategoriesEntity;
import utils.HibernateUtils;

import java.io.FileNotFoundException;
import models.*;
import Service.*;

import java.util.UUID;

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
        getArticleByCateID();

    }

    public static void createData() {
        CategoriesEntity categoriesTD = new CategoriesEntity();
        categoriesTD.setCategoryName("thoisu");
        categoriesTD.setDescription("18+");
        //
        HibernateUtils hibernateUtils = new HibernateUtils(categoriesTD);
        hibernateUtils.saveEntity();
    }

    public static void getArticleByCateID() {
       Article userservice = new Article();
       ArticlesEntity userInfo = new ArticlesEntity();
       userInfo= (ArticlesEntity) userservice.getArticlesByCategoryID(UUID.fromString("bb2b8272-44cb-4c7b-b20e-6c41a5b898a0"));
       System.out.println(userInfo.getTitle());
    }
}
