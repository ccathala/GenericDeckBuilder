package com.suri.generic.deck.builder.dto.response;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AuthResponse {

    private String token;
    private UserResponse user;

    public AuthResponse() {}

    public AuthResponse(String token) {
        this.token = token;
    }

    public AuthResponse(String token, UserResponse user) {
        this.token = token;
        this.user = user;
    }
}

