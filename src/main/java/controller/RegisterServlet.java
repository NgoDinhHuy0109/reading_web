package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.AccountsEntity;
import models.UserInfoEntity;
import Service.Account;
import Service.User;

import java.io.IOException;

@WebServlet(name = "RegisterServlet", urlPatterns = {"/register"})
public class RegisterServlet extends HttpServlet {
    private final Account accountApplication = new Account(new AccountsEntity());
    private final User userApplication = new User(new UserInfoEntity());

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String url = "/sign_up.jsp";
            String action = request.getParameter("action");
            if (action == null) {
                action = "join";
            }
            if (action.equals("join")) {
                url = "/sign_up.jsp";
            }
            if (action.equals("SignUp")) {
                // Retrieve user inputs
                String fullName = request.getParameter("fullName");
                Long dateOfBirth = Long.valueOf(request.getParameter("dateOfBirth"));
                String email = request.getParameter("email");
                String phoneNumber = request.getParameter("phoneNumber");
                String userName = request.getParameter("userName");
                String password = request.getParameter("password");

                // Validate inputs
                if (userApplication.isEmailExists(email)) {
                    // Handle case where email already exists
                    url = "/sign_up_error.jsp";
                    request.setAttribute("error", "Email already exists");
                    //
                    //return;
                }
                if (userApplication.isPhoneNumberExists(phoneNumber)) {
                    // Handle case where email already exists
                    url = "/sign_up_error.jsp";
                    request.setAttribute("error1", "Phone number already exists");
                    //getServletContext().getRequestDispatcher(url).forward(request, response);
                    //return;
                }
                if (accountApplication.isAccountExists(userName)) {
                    // Handle case where email already exists
                    url = "/sign_up_error.jsp";
                    request.setAttribute("error2", "Username already exists");
                    getServletContext().getRequestDispatcher(url).forward(request, response);
                    return;
                }
                getServletContext().getRequestDispatcher(url).forward(request, response);
                // Add more specific validation as needed
                // Create UserInfoEntity and AccountsEntity
                UserInfoEntity userInfosEntity = new UserInfoEntity(fullName, dateOfBirth, email, phoneNumber);
                AccountsEntity accountsEntity = new AccountsEntity(userName, password);
                try {
                    // Create user account
                    accountApplication.createAccounts(accountsEntity);
                    // Create user information
                    userApplication.createUsers(userInfosEntity, accountsEntity.getAccountId());
                    url = "/sign_in.jsp";
                    getServletContext().getRequestDispatcher(url).forward(request, response);
                    return;
                } catch (Exception e) {
                    url = "/error_notification.jsp";
                    request.setAttribute("error", e.getMessage());
                }
            }
            getServletContext().getRequestDispatcher(url).forward(request, response);
        } catch (Exception e) {
            // Handle exceptions more gracefully, redirect to an error page
            response.sendRedirect(request.getContextPath() + "/error_notification.jsp?error=" + e.getMessage());
        }
    }

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);

    }
}
