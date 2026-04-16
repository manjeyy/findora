package com.landf.features.auth;

import java.io.IOException;
import java.util.Optional;

import com.auth0.jwt.interfaces.DecodedJWT;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebFilter(urlPatterns = {"/dashboard", "/admin/*", "/pages/dashboard/*"})
public class JwtAuthenticationFilter extends HttpFilter {

    private final JwtService jwtService = new JwtService();

    @Override
    protected void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        Optional<DecodedJWT> jwt = jwtService.resolveToken(request).flatMap(jwtService::verify);
        if (jwt.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/auth/login");
            return;
        }

        jwtService.applyClaimsToRequest(jwt.get(), request);
        chain.doFilter(request, response);
    }
}
