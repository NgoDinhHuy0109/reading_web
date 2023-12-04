package models;
import jakarta.persistence.*;
import lombok.Getter;
import org.eclipse.persistence.jpa.jpql.parser.DateTime;

import java.io.Serializable;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;
import java.util.Objects;
import java.util.UUID;

@Entity
@Table(name = "userinfos", schema = "public", catalog = "backend-servlet")
public class UserInfoEntity implements Serializable{
    @Getter
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Id
    @Column(name = "userInfo_id",columnDefinition = "uuid")
    private UUID userInfoId;
    @Getter
    @Basic
    @Column(name = "fullName", nullable = false)
    private String fullName;
    @Getter
    @Basic
    @Column(name = "dateofBirth", nullable = false)
    private Long dateofBirth;
    @Getter
    @Basic
    @Column(name = "email", nullable = false)
    private String email;
    @Getter
    @Basic
    @Column(name = "phoneNumber", nullable = false)
    private String phoneNumber;
    @Getter
    @Basic
    @Column(name = "userImage")
    private String userImage;
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
    @OneToOne
    @JoinColumn(name = "account_id", nullable = false)
    private AccountsEntity accountsEntity;
    public UserInfoEntity() {}
    public UserInfoEntity(String fullName, Long dateofBirth, String email, String phoneNumber) {
        this.userInfoId = UUID.randomUUID();
        this.fullName = fullName;
        this.dateofBirth =dateofBirth;
        this.email = email;
        this.phoneNumber = phoneNumber;
    }

    public void setUserInfoId(UUID userInfoId) {
        this.userInfoId = userInfoId;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public void setDateofBirth(Long dateofBirth) {
        this.dateofBirth = dateofBirth;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public void setUserImage(String userImage) {
        this.userImage = userImage;
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
    public UserInfoEntity(String fullName, Long dateofBirth, String email, String phoneNumber, Long createdAt, Long updatedAt, Boolean isDeleted){
        this.fullName = fullName;
        this.dateofBirth =dateofBirth;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.isDeleted = isDeleted;
    }
    public UserInfoEntity(String fullName, Long dateofBirth, String email, String phoneNumber, Long createdAt, Long updatedAt, Boolean isDeleted, AccountsEntity accountsEntity){
        this.fullName = fullName;
        this.dateofBirth =dateofBirth;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.isDeleted = isDeleted;
        this.accountsEntity = accountsEntity;
    }
    public AccountsEntity getAccountsEntityiD(){return accountsEntity;}
    public void setAccountsEntityiD(AccountsEntity accountsEntityiD){this.accountsEntity = accountsEntityiD;}
    @Override
    public boolean equals(Object object) {
        if (this == object) return true;
        if (object == null || getClass() != object.getClass()) return false;

        UserInfoEntity that = (UserInfoEntity) object;

        if (!Objects.equals(userInfoId, that.userInfoId)) return false;
        if (fullName != null ? !fullName.equals(that.fullName) : that.fullName != null) return false;
        if (dateofBirth != null ? !dateofBirth.equals(that.dateofBirth) : that.dateofBirth != null) return false;
        if (email != null ? !email.equals(that.email) : that.email != null) return false;
        if (phoneNumber != null ? !phoneNumber.equals(that.phoneNumber) : that.phoneNumber != null) return false;
        if (createdAt != null ? !createdAt.equals(that.createdAt) : that.createdAt != null) return false;
        if (updatedAt != null ? !updatedAt.equals(that.updatedAt) : that.updatedAt != null) return false;
        if (isDeleted != null ? !isDeleted.equals(that.isDeleted) : that.isDeleted != null) return false;

        return true;
    }
    @Override
    public int hashCode() {
        return Objects.hash(userInfoId,fullName,dateofBirth,email,phoneNumber, createdAt, updatedAt, isDeleted);
    }

    @Override
    public String toString() {
        SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yy H:mm:ss");
        return "UserInfoEntity{" +
                "userInfoId=" + userInfoId +
                ", fullName='" + fullName + '\'' +
                ", dateofBirth='" + dateofBirth + '\'' +
                ", email='" + email + '\'' +
                ", phoneNumber='" + phoneNumber + '\'' +
                ", createdAt='" + (createdAt != null ? dateFormat.format(createdAt) : null) + '\'' +
                ", updatedAt='" + (updatedAt != null ? dateFormat.format(updatedAt) : null) + '\'' +
                ", isDeleted='" + isDeleted + '\'' +
                '}';
    }

    public void setAccountsEntity(AccountsEntity accountsEntity) {
        this.accountsEntity = accountsEntity;
    }

}
