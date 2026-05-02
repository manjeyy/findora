```java
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

        // Create a new instance of JwtService to handle token operations
        JwtService jwtService = new JwtService();

        // Try to extract the token from the request and verify it
        Optional<DecodedJWT> jwtOpt =
                jwtService.resolveToken(req)
                        .flatMap(jwtService::verify);

        // If token is missing or invalid → user is not authenticated
        if (jwtOpt.isEmpty()) {
            res.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            res.getWriter().write("{\"error\":\"Unauthorized\"}");
            return false;
        }

        // Get the decoded JWT after successful verification
        DecodedJWT jwt = jwtOpt.get();

        // Extract the user's role from the token
        String userRole = jwt.getClaim("role").asString();

        // If role is missing → treat as forbidden (no proper authorization info)
        if (userRole == null) {
            res.setStatus(HttpServletResponse.SC_FORBIDDEN);
            res.getWriter().write("{\"error\":\"Unauthorized\"}");
            return false;
        }

        // Check if the user's role matches the required role
        if (!userRole.equals(requiredRole)) {
            res.setStatus(HttpServletResponse.SC_FORBIDDEN);
            res.getWriter().write("{\"error\":\"Forbidden\"}");
            return false;
        }

        // If everything checks out → access is allowed
        return true;
    }
}
```
