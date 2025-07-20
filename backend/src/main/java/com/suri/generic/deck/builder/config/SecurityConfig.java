package com.suri.generic.deck.builder.config;

import com.suri.generic.deck.builder.security.JwtFilter;
import com.suri.generic.deck.builder.service.UserService;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;

import java.util.Arrays;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

    private final JwtFilter jwtFilter;
    private final UserService userService;
    private final StaticResourceHeadersFilter staticResourceHeadersFilter;

    public SecurityConfig(JwtFilter jwtFilter, UserService userService, 
                         StaticResourceHeadersFilter staticResourceHeadersFilter) {
        this.jwtFilter = jwtFilter;
        this.userService = userService;
        this.staticResourceHeadersFilter = staticResourceHeadersFilter;
    }

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http
                .csrf(csrf -> csrf.disable())
                .cors(cors -> cors.configurationSource(corsConfigurationSource())) // Add CORS explicitly
                .headers(headers -> headers
                        .disable() // Disable all security headers, including X-Frame-Options (iframe)
                )
                .authorizeHttpRequests(auth -> auth
                        // Frontend et assets en PREMIER (priorité maximale)
                        .requestMatchers("/", "/index.html", "/favicon.ico").permitAll()
                        .requestMatchers("/assets/**", "/static/**", "/*.css", "/*.js", "/*.svg", "/*.png", "/*.ico", "/*.txt").permitAll()
                        // Routes SPA (pages frontend accessibles publiquement)
                        .requestMatchers("/cards", "/decks", "/profile", "/login", "/register").permitAll()
                        // API et services
                        .requestMatchers("/auth/**").permitAll()
                        .requestMatchers("/h2-console/**").permitAll()
                        .requestMatchers("/api/public/**").permitAll()
                        .requestMatchers("/actuator/**").permitAll() // Autoriser actuator pour Railway
                        .requestMatchers(
                                "/swagger-ui.html",
                                "/swagger-ui/**",
                                "/v3/api-docs/**",
                                "/v3/api-docs.yaml",
                                "/v3/api-docs",
                                "/webjars/**")
                        .permitAll()
                        .anyRequest().authenticated())
                .addFilterBefore(staticResourceHeadersFilter, org.springframework.security.web.authentication.www.BasicAuthenticationFilter.class)
                .addFilterBefore(jwtFilter, UsernamePasswordAuthenticationFilter.class);

        return http.build();
    }

    // Bean to encode passwords using BCrypt
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    // AuthenticationProvider using UserService and PasswordEncoder
    @Bean
    @SuppressWarnings("deprecation") // TODO: Update when Spring Security provides non-deprecated alternative
    public AuthenticationProvider authenticationProvider() {
        DaoAuthenticationProvider provider = new DaoAuthenticationProvider();
        provider.setUserDetailsService(userService);
        provider.setPasswordEncoder(passwordEncoder());
        return provider;
    }

    @Bean
    public AuthenticationManager authenticationManager(AuthenticationConfiguration config) throws Exception {
        return config.getAuthenticationManager();
    }

    @Bean
    public CorsConfigurationSource corsConfigurationSource() {
        CorsConfiguration configuration = new CorsConfiguration();
        // Autoriser Railway ET développement local
        configuration.setAllowedOriginPatterns(Arrays.asList(
            "https://mage-noir-deckbuilder.up.railway.app", 
            "http://localhost:5173", 
            "http://localhost:3000"
        ));
        configuration.setAllowedMethods(Arrays.asList("GET", "POST", "PUT", "DELETE", "OPTIONS"));
        configuration.setAllowedHeaders(Arrays.asList("*"));
        configuration.setAllowCredentials(true);

        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        source.registerCorsConfiguration("/**", configuration);
        return source;
    }
}
