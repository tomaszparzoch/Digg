package filter;

import model.User;
import service.UserService;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

@WebFilter("/*")
public class LoginFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest httpReq = (HttpServletRequest) req;
        if(httpReq.getUserPrincipal() != null && httpReq.getSession().getAttribute("user") == null){
            saveUserInSession(httpReq);
        }
        chain.doFilter(req, resp);
    }

    private void saveUserInSession(HttpServletRequest req){
        UserService userService = new UserService();
        String username = req.getUserPrincipal().getName();
        User userByUsername = userService.getUserByUsername(username);
        req.getSession(true).setAttribute("user", userByUsername);
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
