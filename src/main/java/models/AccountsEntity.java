package models;
import jakarta.persistence.*;
import lombok.Getter;
import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Objects;
import java.util.UUID;
@Entity
@Table(name = "accounts",schema = "public",catalog = "reading-web")
public class  AccountsEntity implements Serializable  {
    @Getter
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Id
    @Column(name = "account_id",columnDefinition = "uuid")
    private UUID accountId;
    @Getter
    @Basic
    @Column(name = "userName",nullable = false,unique = true)
    private String userName;
    @Getter
    @Basic
    @Column(name = "password",nullable = false)
    private String password;
    @Getter
    @Basic
    @Column(name = "createdAt", nullable = false)
    private Long createdAt;
    @Getter
    @Basic
    @Column(name = "updatedAt", nullable = false)
    private Long updatedAt;
    @Basic
    @Column(name = "isDeleted", nullable = false)
    private Boolean isDeleted;
    @Getter
    @Basic
    @Column(name = "role", nullable = false)
    private String role;
    @OneToOne(mappedBy = "accountsEntity")
    private UserInfoEntity userInfoEntity;
    @Getter
    @OneToMany(mappedBy = "account")
    private Collection<ArticlesEntity> listArticle;
    @Getter
    @OneToOne(mappedBy = "accountRequest")
    private RequestsEntity requestsEntity;
    @Getter
    @OneToMany(mappedBy = "account")
    private Collection<CommentsEntity> listComment;
    public AccountsEntity(String userName){this.userName = userName;}

    public AccountsEntity() {

    }

    public void setAccountId(UUID accountId) {
        this.accountId = accountId;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setCreatedAt(Long createdAt) {
        this.createdAt = createdAt;
    }

    public void setUpdatedAt(Long updatedAt) {
        this.updatedAt = updatedAt;
    }
    public Boolean getDeleted() {
        return isDeleted;
    }
    public void setDeleted(Boolean deleted) {
        isDeleted = deleted;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public AccountsEntity(String userName, String password) {
        this.accountId = UUID.randomUUID();
        this.userName = userName;
        this.password = password;
    }
    @Override
    public int hashCode() {
        return Objects.hash(accountId,userName,password, createdAt, updatedAt, isDeleted);
    }

    public void setListArticle(Collection<ArticlesEntity> listArticle) {
        this.listArticle = listArticle;
    }
    public UserInfoEntity getUserInfoEntityId(){return userInfoEntity;}
    public void setUserInfoEntity(UserInfoEntity UserInforEntityId){this.userInfoEntity = UserInforEntityId;}
    @Override
    public String toString() {
        SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yy H:mm:ss");
        return "AccountsEntity{" +
                "AccountId=" + accountId +
                ", userName='" + userName + '\'' +
                ", password='" + password + '\'' +
                ", createdAt='" + (createdAt != null ? dateFormat.format(createdAt) : null) + '\'' +
                ", updatedAt='" + (updatedAt != null ? dateFormat.format(updatedAt) : null) + '\'' +
                ", isDeleted='" + isDeleted + '\'' +
                ", role='" + role + '\'' +
                '}';
    }
}
