package models;
import jakarta.persistence.*;
import lombok.Getter;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Objects;
import java.util.UUID;

@Entity
@Table(name = "articles", schema = "public", catalog = "reading-web")
public class ArticlesEntity implements Serializable{
    @Getter
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Id
    @Column(name = "article_id",columnDefinition = "uuid")
    private UUID articleId;
    @Getter
    @Basic
    @Column(name = "title", nullable = false)
    private String title;
    @Getter
    @Basic
    @Column(name = "titleImage", nullable = false)
    private String titleImage;
    @Getter
    @Basic
    @Column(name = "content", nullable = false)
    private String content;
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
    @Getter
    @ManyToOne
    @JoinColumn(name = "category_id", nullable = false)
    private CategoriesEntity category;
    @Getter
    @ManyToOne
    @JoinColumn(name = "account_id", nullable = false)
    private AccountsEntity account;
    @OneToMany(mappedBy = "article")
    private Collection<InteractionsEntity> listInteraction;
    @OneToMany(mappedBy = "article")
    private Collection<CommentsEntity> listComment;
    public ArticlesEntity() {
    }
    public void setArticleId(UUID articleId) {
        this.articleId = articleId;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    public void setContent(String content) {
        this.content = content;
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

    public void setTitleImage(String titleImage) {
        this.titleImage = titleImage;
    }


    public ArticlesEntity(String title, String titleImage, String content) {
        this.articleId = UUID.randomUUID();
        this.title = title;
        this.titleImage = titleImage;
        this.content = content;
    }

    public ArticlesEntity(String title, String content, Long createdAt, Long updatedAt, Boolean isDeleted, CategoriesEntity category, AccountsEntity account, Collection<InteractionsEntity> listInteraction) {
        this.title = title;
        this.content = content;
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
    public Collection<CommentsEntity> getCommentsByCommentId(){return listComment;}
    public void setCommentsByCommentId(Collection<CommentsEntity> commentsByCommentId){this.listComment = commentsByCommentId;}
    @Override
    public int hashCode() {
        return Objects.hash(articleId,title,content, createdAt, updatedAt, isDeleted);
    }
    @Override
    public String toString() {
        SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yy H:mm:ss");
        return "ProductsEntity{" +
                "articleId=" + articleId +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", createdAt='" + (createdAt != null ? dateFormat.format(createdAt) : null) + '\'' +
                ", updatedAt='" + (updatedAt != null ? dateFormat.format(updatedAt) : null) + '\'' +
                ", isDeleted='" + isDeleted + '\'' +
                ", categoriesByCategoryId=" + category +
                ", accountsByAccountId=" + account +
                ", interactionsByInteractionId=" + listInteraction +
                '}';
    }
    public void setCategoriesEntity(CategoriesEntity category){
        this.category = category;
    }
    public void setAccountsEntity(AccountsEntity account){
        this.account = account;
    }
}
