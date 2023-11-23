package models;
import jakarta.persistence.*;
import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Objects;
import java.util.UUID;

@Entity
@Table(name = "articles", schema = "public", catalog = "reading-web")
public class ArticlesEntity implements Serializable{
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Id
    @Column(name = "article_id",columnDefinition = "uuid")
    private UUID articleId;
    @Basic
    @Column(name = "title", nullable = false, unique = true)
    private String title;
    @Basic
    @Column(name = "content", nullable = false)
    private String content;
    @Basic
    @Column(name = "author", nullable = false)
    private String author;
    @Basic
    @Column(name = "createdAt", nullable = false)
    private Long createdAt;
    @Basic
    @Column(name = "updatedAt", nullable = false)
    private Long updatedAt;
    @Basic
    @Column(name = "isDeleted", nullable = false)
    private Boolean isDeleted;
    @ManyToOne
    @JoinColumn(name = "category_id", nullable = false)
    private CategoriesEntity category;
    @ManyToOne
    @JoinColumn(name = "account_id", nullable = false)
    private AccountsEntity account;
    @OneToMany(mappedBy = "article")
    private Collection<InteractionsEntity> listInteraction;
    public ArticlesEntity() {
    }
    public UUID getArticleId() { return articleId; }
    public void setArticleId(UUID articleId) {
        this.articleId = articleId;
    }
    public String getTitle() { return title; }
    public void setTitle(String title) {
        this.title = title;
    }
    public String getContent() { return content; }
    public void setContent(String content) {
        this.content = content;
    }
    public String getAuthor() { return author; }
    public void setAuthor(String author) {
        this.author = author;
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
    public ArticlesEntity(String title, String content, String author, Long createdAt, Long updatedAt, Boolean isDeleted) {
        this.title = title;
        this.content = content;
        this.author = author;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.isDeleted = isDeleted;
    }

    public ArticlesEntity(String title, String content, String author, Long createdAt, Long updatedAt, Boolean isDeleted, CategoriesEntity category, AccountsEntity account, Collection<InteractionsEntity> listInteraction) {
        this.title = title;
        this.content = content;
        this.author = author;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.isDeleted = isDeleted;
        this.category = category;
        this.account = account;
        this.listInteraction = listInteraction;
    }
    public CategoriesEntity getCategoriesByCategoryId() {
        return category;
    }

    public void setCategoriesByCategoryId(CategoriesEntity categoriesByCategoryId) {
        this.category = categoriesByCategoryId;
    }
    public AccountsEntity getAccountsByAccountId(){return account;}
    public void setAccountsByAccountId(AccountsEntity accountsByAccountId){this.account = accountsByAccountId;}

    public Collection<InteractionsEntity> getInteractionsByInteractionId(){return listInteraction;}
    public void setInteractionsByInteractionId(Collection<InteractionsEntity> interactionsByInteractionId){this. listInteraction= interactionsByInteractionId;}
    @Override
    public boolean equals(Object object) {
        if (this == object) return true;
        if (object == null || getClass() != object.getClass()) return false;

        ArticlesEntity that = (ArticlesEntity) object;

        if (!Objects.equals(articleId, that.articleId)) return false;
        if (title != null ? !title.equals(that.title) : that.title != null) return false;
        if (content != null ? !content.equals(that.content) : that.content != null) return false;
        if (author != null ? !author.equals(that.author) : that.author != null) return false;
        if (createdAt != null ? !createdAt.equals(that.createdAt) : that.createdAt != null) return false;
        if (updatedAt != null ? !updatedAt.equals(that.updatedAt) : that.updatedAt != null) return false;
        if (isDeleted != null ? !isDeleted.equals(that.isDeleted) : that.isDeleted != null) return false;
//        if (categoryId != null ? !categoryId.equals(that.categoryId) : that.categoryId != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        return Objects.hash(articleId,title,content,author, createdAt, updatedAt, isDeleted);
    }
    @Override
    public String toString() {
        SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yy H:mm:ss");
        return "ProductsEntity{" +
                "articleId=" + articleId +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", author=" + author + '\'' +
                ", createdAt='" + (createdAt != null ? dateFormat.format(createdAt) : null) + '\'' +
                ", updatedAt='" + (updatedAt != null ? dateFormat.format(updatedAt) : null) + '\'' +
                ", isDeleted='" + isDeleted + '\'' +
                ", categoriesByCategoryId=" + category +
                ", accountsByAccountId=" + account +
                ", interactionsByInteractionId=" + listInteraction +
                '}';
    }
}
