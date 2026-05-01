package com.landf.features.auth.guards;

import com.auth0.jwt.interfaces.DecodedJWT;
import com.landf.features.auth.JwtService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Optional;

public class RoleGuard {

    public boolean hasRole(String requiredRole,
                           HttpServletRequest req,
                           HttpServletResponse res) throws IOException {

        JwtService jwtService = new JwtService();

        Optional<DecodedJWT> jwtOpt =
                jwtService.resolveToken(req)
                        .flatMap(jwtService::verify);

        if (jwtOpt.isEmpty()) {
            res.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            res.getWriter().write("{\"error\":\"Unauthorized\"}");
            return false;
        }

        DecodedJWT jwt = jwtOpt.get();

        // assuming role is stored as a claim: "role"
        String userRole = jwt.getClaim("role").asString();

        if (userRole == null) {
            res.setStatus(HttpServletResponse.SC_FORBIDDEN);
            res.getWriter().write("{\"error\":\"Unauthorized\"}");
            return false;
        }

        if (!userRole.equals(requiredRole)) {
            res.setStatus(HttpServletResponse.SC_FORBIDDEN);
            res.getWriter().write("{\"error\":\"Forbidden\"}");
            return false;
        }

        return true;
    }
}