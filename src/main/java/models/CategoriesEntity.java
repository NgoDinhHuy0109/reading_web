package models;
import jakarta.persistence.*;
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
    @GeneratedValue(strategy= GenerationType.AUTO)
    @Id
    @Column(name = "category_id",columnDefinition = "uuid")
    private UUID categoryId;
    @Basic
    @Column(name = "categoryName", nullable = false, unique = true)
    private String categoryName;
    @Basic
    @Column(name = "description", nullable = false,columnDefinition = "TEXT")
    private String description;
    @Basic
    @Column(name = "createdAt", nullable = false)
    private Long createdAt;
    @Basic
    @Column(name = "updatedAt", nullable = false)
    private Long updatedAt;
    @Basic
    @Column(name = "isDeleted", nullable = false)
    private Boolean isDeleted;
    public CategoriesEntity() {}
    public CategoriesEntity(String categoryName) { this.categoryName = categoryName; }
    @OneToMany(mappedBy = "category")
    private Collection<ArticlesEntity> listArticle;
    public UUID getCategoryId() { return categoryId;}
    public void setCategoryId(UUID categoryId) {
        this.categoryId = categoryId;
    }
    public String getCategoryName() { return categoryName; }
    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }
    public  String getDescription() { return description; }
    public void setDescription(String description) {
        this.description = description;
    }
    public Long getCreatedAt() {return createdAt; }
    public void setCreatedAt(Long createdAt) {
        this.createdAt = createdAt;
    }
    public Long getUpdatedAt() {return updatedAt; }
    public void setUpdatedAt(Long updatedAt) {
        this.updatedAt = updatedAt;
    }
    public Boolean getIsDeleted () {return isDeleted; }
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
    public boolean equals(Object object) {
        if (this == object) return true;
        if (object == null || getClass() != object.getClass()) return false;
        CategoriesEntity that = (CategoriesEntity) object;
        if (!Objects.equals(categoryId, that.categoryId)) return false;
        if (categoryName != null ? !categoryName.equals(that.categoryName) : that.categoryName != null) return false;
        if (description != null ? !description.equals(that.description) : that.description != null) return false;
        if (createdAt != null ? !createdAt.equals(that.createdAt) : that.createdAt != null) return false;
        if (updatedAt != null ? !updatedAt.equals(that.updatedAt) : that.updatedAt != null) return false;
        if (isDeleted != null ? !isDeleted.equals(that.isDeleted) : that.isDeleted != null) return false;

        return true;
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
