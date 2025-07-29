package com.suri.generic.deck.builder.model;

import jakarta.persistence.*;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import java.time.LocalDateTime;

@Entity
@Table(name = "component_translations")
public class ComponentTranslation {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "component_name_fr", nullable = false)
    private String componentNameFr;

    @Column(name = "component_name_en")
    private String componentNameEn;

    @Column(name = "game_id", nullable = false)
    private String gameId;

    @CreationTimestamp
    @Column(name = "created_at")
    private LocalDateTime createdAt;

    @UpdateTimestamp
    @Column(name = "updated_at")
    private LocalDateTime updatedAt;

    // Constructeurs
    public ComponentTranslation() {
    }

    public ComponentTranslation(String componentNameFr, String componentNameEn, String gameId) {
        this.componentNameFr = componentNameFr;
        this.componentNameEn = componentNameEn;
        this.gameId = gameId;
    }

    // Getters et Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getComponentNameFr() {
        return componentNameFr;
    }

    public void setComponentNameFr(String componentNameFr) {
        this.componentNameFr = componentNameFr;
    }

    public String getComponentNameEn() {
        return componentNameEn;
    }

    public void setComponentNameEn(String componentNameEn) {
        this.componentNameEn = componentNameEn;
    }

    public String getGameId() {
        return gameId;
    }

    public void setGameId(String gameId) {
        this.gameId = gameId;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public LocalDateTime getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(LocalDateTime updatedAt) {
        this.updatedAt = updatedAt;
    }
}
