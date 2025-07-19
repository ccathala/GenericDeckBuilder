package com.suri.generic.deck.builder.service;

import com.suri.generic.deck.builder.model.User;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

/**
 * Service interface for User management and authentication operations.
 * Extends UserDetailsService for Spring Security integration.
 */
public interface UserService extends UserDetailsService {

    /**
     * Load user by username for Spring Security authentication
     * 
     * @param email the user's email address
     * @return User entity implementing UserDetails
     * @throws UsernameNotFoundException if user not found
     */
    @Override
    User loadUserByUsername(String email) throws UsernameNotFoundException;

    /**
     * Find a user by email address
     * 
     * @param email the email address
     * @return the User entity
     * @throws UsernameNotFoundException if user not found
     */
    User findUserByEmail(String email) throws UsernameNotFoundException;

    /**
     * Create a new user
     * 
     * @param user the user to create
     * @return the created user
     */
    User createUser(User user);

    /**
     * Update an existing user
     * 
     * @param user the user with updated information
     * @return the updated user
     */
    User updateUser(User user);

    /**
     * Check if a user exists by email
     * 
     * @param email the email to check
     * @return true if user exists, false otherwise
     */
    boolean existsByEmail(String email);
}
