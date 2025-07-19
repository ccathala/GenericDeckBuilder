package com.suri.generic.deck.builder.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.Collection;
import java.util.Collections;

@Entity
@Getter
@Setter
@NoArgsConstructor
@Table(name = "app_user")
public class User implements UserDetails {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, unique = true)
    private String email;

    @Column(nullable = false)
    private String password;

    @Column(nullable = false)
    private String name;

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return Collections.emptyList(); // Can be extended with roles later
    }

    @Override
    public String getUsername() {
        return email; // Email used as username identifier
    }

    @Override
    public boolean isAccountNonExpired() {
        return true; // Account is active
    }

    @Override
    public boolean isAccountNonLocked() {
        return true; // Account is not locked
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true; // Password is still valid
    }

    @Override
    public boolean isEnabled() {
        return true; // Account is enabled
    }
}
