package com.suri.generic.deck.builder.repository;

import com.suri.generic.deck.builder.model.CardLocalization;
import com.suri.generic.deck.builder.model.CardLocalizationId;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface CardLocalizationRepository extends JpaRepository<CardLocalization, CardLocalizationId> {

    // Find a specific localization for a card
    Optional<CardLocalization> findByIdCardAndIdLocale(String cardId, String locale);

    // All localizations for a given language (not very useful alone, but available)
    // dispo)
    List<CardLocalization> findAllByIdLocale(String locale);

    // All localizations for a card
    List<CardLocalization> findAllByIdCard(String cardId);

    // Quick existence check
    boolean existsByIdCardAndIdLocale(String cardId, String locale);

}
