package com.suri.generic.deck.builder.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import lombok.EqualsAndHashCode;

import jakarta.persistence.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Entity
@Table(name = "deck_column_group")
@Getter
@Setter
@NoArgsConstructor
@ToString(exclude = { "deck", "cards" })
@EqualsAndHashCode(exclude = { "deck", "cards" })
public class DeckColumnGroup {

    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "id")
    private UUID id;

    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    @JoinColumn(name = "deck_id", nullable = false)
    private Deck deck;

    @Column(name = "name", nullable = false, length = 100)
    private String name; // Ex: "Créatures", "Sorts", "Magie Noire"

    @Column(name = "display_order", nullable = false)
    private int displayOrder; // Ordre d'affichage (0, 1, 2...)

    @Column(name = "color_hex", length = 7, nullable = false)
    private String colorHex = "#6B7280"; // Code couleur hex (#FF5733)

    @Column(name = "created_at", nullable = false)
    private LocalDateTime createdAt;

    @Column(name = "updated_at", nullable = false)
    private LocalDateTime updatedAt;

    @OneToMany(mappedBy = "columnGroup", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    @OrderBy("positionInColumn ASC")
    private List<DeckCard> cards = new ArrayList<>();

    @PrePersist
    protected void onCreate() {
        createdAt = LocalDateTime.now();
        updatedAt = LocalDateTime.now();
    }

    @PreUpdate
    protected void onUpdate() {
        updatedAt = LocalDateTime.now();
    }

    /**
     * Constructeur avec paramètres essentiels
     */
    public DeckColumnGroup(Deck deck, String name, int displayOrder, String colorHex) {
        this.deck = deck;
        this.name = name;
        this.displayOrder = displayOrder;
        this.colorHex = colorHex;
    }

    /**
     * Ajoute une carte à cette colonne à la fin de la pile
     */
    public void addCard(DeckCard deckCard) {
        if (deckCard != null) {
            deckCard.setColumnGroup(this);
            deckCard.setPositionInColumn(cards.size());
            cards.add(deckCard);
        }
    }

    /**
     * Retire une carte de cette colonne
     */
    public void removeCard(DeckCard deckCard) {
        if (deckCard != null && cards.remove(deckCard)) {
            deckCard.setColumnGroup(null);
            deckCard.setPositionInColumn(null);
            // Réorganiser les positions
            reorderPositions();
        }
    }

    /**
     * Réorganise les positions des cartes après une modification
     */
    private void reorderPositions() {
        for (int i = 0; i < cards.size(); i++) {
            cards.get(i).setPositionInColumn(i);
        }
    }

    /**
     * Calcule le nombre total de cartes dans cette colonne
     */
    public int getTotalCardsCount() {
        return cards.stream()
                .mapToInt(card -> card.getQuantity())
                .sum();
    }

    /**
     * Calcule le nombre de cartes uniques dans cette colonne
     */
    public int getUniqueCardsCount() {
        return cards.size();
    }
}
