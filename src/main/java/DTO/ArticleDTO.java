package DTO;
import java.text.SimpleDateFormat;

import lombok.Getter;
import models.ArticlesEntity;
@Getter
public class ArticleDTO {
    private final ArticlesEntity article;
    private final String createdAtString;
    private final String updatedAtString;
    private final String categoryName;
    public ArticleDTO (ArticlesEntity article, String categoryName){
        this.article = article;
        this.categoryName = categoryName;
        SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yy H:mm:ss");
        this.createdAtString = (article.getCreatedAt() != null) ? dateFormat.format(article.getCreatedAt()) : null;
        this.updatedAtString = (article.getUpdatedAt() != null) ? dateFormat.format(article.getUpdatedAt()) : null;
    }
    public ArticleDTO(ArticlesEntity article, String createdAtString, String updatedAtString, String categoryName){
        this.article = article;
        this.createdAtString = createdAtString;
        this.updatedAtString = updatedAtString;
        this.categoryName = categoryName;
    }

}