package models;
import jakarta.persistence.*;
import lombok.Getter;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Objects;
import java.util.UUID;

@Entity
@Table(name = "emotions", schema = "public", catalog = "reading-web")
public class EmotionsEntity implements Serializable  {
    @Getter
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Id
    @Column(name = "emotion_id",columnDefinition = "uuid")
    private UUID emotionId;
    @Getter
    @Basic
    @Column(name = "type", nullable = false,unique = true)
    private Boolean type;
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
    @JoinColumn(name = "interaction_id", nullable = false)
    private InteractionsEntity interaction;

    public void setEmotionId(UUID emotionId){this.emotionId = emotionId;}

    public void setType(Boolean type){this.type = type;}

    public void setCreatedAt(Long createdAt) {
        this.createdAt = createdAt;
    }

    public void setUpdatedAt(Long updatedAt) {
        this.updatedAt = updatedAt;
    }

    public void setIsDeleted(Boolean isDeleted) {
        this.isDeleted = isDeleted;
    }
    public EmotionsEntity(){}
    public EmotionsEntity(Boolean type, Long createdAt, Long updatedAt, Boolean isDeleted){
        this.type = type;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.isDeleted = isDeleted;
    }
    public EmotionsEntity(Boolean type, Long createdAt, Long updatedAt, Boolean isDeleted, InteractionsEntity interaction)
    {
        this.type = type;
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

        EmotionsEntity that = (EmotionsEntity) object;

        if (!Objects.equals(emotionId, that.emotionId)) return false;
        if (type != null ? !type.equals(that.type) : that.type != null) return false;
        if (createdAt != null ? !createdAt.equals(that.createdAt) : that.createdAt != null) return false;
        if (updatedAt != null ? !updatedAt.equals(that.updatedAt) : that.updatedAt != null) return false;
        if (isDeleted != null ? !isDeleted.equals(that.isDeleted) : that.isDeleted != null) return false;
//        if (categoryId != null ? !categoryId.equals(that.categoryId) : that.categoryId != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        return Objects.hash(emotionId,type, createdAt, updatedAt, isDeleted);
    }
    @Override
    public String toString() {
        SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yy H:mm:ss");
        return "EmotionsEntity{" +
                "emotionId=" + emotionId +
                ", type='" + type + '\'' +
                ", createdAt='" + (createdAt != null ? dateFormat.format(createdAt) : null) + '\'' +
                ", updatedAt='" + (updatedAt != null ? dateFormat.format(updatedAt) : null) + '\'' +
                ", isDeleted='" + isDeleted + '\'' +
                '}';
    }
}
