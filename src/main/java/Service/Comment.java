package Service;
import utils.HibernateUtils;
import org.hibernate.query.Query;
import java.util.UUID;
import java.util.stream.Collectors;
import DTO.*;
import java.util.Collections;
import java.util.List;
import com.google.gson.Gson;
import models.*;
import org.hibernate.Session;
public class Comment extends HibernateUtils {
    public Comment() {
        super(new CommentsEntity());
    }

    public Comment(CommentsEntity object) {
        super(object);
    }
    public void save() {
        Gson responseJson = new Gson();
        try {
            super.saveEntity();
        } catch (Exception error) {
            System.out.println(error);
        }
    }
    public void createComment(CommentsEntity newComment, UUID articleId, UUID accountId){
        try{
            UUID commentId = UUID.randomUUID();
            newComment.setCommentId(commentId);
            ArticlesEntity article = getEntityById(ArticlesEntity.class,articleId);
            AccountsEntity account = getEntityById(AccountsEntity.class,accountId);
            Long current = System.currentTimeMillis();
            newComment.setCreatedAt(current);
            newComment.setUpdatedAt(current);
            newComment.setArticlesEntity(article);
            newComment.setAccountsEntity(account);
            newComment.setIsDeleted(false);
            Comment comment = new Comment(newComment);
            comment.save();
        }catch (Exception e){
            System.out.println("Error creating comment" + e);
        }
    }
    public List<CommentDTO> getCommentsByArticleId(UUID articleID){
        try{
            String query = "SELECT c FROM CommentsEntity c WHERE c.isDeleted = false AND c.article.articleId = :articleId";
            List<CommentsEntity> comments = executeQueryWithParameter(query,"articleId",articleID);
            return formatDateTimeInComments(comments);

        }catch (Exception error) {
            System.out.println("Error retrieving comments by article ID: " + error);
            return Collections.emptyList();
        }
    }
    private List<CommentsEntity> executeQueryWithParameter(String query, String paramName, UUID paramValue) {
        try (Session session = getSessionFactory().openSession()) {
            Query<CommentsEntity> hqlQuery = session.createQuery(query, CommentsEntity.class);
            hqlQuery.setParameter(paramName, paramValue);
            return hqlQuery.getResultList();
        } catch (Exception e) {
            System.out.println("Error executing query with parameter: " + e);
            return Collections.emptyList(); // Return an empty list in case of an error
        }
    }
    private List<CommentDTO> formatDateTimeInComments(List<CommentsEntity> comments) {
        return comments.stream()
                .map(comment -> new CommentDTO(comment))
                .collect(Collectors.toList());
    }



}
