package controller;

import DTO.UserDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.AccountsEntity;
import models.UserInfoEntity;
import utils.Service.Account;
import utils.Service.User;

import java.awt.datatransfer.DataFlavor;
import java.io.IOException;
import java.util.List;
import java.util.Objects;

@WebServlet(name = "SignInServlet", urlPatterns = {"/SignInn"})
public class SignInServlet extends HttpServlet {
    private final Account accountApplication = new Account(new AccountsEntity());
    private final User userApplication = new User(new UserInfoEntity());
    AccountsEntity accounts = new AccountsEntity();
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{
            String url = "/sign_in.jsp";
            String action = request.getParameter("action");
            if (action == null) {
                action = "join";
            }
            if (action.equals("join")) {
                url = "/sign_in.jsp";
            }
            if (action.equals("SignIn")) {
                // Retrieve user inputs
                String userName = request.getParameter("userName");
                String password = request.getParameter("password");

                try {
                    accounts=accountApplication.getAccount(userName);
                    if(Objects.equals(accounts, null))
                    {
                        url = "/sign_in_error.jsp";
                        request.setAttribute("error", "Wrong Username or password");
                        getServletContext().getRequestDispatcher(url).forward(request, response);
                        return;
                    }
                    if(Objects.equals(accounts.getUserName(), userName))
                    {
                        if(Objects.equals(accounts.getPassword(), password))
                        {
                            if(accounts.getAdmin()==Boolean.TRUE)
                            {
                                url="/dashboard.jsp";
                                List<UserDTO> userDTOList = userApplication.getUsersByAccountName(userName);
                            }
                            else
                            {
                                url="/news_page/index.jsp";
                            }
                        }
                        else {
                            url = "/sign_in_error.jsp";
                            request.setAttribute("error", "Wrong Username or password");
                            getServletContext().getRequestDispatcher(url).forward(request, response);
                            return;
                        }
                    }
                    getServletContext().getRequestDispatcher(url).forward(request, response);
                    // Create user information
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
