package models;
import jakarta.persistence.*;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Objects;
import java.util.UUID;

@Entity
@Table(name = "accounts",schema = "public",catalog = "reading-web")
public class  AccountsEntity implements Serializable  {
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Id
    @Column(name = "account_id",columnDefinition = "uuid")
    private UUID accountId;
    @Basic
    @Column(name = "userName",nullable = false,unique = true)
    private String userName;
    @Basic
    @Column(name = "password",nullable = false)
    private String password;
    @Basic
    @Column(name = "isAdmin", nullable = false)
    private Boolean isAdmin;
    @Basic
    @Column(name = "createdAt", nullable = false)
    private Long createdAt;
    @Basic
    @Column(name = "updatedAt", nullable = false)
    private Long updatedAt;
    @Basic
    @Column(name = "isDeleted", nullable = false)
    private Boolean isDeleted;
    @OneToOne(mappedBy = "accountsEntity")
    private UserInfoEntity userInfoEntity;
    @OneToMany(mappedBy = "account")
    private Collection<ArticlesEntity> listArticle;
    public AccountsEntity(){}
    public AccountsEntity(String userName){this.userName = userName;}

    public UUID getAccountId() {
        return accountId;
    }

    public void setAccountId(UUID accountId) {
        this.accountId = accountId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Boolean getAdmin() {
        return isAdmin;
    }

    public void setAdmin(Boolean admin) {
        isAdmin = admin;
    }

    public Long getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Long createdAt) {
        this.createdAt = createdAt;
    }

    public Long getUpdatedAt() {
        return updatedAt;
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
    @Override
    public boolean equals(Object object) {
        if (this == object) return true;
        if (object == null || getClass() != object.getClass()) return false;

        AccountsEntity that = (AccountsEntity) object;

        if (!Objects.equals(accountId, that.accountId)) return false;
        if (userName != null ? !userName.equals(that.userName) : that.userName != null) return false;
        if (password != null ? !password.equals(that.password) : that.password != null) return false;
        if (createdAt != null ? !createdAt.equals(that.createdAt) : that.createdAt != null) return false;
        if (updatedAt != null ? !updatedAt.equals(that.updatedAt) : that.updatedAt != null) return false;
        if (isDeleted != null ? !isDeleted.equals(that.isDeleted) : that.isDeleted != null) return false;

        return true;
    }
    @Override
    public int hashCode() {
        return Objects.hash(accountId,userName,password, createdAt, updatedAt, isDeleted);
    }
    public Collection<ArticlesEntity> getListArticle() {
        return listArticle;
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
                "categoryId=" + accountId +
                ", userName='" + userName + '\'' +
                ", password='" + password + '\'' +
                ", createdAt='" + (createdAt != null ? dateFormat.format(createdAt) : null) + '\'' +
                ", updatedAt='" + (updatedAt != null ? dateFormat.format(updatedAt) : null) + '\'' +
                ", isDeleted='" + isDeleted + '\'' +
                '}';
    }
}
