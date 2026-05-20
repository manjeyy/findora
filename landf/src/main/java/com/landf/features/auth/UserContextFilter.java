package com.landf.features.auth;

import java.io.IOException;
import java.util.Optional;

import com.auth0.jwt.interfaces.DecodedJWT;
import com.landf.features.user.UserDAO;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebFilter(urlPatterns = {"/*"})
public class UserContextFilter extends HttpFilter {

    private final JwtService jwtService = new JwtService();

    @Override
    protected void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
            throws IOException, ServletException {


        Optional<DecodedJWT> jwt = jwtService.resolveToken(request).flatMap(jwtService::verify);
        if (jwt.isPresent()) {
            DecodedJWT decoded = jwt.get();
            jwtService.applyClaimsToRequest(decoded, request);


            HttpSession session = request.getSession(true);
            int userId = decoded.getClaim("userId").asInt();
            session.setAttribute("userId", userId);
            session.setAttribute("username", decoded.getSubject());
            session.setAttribute("role", decoded.getClaim("role").asString());

            if (session.getAttribute("profilePhoto") == null) {
                try {
                    new UserDAO().findById(userId).ifPresent(user -> {
                        session.setAttribute("profilePhoto", user.getProfilePhoto());
                    });
                } catch (Exception e) {

                }
            }
        }

        chain.doFilter(request, response);
    }
}
