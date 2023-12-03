package DTO;

import models.AccountsEntity;
import models.CategoriesEntity;

import java.text.SimpleDateFormat;

public class AccountDTO {
    private final AccountsEntity accounts;
    private final String createdAtString;
    private final String updatedAtString;
    public AccountDTO(AccountsEntity accounts) {
        this.accounts = accounts;
        SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yy H:mm:ss");
        this.createdAtString = (accounts.getCreatedAt() != null) ? dateFormat.format(accounts.getCreatedAt()) : null;
        this.updatedAtString = (accounts.getUpdatedAt() != null) ? dateFormat.format(accounts.getUpdatedAt()) : null;
    }
    public AccountDTO(AccountsEntity accounts, String createdAtString, String updatedAtString) {
        this.accounts = accounts;
        this.createdAtString = createdAtString;
        this.updatedAtString = updatedAtString;
    }
    public AccountsEntity getAccounts() {
        return accounts;
    }
    public String getCreatedAtString() {
        return createdAtString;
    }
    public String getUpdatedAtString() {
        return updatedAtString;
    }
}
