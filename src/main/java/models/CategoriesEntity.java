package models;
import jakarta.persistence.*;
import lombok.Getter;
import org.hibernate.annotations.GenericGenerator;
import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.List;
import java.util.UUID;
import java.util.Objects;
@Entity
@Table(name = "categories", schema = "public", catalog = "reading-web")
public class CategoriesEntity implements Serializable{
    @Getter
    @GeneratedValue(strategy= GenerationType.AUTO)
    @Id
    @Column(name = "category_id",columnDefinition = "uuid")
    private UUID categoryId;
    @Getter
    @Basic
    @Column(name = "categoryName", nullable = false)
    private String categoryName;
    @Getter
    @Basic
    @Column(name = "description", nullable = false,columnDefinition = "TEXT")
    private String description;
    @Getter
    @Basic
    @Column(name = "createdAt", nullable = false)
    private Long createdAt;
    @Getter
    @Basic
    @Column(name = "updatedAt", nullable = false)
    private Long updatedAt;
    @Getter
    @Basic
    @Column(name = "isDeleted", nullable = false)
    private Boolean isDeleted;
    public CategoriesEntity() {}
    public CategoriesEntity(String categoryName) { this.categoryName = categoryName; }
    @OneToMany(mappedBy = "category")
    private Collection<ArticlesEntity> listArticle;

    public void setCategoryId(UUID categoryId) {
        this.categoryId = categoryId;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setCreatedAt(Long createdAt) {
        this.createdAt = createdAt;
    }

    public void setUpdatedAt(Long updatedAt) {
        this.updatedAt = updatedAt;
    }

    public void setIsDeleted(Boolean isDeleted) {
        this.isDeleted = isDeleted;
    }
    public CategoriesEntity (String categoryName, String description){
        this.categoryId = UUID.randomUUID();
        this.categoryName = categoryName;
        this.description = description;
    }
    public CategoriesEntity(String categoryName,String description, Long createdAt, Long updatedAt, Boolean isDeleted){
        this.categoryId = UUID.randomUUID();
        this.categoryName = categoryName;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.isDeleted = isDeleted;
    }
    public CategoriesEntity(String categoryName, String description, Long createdAt, Long updatedAt, Boolean isDeleted, Collection<ArticlesEntity> listArticle){
        this.categoryId = UUID.randomUUID();
        this.categoryName = categoryName;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.isDeleted = isDeleted;
        this.listArticle = listArticle;
    }
    @Override
    public int hashCode() {
        return Objects.hash(categoryId, categoryName, description, createdAt, updatedAt, isDeleted);
    }
    public Collection<ArticlesEntity> getProductsByCategoryId() {
        return listArticle;
    }
    public void setProductsByCategoryId(Collection<ArticlesEntity> productsByCategoryId) {
        this.listArticle = productsByCategoryId;
    }
    @Override
    public String toString() {
        SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yy H:mm:ss");
        return "CategoriesEntity{" +
                "categoryId=" + categoryId +
                ", categoryName='" + categoryName + '\'' +
                ", description='" + description + '\'' +
                ", createdAt='" + (createdAt != null ? dateFormat.format(createdAt) : null) + '\'' +
                ", updatedAt='" + (updatedAt != null ? dateFormat.format(updatedAt) : null) + '\'' +
                ", isDeleted='" + isDeleted + '\'' +
                '}';
    }
}
