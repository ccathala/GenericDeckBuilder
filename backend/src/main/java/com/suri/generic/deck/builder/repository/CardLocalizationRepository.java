package com.suri.generic.deck.builder.repository;




import com.suri.generic.deck.builder.model.Card;
import com.suri.generic.deck.builder.model.CardLocalization;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface CardLocalizationRepository extends JpaRepository<CardLocalization, Long> {

    // 🔍 Trouver une localisation précise d'une carte
    Optional<CardLocalization> findByIdCardAndIdLocale(String cardId, String locale);

    // 🔍 Toutes les localisations pour une langue donnée (peu utile seul, mais dispo)
    List<CardLocalization> findAllByIdLocale(String locale);

    // 🔍 Toutes les localisations d'une carte
    List<CardLocalization> findAllByIdCard(String cardId);

    // 🔍 Existence rapide
    boolean existsByIdCardAndIdLocale(String cardId, String locale);

}

