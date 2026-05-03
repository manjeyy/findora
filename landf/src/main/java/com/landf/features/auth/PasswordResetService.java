package com.landf.features.auth;

import java.time.Duration;
import java.time.Instant;
import java.util.Map;
import java.util.Optional;
import java.util.UUID;
import java.util.concurrent.ConcurrentHashMap;

public class PasswordResetService {

    private static class Entry {

        final String username;
        final Instant expiresAt;

        Entry(String username, Instant expiresAt) {
            this.username = username;
            this.expiresAt = expiresAt;
        }
    }
    // reset tokens are memory level things, the token are created and consumed on memory level walways
    // no need to create a database table for this
    private final Map<String, Entry> tokens = new ConcurrentHashMap<>();
    private final Duration ttl = Duration.ofMinutes(30);

    public String generateTokenForUsername(String username) {
        String token = UUID.randomUUID().toString();
        tokens.put(token, new Entry(username, Instant.now().plus(ttl)));
        return token;
    }

    public Optional<String> consumeToken(String token) {
        if (token == null || token.isBlank()) {
            return Optional.empty();
        }
        Entry entry = tokens.remove(token);
        if (entry == null) {
            return Optional.empty();
        }
        if (Instant.now().isAfter(entry.expiresAt)) {
            return Optional.empty();
        }
        return Optional.of(entry.username);
    }
}
