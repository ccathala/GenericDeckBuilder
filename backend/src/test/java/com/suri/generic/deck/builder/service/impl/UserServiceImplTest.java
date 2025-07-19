package com.suri.generic.deck.builder.service.impl;

import com.suri.generic.deck.builder.model.User;
import com.suri.generic.deck.builder.repository.UserRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import java.util.Optional;

import static org.assertj.core.api.Assertions.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
@DisplayName("UserServiceImpl Tests")
class UserServiceImplTest {

    @Mock
    private UserRepository userRepository;

    @InjectMocks
    private UserServiceImpl userService;

    private User testUser;
    private static final String TEST_EMAIL = "test@example.com";
    private static final String TEST_NAME = "Test User";
    private static final String TEST_PASSWORD = "password123";

    @BeforeEach
    void setUp() {
        testUser = new User();
        testUser.setId(1L);
        testUser.setEmail(TEST_EMAIL);
        testUser.setName(TEST_NAME);
        testUser.setPassword(TEST_PASSWORD);
    }

    @Test
    @DisplayName("Should load user by username successfully")
    void testLoadUserByUsername_Success() {
        // Given
        when(userRepository.findByEmail(TEST_EMAIL)).thenReturn(Optional.of(testUser));

        // When
        User result = userService.loadUserByUsername(TEST_EMAIL);

        // Then
        assertThat(result).isNotNull();
        assertThat(result.getEmail()).isEqualTo(TEST_EMAIL);
        assertThat(result.getName()).isEqualTo(TEST_NAME);
        verify(userRepository, times(1)).findByEmail(TEST_EMAIL);
    }

    @Test
    @DisplayName("Should throw UsernameNotFoundException when user not found for loadUserByUsername")
    void testLoadUserByUsername_UserNotFound() {
        // Given
        when(userRepository.findByEmail(TEST_EMAIL)).thenReturn(Optional.empty());

        // When & Then
        assertThatThrownBy(() -> userService.loadUserByUsername(TEST_EMAIL))
                .isInstanceOf(UsernameNotFoundException.class)
                .hasMessage("Utilisateur non trouvé");
        verify(userRepository, times(1)).findByEmail(TEST_EMAIL);
    }

    @Test
    @DisplayName("Should find user by email successfully")
    void testFindUserByEmail_Success() {
        // Given
        when(userRepository.findByEmail(TEST_EMAIL)).thenReturn(Optional.of(testUser));

        // When
        User result = userService.findUserByEmail(TEST_EMAIL);

        // Then
        assertThat(result).isNotNull();
        assertThat(result.getEmail()).isEqualTo(TEST_EMAIL);
        assertThat(result.getName()).isEqualTo(TEST_NAME);
        assertThat(result.getId()).isEqualTo(1L);
        verify(userRepository, times(1)).findByEmail(TEST_EMAIL);
    }

    @Test
    @DisplayName("Should throw UsernameNotFoundException when user not found for findUserByEmail")
    void testFindUserByEmail_NotFound() {
        // Given
        when(userRepository.findByEmail(TEST_EMAIL)).thenReturn(Optional.empty());

        // When & Then
        assertThatThrownBy(() -> userService.findUserByEmail(TEST_EMAIL))
                .isInstanceOf(UsernameNotFoundException.class)
                .hasMessage("User not found: " + TEST_EMAIL);
        verify(userRepository, times(1)).findByEmail(TEST_EMAIL);
    }

    @Test
    @DisplayName("Should create user successfully")
    void testCreateUser_Success() {
        // Given
        User newUser = new User();
        newUser.setEmail("new@example.com");
        newUser.setName("New User");
        newUser.setPassword("newpassword");

        User savedUser = new User();
        savedUser.setId(2L);
        savedUser.setEmail("new@example.com");
        savedUser.setName("New User");
        savedUser.setPassword("newpassword");

        when(userRepository.save(any(User.class))).thenReturn(savedUser);

        // When
        User result = userService.createUser(newUser);

        // Then
        assertThat(result).isNotNull();
        assertThat(result.getId()).isEqualTo(2L);
        assertThat(result.getEmail()).isEqualTo("new@example.com");
        assertThat(result.getName()).isEqualTo("New User");
        verify(userRepository, times(1)).save(newUser);
    }

