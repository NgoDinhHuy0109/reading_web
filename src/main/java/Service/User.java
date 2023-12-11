package Service;

import DTO.UserDTO;
import com.google.gson.Gson;
import models.AccountsEntity;
import models.CategoriesEntity;
import models.UserInfoEntity;
import org.hibernate.Session;
import org.hibernate.query.Query;
import utils.HibernateUtils;

import java.util.Collections;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

public class   User extends HibernateUtils {
    public User() {
        super(new UserInfoEntity());
    }
    public User(UserInfoEntity object) {
        super(object);
    }
    public void save(){
        Gson responseJson = new Gson();
        try {
            super.saveEntity();
        }
        catch (Exception error)
        {
            System.out.println(error);
        }
    }
    public void createUsers(UserInfoEntity newUser, UUID accountId) {
        try {
            UUID userId = UUID.randomUUID();
            newUser.setUserInfoId(userId);
            Long current = System.currentTimeMillis();
            AccountsEntity account = getEntityById(AccountsEntity.class, accountId);
            newUser.setCreatedAt(current);
            newUser.setUpdatedAt(current);
            newUser.setAccountsEntity(account);
            newUser.setDeleted(false);
            User user = new User(newUser);
            user.save();
        } catch (Exception error) {
            System.out.println("Error creating user: " + error);
        }
    }
    public List<UserDTO> getUsersByAccountName(String accountName) {
        try {
            // Query the database to get the user by account name
            String query = "FROM UserInfoEntity u JOIN FETCH u.accountsEntity a WHERE u.isDeleted = false AND a.userName = :accountName";
            List<UserInfoEntity> users = executeQueryWithParameter(query, "accountName", accountName);
            return formatDateTimeInUsers(users);
        } catch (Exception error) {
            // Log the error using a logging framework
            System.out.println("Error creating user: " + error);
            return Collections.emptyList();
        }
    }
    public UserInfoEntity getUserById(UUID categoryId) {
        try {
            // Retrieve the category by its ID
            return (UserInfoEntity) getEntityById(UserInfoEntity.class, categoryId);
        } catch (Exception error) {
            System.out.println("Error retrieving category by ID: " + error);
            return null; // Return null in case of an error
        }
    }
    public boolean isEmailExists(String email) {
        try {
            String query = "FROM UserInfoEntity WHERE isDeleted = false AND email = :email";
            return !executeQueryWithParameter(query, "email", email).isEmpty();
        } catch (Exception e) {
            // Log the error using a logging framework
            throw new RuntimeException("Error checking email existence", e);
        }
    }
    public boolean isPhoneNumberExists(String phoneNumber) {
        try {
            String query = "FROM UserInfoEntity WHERE isDeleted = false AND phoneNumber = :phoneNumber";
            return !executeQueryWithParameter(query, "phoneNumber", phoneNumber).isEmpty();
        } catch (Exception e) {
            // Log the error using a logging framework
            throw new RuntimeException("Error checking phone number existence", e);
        }
    }
    private List<UserInfoEntity> executeQueryWithParameter(String query, String paramName, String paramValue) {
        try (Session session = getSessionFactory().openSession()) {
            Query<UserInfoEntity> hqlQuery = session.createQuery(query, UserInfoEntity.class);
            hqlQuery.setParameter(paramName, paramValue);
            return hqlQuery.getResultList();
        } catch (Exception e) {
            // Log the error instead of printing to the console
            System.out.println("Error executing query with parameter: " + e);
            return Collections.emptyList();
        }
    }
    private List<UserDTO> formatDateTimeInUsers(List<UserInfoEntity> users) {
        return users.stream()
                .map(UserDTO::new)
                .collect(Collectors.toList());
    }

    public UserInfoEntity getUser(String fullName) {
        try {
            String query = "FROM UserInfoEntity WHERE isDeleted = false and fullName = :fullName";
            return executeQuerysWithParameter(query, "fullName", fullName)
                    .stream()
                    .findFirst()
                    .orElse(null);
        } catch (Exception error) {
            // Log the error instead of printing to the console
            System.out.println("Error retrieving categories: " + error);
            throw new RuntimeException("Error retrieving account", error);
        }
    }
    private List<UserInfoEntity> executeQuerysWithParameter(String query, String paramName, String paramValue) {
        try (Session session = getSessionFactory().openSession()) {
            Query<UserInfoEntity> hqlQuery = session.createQuery(query, UserInfoEntity.class);
            hqlQuery.setParameter(paramName, paramValue);
            return hqlQuery.getResultList();
        } catch (Exception e) {
            System.out.println("Error retrieving categories: " + e);
            throw new RuntimeException("Error executing query", e);
        }
    }
}
