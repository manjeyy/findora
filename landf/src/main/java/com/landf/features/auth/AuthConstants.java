package com.landf.features.auth;

public final class AuthConstants {

    public static final String AUTH_USER_KEY = "authUser";
    public static final String AUTH_USER_ID_KEY = "authUserId";
    public static final String AUTH_ROLE_KEY = "authRole";
    public static final String AUTH_LOCATION_ID_KEY = "authLocationId";
    public static final String AUTH_TOKEN_COOKIE = "landfAuthToken";
    public static final String JWT_ISSUER = "landf-app";
    public static final int JWT_EXPIRATION_MINUTES = 30;

    private AuthConstants() {
    }
}
