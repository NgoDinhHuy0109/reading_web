package DTO;

import models.CategoriesEntity;
import models.UserInfoEntity;

import java.text.SimpleDateFormat;

public class UserDTO {
    private final UserInfoEntity userInfo;
    private final String createdAtString;
    private final String updatedAtString;
    public UserDTO(UserInfoEntity userInfo) {
        this.userInfo = userInfo;
        SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yy H:mm:ss");
        this.createdAtString = (userInfo.getCreatedAt() != null) ? dateFormat.format(userInfo.getCreatedAt()) : null;
        this.updatedAtString = (userInfo.getUpdatedAt() != null) ? dateFormat.format(userInfo.getUpdatedAt()) : null;
    }
    public UserDTO (UserInfoEntity userInfo, String createdAtString, String updatedAtString) {
        this.userInfo = userInfo;
        this.createdAtString = createdAtString;
        this.updatedAtString = updatedAtString;
    }
    public UserInfoEntity getUserInfo() {
        return userInfo;
    }
    public String getCreatedAtString() {
        return createdAtString;
    }
    public String getUpdatedAtString() {
        return updatedAtString;
    }
}
