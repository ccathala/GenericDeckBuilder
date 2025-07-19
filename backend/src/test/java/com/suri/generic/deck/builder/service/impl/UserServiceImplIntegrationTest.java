package com.suri.generic.deck.builder.service.impl;

import com.suri.generic.deck.builder.model.User;
import com.suri.generic.deck.builder.repository.UserRepository;
import com.suri.generic.deck.builder.service.UserService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.TestPropertySource;
import org.springframework.transaction.annotation.Transactional;

import static org.assertj.core.api.Assertions.*;

/**
 * Tests d'intégration pour UserServiceImpl avec Spring Boot context
 * Ces tests vérifient l'intégration avec la base de données et Spring Security
 */
@SpringBootTest
@TestPropertySource(locations = "classpath:application-test.properties")
@Transactional
class UserServiceImplIntegrationTest {

    @Autowired
    private UserService userService;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @BeforeEach
    void setUp() {
        userRepository.deleteAll();
    }

    @Test
    void testCreateUserIntegration() {
        // Given
        User newUser = new User();
        newUser.setName("integration-user");
        newUser.setEmail("integration@test.com");
        newUser.setPassword("password123");

        // When
        User savedUser = userService.createUser(newUser);

        // Then
        assertThat(savedUser).isNotNull();
        assertThat(savedUser.getId()).isNotNull();
        assertThat(savedUser.getName()).isEqualTo("integration-user");
        assertThat(savedUser.getEmail()).isEqualTo("integration@test.com");
        // Note: Le service createUser n'encode pas automatiquement le mot de passe,
        // donc on vérifie juste qu'il est stocké tel quel
        assertThat(savedUser.getPassword()).isEqualTo("password123");
    }

    @Test
    void testFindUserByEmailIntegration() {
        // Given
        User newUser = new User();
        newUser.setName("find-user");
        newUser.setEmail("find@test.com");
        newUser.setPassword(passwordEncoder.encode("password123"));
        userRepository.save(newUser);

        // When
        User foundUser = userService.findUserByEmail("find@test.com");

        // Then
        assertThat(foundUser).isNotNull();
        assertThat(foundUser.getEmail()).isEqualTo("find@test.com");
        assertThat(foundUser.getName()).isEqualTo("find-user");
    }

    @Test
    void testExistsByEmailIntegration() {
        // Given
        User newUser = new User();
        newUser.setName("exists-user");
        newUser.setEmail("exists@test.com");
        newUser.setPassword(passwordEncoder.encode("password123"));
        userRepository.save(newUser);

        // When & Then
        assertThat(userService.existsByEmail("exists@test.com")).isTrue();
        assertThat(userService.existsByEmail("notexists@test.com")).isFalse();
    }

    @Test
    void testUpdateUserIntegration() {
        // Given
        User newUser = new User();
        newUser.setName("update-user");
        newUser.setEmail("update@test.com");
        newUser.setPassword(passwordEncoder.encode("password123"));
        User savedUser = userRepository.save(newUser);

        // When
        savedUser.setName("updated-name");
        User updatedUser = userService.updateUser(savedUser);

        // Then
        assertThat(updatedUser).isNotNull();
        assertThat(updatedUser.getName()).isEqualTo("updated-name");
        assertThat(updatedUser.getEmail()).isEqualTo("update@test.com");
    }
}
