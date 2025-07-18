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
        return Collections.emptyList(); // Tu pourras ajouter des rôles plus tard
    }

    @Override
    public String getUsername() {
        return email; // C’est ce qu’on utilise comme identifiant
    }

    @Override
    public boolean isAccountNonExpired() {
        return true; // true = compte actif
    }

    @Override
    public boolean isAccountNonLocked() {
        return true; // true = non bloqué
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true; // true = mot de passe encore valide
    }

    @Override
    public boolean isEnabled() {
        return true; // true = compte activé
    }
}