    @Test
    @DisplayName("Should update user successfully")
    void testUpdateUser_Success() {
        // Given
        testUser.setName("Updated Name");
        when(userRepository.save(any(User.class))).thenReturn(testUser);

        // When
        User result = userService.updateUser(testUser);

        // Then
        assertThat(result).isNotNull();
        assertThat(result.getName()).isEqualTo("Updated Name");
        assertThat(result.getEmail()).isEqualTo(TEST_EMAIL);
        verify(userRepository, times(1)).save(testUser);
    }

    @Test
    @DisplayName("Should return true when user exists by email")
    void testExistsByEmail_True() {
        // Given
        when(userRepository.existsByEmail(TEST_EMAIL)).thenReturn(true);

        // When
        boolean result = userService.existsByEmail(TEST_EMAIL);

        // Then
        assertThat(result).isTrue();
        verify(userRepository, times(1)).existsByEmail(TEST_EMAIL);
    }

    @Test
    @DisplayName("Should return false when user does not exist by email")
    void testExistsByEmail_False() {
        // Given
        when(userRepository.existsByEmail(TEST_EMAIL)).thenReturn(false);

        // When
        boolean result = userService.existsByEmail(TEST_EMAIL);

        // Then
        assertThat(result).isFalse();
        verify(userRepository, times(1)).existsByEmail(TEST_EMAIL);
    }

    @Test
    @DisplayName("Should handle null email gracefully in loadUserByUsername")
    void testLoadUserByUsername_NullEmail() {
        // Given
        when(userRepository.findByEmail(null)).thenReturn(Optional.empty());

        // When & Then
        assertThatThrownBy(() -> userService.loadUserByUsername(null))
                .isInstanceOf(UsernameNotFoundException.class)
                .hasMessage("Utilisateur non trouvé");
        verify(userRepository, times(1)).findByEmail(null);
    }

    @Test
    @DisplayName("Should handle empty email gracefully in findUserByEmail")
    void testFindUserByEmail_EmptyEmail() {
        // Given
        String emptyEmail = "";
        when(userRepository.findByEmail(emptyEmail)).thenReturn(Optional.empty());

        // When & Then
        assertThatThrownBy(() -> userService.findUserByEmail(emptyEmail))
                .isInstanceOf(UsernameNotFoundException.class)
                .hasMessage("User not found: " + emptyEmail);
        verify(userRepository, times(1)).findByEmail(emptyEmail);
    }

    @Test
    @DisplayName("Should handle repository exception during user creation")
    void testCreateUser_RepositoryException() {
        // Given
        User newUser = new User();
        newUser.setEmail("test@example.com");
        when(userRepository.save(any(User.class))).thenThrow(new RuntimeException("Database error"));

        // When & Then
        assertThatThrownBy(() -> userService.createUser(newUser))
                .isInstanceOf(RuntimeException.class)
                .hasMessage("Database error");
        verify(userRepository, times(1)).save(newUser);
    }

    @Test
    @DisplayName("Should handle repository exception during user update")
    void testUpdateUser_RepositoryException() {
        // Given
        when(userRepository.save(any(User.class))).thenThrow(new RuntimeException("Database error"));

        // When & Then
        assertThatThrownBy(() -> userService.updateUser(testUser))
                .isInstanceOf(RuntimeException.class)
                .hasMessage("Database error");
        verify(userRepository, times(1)).save(testUser);
    }

    @Test
    @DisplayName("Should verify UserDetails implementation methods work correctly")
    void testUserDetailsImplementation() {
        // Given
        when(userRepository.findByEmail(TEST_EMAIL)).thenReturn(Optional.of(testUser));

        // When
        User result = userService.loadUserByUsername(TEST_EMAIL);

        // Then - Verify UserDetails interface methods
        assertThat(result.getUsername()).isEqualTo(TEST_EMAIL); // Should return email
        assertThat(result.getPassword()).isEqualTo(TEST_PASSWORD);
        assertThat(result.isAccountNonExpired()).isTrue();
        assertThat(result.isAccountNonLocked()).isTrue();
        assertThat(result.isCredentialsNonExpired()).isTrue();
        assertThat(result.isEnabled()).isTrue();
        assertThat(result.getAuthorities()).isNotNull();
    }
}
