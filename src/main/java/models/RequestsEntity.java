package models;

import jakarta.persistence.*;
import lombok.Builder;

import java.io.Serializable;
import java.util.UUID;
@Entity
@Table(name = "requests",schema = "public",catalog = "reading-web")
public class RequestsEntity implements Serializable {
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Id
    @Column(name = "request_id",columnDefinition = "uuid")
    private UUID requestId;
    @Basic
    @Column(name = "isAccepted", nullable = false)
    private Boolean isAccepted;
    @Basic
    @Column(name = "createdAt", nullable = false)
    private Long createdAt;
    @Basic
    @Column(name = "updatedAt", nullable = false)
    private Long updatedAt;
    @OneToOne
    @JoinColumn(name = "account_id", nullable = false)
    private AccountsEntity accountRequest;

    public RequestsEntity() {

    }
}
