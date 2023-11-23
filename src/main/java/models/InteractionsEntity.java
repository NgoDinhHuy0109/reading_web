package models;
import jakarta.persistence.*;
import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Objects;
import java.util.UUID;

@Entity
@Table(name = "interactions", schema = "public", catalog = "reading-web")
public class InteractionsEntity implements Serializable{
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Id
    @Column(name = "interaction_id",columnDefinition = "uuid")
    private UUID interactionId;
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
    @JoinColumn(name = "article_id", nullable = false)
    private ArticlesEntity article;
    @ManyToOne
    @JoinColumn(name = "account_id", nullable = false)
    private AccountsEntity acount;

    @OneToOne(mappedBy = "interaction")
    private EmotionsEntity emotion;
    @OneToOne(mappedBy = "interaction")
    private CommentsEntity comment;

    public InteractionsEntity(){}
    public InteractionsEntity(Long createdAt, Long updatedAt, Boolean isDeleted){
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.isDeleted = isDeleted;
    }
    public ArticlesEntity getArticlesByArticleId(){return article;}
    public void setArticlesByArticleId(ArticlesEntity articlesByArticleId) {this.article = articlesByArticleId;}
    public AccountsEntity getAccountsByAccountId(){return acount;}
    public void setAccountsByAccountId(AccountsEntity accountsByAccountId){this.acount= accountsByAccountId;}
    public EmotionsEntity getEmotionsByEmotionId(){return emotion;}
    public void setEmotionsByEmotionId(EmotionsEntity emotionsByEmotionId){this.emotion = emotionsByEmotionId;}

    public CommentsEntity getCommentsByCommentId(){return comment;}
    public void setCommentsByCommentId(CommentsEntity commentsByCommentId){this.comment = commentsByCommentId;}

    @Override
    public boolean equals(Object object) {
        if (this == object) return true;
        if (object == null || getClass() != object.getClass()) return false;

        InteractionsEntity that = (InteractionsEntity) object;

        if (!Objects.equals(interactionId, that.interactionId)) return false;
        if (createdAt != null ? !createdAt.equals(that.createdAt) : that.createdAt != null) return false;
        if (updatedAt != null ? !updatedAt.equals(that.updatedAt) : that.updatedAt != null) return false;
        if (isDeleted != null ? !isDeleted.equals(that.isDeleted) : that.isDeleted != null) return false;

        return true;
    }
    @Override
    public int hashCode() {
        return Objects.hash(interactionId, createdAt, updatedAt, isDeleted);
    }
    @Override
    public String toString() {
        SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yy H:mm:ss");
        return "InteractionsEntity{" +
                "interactionId=" + interactionId +
                ", createdAt='" + (createdAt != null ? dateFormat.format(createdAt) : null) + '\'' +
                ", updatedAt='" + (updatedAt != null ? dateFormat.format(updatedAt) : null) + '\'' +
                ", isDeleted='" + isDeleted + '\'' +
                '}';
    }

}
