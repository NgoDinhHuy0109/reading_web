package models;
import jakarta.persistence.*;
import lombok.Getter;
import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Objects;
import java.util.UUID;

@Entity
@Table(name = "comments",schema = "public",catalog = "reading-web")
public class CommentsEntity implements Serializable{
    @Getter
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Id
    @Column(name = "comment_id",columnDefinition = "uuid")
    private UUID commentId;
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
    @OneToOne
    @JoinColumn(name = "interaction_id")
    private InteractionsEntity interaction;
    @Getter
    @ManyToOne
    @JoinColumn(name = "article_id", nullable = false)
    private ArticlesEntity article;
    @Getter
    @ManyToOne
    @JoinColumn(name = "account_id", nullable = false)
    private AccountsEntity account;
    public void setCommentId(UUID commentId){this.commentId = commentId;}

    public void setContent(String content) {this.content = content;}

    public void setCreatedAt(Long createdAt) {
        this.createdAt = createdAt;
    }

    public void setUpdatedAt(Long updatedAt) {
        this.updatedAt = updatedAt;
    }

    public void setIsDeleted(Boolean isDeleted) {
        this.isDeleted = isDeleted;
    }
    public CommentsEntity()
    {}
    public CommentsEntity(String content){
        this.commentId =UUID.randomUUID();
        this.content = content;
    }
    public CommentsEntity(String content,Long createdAt, Long updatedAt, Boolean isDeleted){
        this.content = content;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.isDeleted = isDeleted;
    }
    public CommentsEntity(String content,Long createdAt, Long updatedAt, Boolean isDeleted, InteractionsEntity interaction){
        this.content = content;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.isDeleted = isDeleted;
        this.interaction = interaction;
    }
    public InteractionsEntity getInteractionsByInteractionId(){return  interaction;}
    public void setInteractionsByInteractionId(InteractionsEntity interactionsByInteractionId){this.interaction = interactionsByInteractionId;}

    @Override
    public int hashCode() {
        return Objects.hash(commentId,content, createdAt, updatedAt, isDeleted);
    }
    @Override
    public String toString() {
        SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yy H:mm:ss");
        return "CommentsEntity{" +
                "commentId=" + commentId +
                ", content='" + content + '\'' +
                ", createdAt='" + (createdAt != null ? dateFormat.format(createdAt) : null) + '\'' +
                ", updatedAt='" + (updatedAt != null ? dateFormat.format(updatedAt) : null) + '\'' +
                ", isDeleted='" + isDeleted + '\'' +
                '}';
    }
    public void setInteractionsEntity(InteractionsEntity interaction){
        this.interaction = interaction;
    }
    public void setArticlesEntity(ArticlesEntity article){
        this.article = article;
    }
    public void setAccountsEntity(AccountsEntity account){
        this.account = account;
    }

}
