package Service;
import DTO.AccountDTO;
import com.google.gson.Gson;
import common_string.RoleString;
import models.AccountsEntity;
import org.hibernate.Session;
import org.hibernate.query.Query;
import utils.HibernateUtils;
import java.util.*;
import java.util.stream.Collectors;

public class Account extends HibernateUtils {
    public Account() {
        super(new AccountsEntity());
    }

    public Account(AccountsEntity object) {
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

    public void createAccounts(AccountsEntity newAcc) {
        try {
            UUID newAccId = UUID.randomUUID();
            newAcc.setAccountId(newAccId);

            Long current = System.currentTimeMillis();
            newAcc.setRole(RoleString.reader);
            newAcc.setCreatedAt(current);
            newAcc.setUpdatedAt(current);
            newAcc.setDeleted(false);

            Account account = new Account(newAcc);
            account.save();
        } catch (Exception error) {
            System.out.println("Error creating user: " + error);
        }
    }

    public boolean isAccountExists(String userName) {
        try {
            String query = "FROM AccountsEntity WHERE isDeleted = false AND userName = :userName";
            return !executeQueryWithParameter(query, "userName", userName).isEmpty();
        } catch (Exception e) {
            // Log the error using a logging framework
            throw new RuntimeException("Error checking account existence", e);
        }
    }
    public boolean isPasswordExists(String password) {
        try {
            String query = "FROM AccountsEntity WHERE isDeleted = false AND userName = :password";
            return !executeQueryWithParameter(query, "userName", password).isEmpty();
        } catch (Exception e) {
            // Log the error using a logging framework
            throw new RuntimeException("Error checking account existence", e);
        }
    }
    public List<AccountDTO> getAllAccount() {
        try {
            // Query the database to get all categories
            String query = "FROM AccountsEntity WHERE isDeleted = false"; // Assuming there's an 'isDeleted' field in CategoriesEntity
            List<AccountsEntity> account = executeQuery(query);
            // Return the list of formatted categories
            return formatDateTimeInAccounts(account);
        } catch (Exception error) {
            System.out.println("Error retrieving categories: " + error);
            return Collections.emptyList(); // Return an empty list in case of an error
        }
    }
    public AccountsEntity getAccount(String userName) {
        try {
            String query = "FROM AccountsEntity WHERE isDeleted = false and userName = :userName";
            return executeQueryWithParameter(query, "userName", userName)
                    .stream()
                    .findFirst()
                    .orElse(null);
        } catch (Exception error) {
            // Log the error instead of printing to the console
            System.out.println("Error retrieving categories: " + error);
            throw new RuntimeException("Error retrieving account", error);
        }
    }
    private List<AccountsEntity> executeQueryWithParameter(String query, String paramName, String paramValue) {
        try (Session session = getSessionFactory().openSession()) {
            Query<AccountsEntity> hqlQuery = session.createQuery(query, AccountsEntity.class);
            hqlQuery.setParameter(paramName, paramValue);
            return hqlQuery.getResultList();
        } catch (Exception e) {
            System.out.println("Error retrieving categories: " + e);
            throw new RuntimeException("Error executing query", e);
        }
    }
    private List<AccountsEntity> executeQuery(String query) {
        try (Session session = getSessionFactory().openSession()) {
            Query<AccountsEntity> hqlQuery = session.createQuery(query, AccountsEntity.class);
            return hqlQuery.getResultList();
        } catch (Exception e) {
            System.out.println("Error executing query: " + e);
            return Collections.emptyList(); // Return an empty list in case of an error
        }
    }
    private List<AccountDTO> formatDateTimeInAccounts(List<AccountsEntity> accounts) {
        return accounts.stream()
                .map(AccountDTO::new)
                .collect(Collectors.toList());
    }
}
