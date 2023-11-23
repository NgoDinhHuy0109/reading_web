package models;
import jakarta.persistence.*;
import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Objects;
import java.util.UUID;

@Entity
@Table(name = "comments",schema = "public",catalog = "reading-web")
public class CommentsEntity implements Serializable{
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Id
    @Column(name = "comment_id",columnDefinition = "uuid")
    private UUID commentId;
    @Basic
    @Column(name = "content", nullable = false, unique = true)
    private String content;
    @Basic
    @Column(name = "createdAt", nullable = false)
    private Long createdAt;
    @Basic
    @Column(name = "updatedAt", nullable = false)
    private Long updatedAt;
    @Basic
    @Column(name = "isDeleted", nullable = false)
    private Boolean isDeleted;
    @OneToOne
    @JoinColumn(name = "interaction_id", nullable = false)
    private InteractionsEntity interaction;

    public UUID getCommentId(){return commentId;}
    public void setCommentId(UUID commentId){this.commentId = commentId;}

    public String getContent(){return content;}
    public void setContent(String content) {this.content = content;}

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


    public CommentsEntity(){}
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
    public boolean equals(Object object) {
        if (this == object) return true;
        if (object == null || getClass() != object.getClass()) return false;

        CommentsEntity that = (CommentsEntity) object;

        if (!Objects.equals(commentId, that.commentId)) return false;
        if (content != null ? !content.equals(that.content) : that.content != null) return false;
        if (createdAt != null ? !createdAt.equals(that.createdAt) : that.createdAt != null) return false;
        if (updatedAt != null ? !updatedAt.equals(that.updatedAt) : that.updatedAt != null) return false;
        if (isDeleted != null ? !isDeleted.equals(that.isDeleted) : that.isDeleted != null) return false;
//        if (categoryId != null ? !categoryId.equals(that.categoryId) : that.categoryId != null) return false;

        return true;
    }

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

}
