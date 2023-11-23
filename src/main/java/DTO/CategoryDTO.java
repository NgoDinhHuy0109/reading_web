package DTO;
import java.text.SimpleDateFormat;
import models.CategoriesEntity;
import utils.Service.Category;
public class CategoryDTO {

    private final CategoriesEntity category;
    private final String createdAtString;
    private final String updatedAtString;

    public CategoryDTO(CategoriesEntity category) {
        this.category = category;
        SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yy H:mm:ss");
        this.createdAtString = (category.getCreatedAt() != null) ? dateFormat.format(category.getCreatedAt()) : null;
        this.updatedAtString = (category.getUpdatedAt() != null) ? dateFormat.format(category.getUpdatedAt()) : null;
    }
    public CategoryDTO(CategoriesEntity category, String createdAtString, String updatedAtString) {
        this.category = category;
        this.createdAtString = createdAtString;
        this.updatedAtString = updatedAtString;
    }
    public CategoriesEntity getCategory() {
        return category;
    }
    public String getCreatedAtString() {
        return createdAtString;
    }
    public String getUpdatedAtString() {
        return updatedAtString;
    }
}
