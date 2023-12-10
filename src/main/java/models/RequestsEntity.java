package models;

import jakarta.persistence.*;
import lombok.Builder;
import lombok.Getter;

import java.io.Serializable;
import java.util.UUID;
@Entity
@Table(name = "requests",schema = "public",catalog = "reading-web")
public class RequestsEntity implements Serializable {
    @Getter
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Id
    @Column(name = "request_id",columnDefinition = "uuid")
    private UUID requestId;
    @Basic
    @Column(name = "isAccepted", nullable = false)
    private Boolean isAccepted;
    @Getter
    @Basic
    @Column(name = "createdAt", nullable = false)
    private Long createdAt;
    @Getter
    @Basic
    @Column(name = "updatedAt", nullable = false)
    private Long updatedAt;
    @Getter
    @OneToOne
    @JoinColumn(name = "account_id", nullable = false)
    private AccountsEntity accountRequest;

    public void setRequestId(UUID requestId) {
        this.requestId = requestId;
    }

    public Boolean getAccepted() {
        return isAccepted;
    }

    public void setAccepted(Boolean accepted) {
        isAccepted = accepted;
    }

    public void setCreatedAt(Long createdAt) {
        this.createdAt = createdAt;
    }

    public void setUpdatedAt(Long updatedAt) {
        this.updatedAt = updatedAt;
    }

    public void setAccountRequest(AccountsEntity accountRequest) {
        this.accountRequest = accountRequest;
    }

    public RequestsEntity() {

    }
}
