package DTO;
import java.text.SimpleDateFormat;
import lombok.Getter;
import models.ArticlesEntity;
import models.CommentsEntity;

@Getter
public class CommentDTO {
    private final CommentsEntity comment;
    private final String createdAtString;
    private final String updatedAtString;
    public CommentDTO(CommentsEntity comment){
        this.comment = comment;
        SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yy H:mm:ss");
        this.createdAtString = (comment.getCreatedAt() != null) ? dateFormat.format(comment.getCreatedAt()) : null;
        this.updatedAtString = (comment.getUpdatedAt() != null) ? dateFormat.format(comment.getUpdatedAt()) : null;
    }
    public CommentDTO(CommentsEntity comment, String createdAtString, String updatedAtString, String categoryName){
        this.comment = comment;
        this.createdAtString = createdAtString;
        this.updatedAtString = updatedAtString;
    }
}
