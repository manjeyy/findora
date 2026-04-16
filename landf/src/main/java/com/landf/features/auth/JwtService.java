package com.landf.features.auth;

import java.time.Duration;
import java.time.Instant;
import java.util.Optional;

import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.exceptions.JWTVerificationException;
import com.auth0.jwt.interfaces.DecodedJWT;
import com.landf.features.user.UserModel;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;

public class JwtService {

    private static final String USER_ID_CLAIM = "userId";
    private static final String ROLE_CLAIM = "role";
    private static final String DEFAULT_SECRET = "manjeyyy-yyyyy-yyyyyy-yyyyyyy-yyyyyy-yyyyy";

    private final Algorithm algorithm;
    private final JWTVerifier verifier;

    public JwtService() {
        String secret = DEFAULT_SECRET;

        this.algorithm = Algorithm.HMAC256(secret);
        this.verifier = JWT.require(algorithm)
                .withIssuer(AuthConstants.JWT_ISSUER)
                .build();
    }

    public String generateToken(UserModel user) {
        Instant now = Instant.now();
        Instant expiresAt = now.plus(Duration.ofMinutes(AuthConstants.JWT_EXPIRATION_MINUTES));

        return JWT.create()
                .withIssuer(AuthConstants.JWT_ISSUER)
                .withSubject(user.getUsername())
                .withClaim(USER_ID_CLAIM, user.getUser_id())
                .withClaim(ROLE_CLAIM, user.getRole())
                .withIssuedAt(now)
                .withExpiresAt(expiresAt)
                .sign(algorithm);
    }

    public Optional<DecodedJWT> verify(String token) {
        if (token == null || token.isBlank()) {
            return Optional.empty();
        }

        try {
            return Optional.of(verifier.verify(token));
        } catch (JWTVerificationException ex) {
            return Optional.empty();
        }
    }

    public Optional<String> resolveToken(HttpServletRequest request) {
        Cookie[] cookies = request.getCookies();
        if (cookies == null) {
            return Optional.empty();
        }

        for (Cookie cookie : cookies) {
            if (AuthConstants.AUTH_TOKEN_COOKIE.equals(cookie.getName())) {
                return Optional.ofNullable(cookie.getValue());
            }
        }

        return Optional.empty();
    }

    public void applyClaimsToRequest(DecodedJWT jwt, HttpServletRequest request) {
        request.setAttribute(AuthConstants.AUTH_USER_KEY, jwt.getSubject());
        request.setAttribute(AuthConstants.AUTH_USER_ID_KEY, jwt.getClaim(USER_ID_CLAIM).asInt());
        request.setAttribute(AuthConstants.AUTH_ROLE_KEY, jwt.getClaim(ROLE_CLAIM).asString());
    }

    public Cookie buildAuthCookie(String token, HttpServletRequest request) {
        Cookie cookie = new Cookie(AuthConstants.AUTH_TOKEN_COOKIE, token);
        cookie.setHttpOnly(true);
        cookie.setSecure(request.isSecure());
        cookie.setPath(resolveCookiePath(request));
        cookie.setMaxAge(AuthConstants.JWT_EXPIRATION_MINUTES * 60);
        return cookie;
    }

    public Cookie buildClearedAuthCookie(HttpServletRequest request) {
        Cookie cookie = new Cookie(AuthConstants.AUTH_TOKEN_COOKIE, "");
        cookie.setHttpOnly(true);
        cookie.setSecure(request.isSecure());
        cookie.setPath(resolveCookiePath(request));
        cookie.setMaxAge(0);
        return cookie;
    }

    private String resolveCookiePath(HttpServletRequest request) {
        String contextPath = request.getContextPath();
        if (contextPath == null || contextPath.isBlank()) {
            return "/";
        }
        return contextPath;
    }
}
