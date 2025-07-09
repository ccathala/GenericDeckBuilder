package com.suri.generic.deck.builder.service.impl;

import com.suri.generic.deck.builder.model.Game;
import com.suri.generic.deck.builder.repository.GameRepository;
import com.suri.generic.deck.builder.service.GameService;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class GameServiceImpl implements GameService {

    private final GameRepository gameRepository;

    public GameServiceImpl(GameRepository gameRepository) {
        this.gameRepository = gameRepository;
    }

    @Override
    public Game create(Game game) {
        return gameRepository.save(game);
    }

    @Override
    public List<Game> findAll() {
        return gameRepository.findAll();
    }

    @Override
    public Optional<Game> findById(String id) {
        return gameRepository.findById(id);
    }

    @Override
    public Game update(String id, Game updatedGame) {
        return gameRepository.findById(id)
                .map(existing -> {
                    existing.setName(updatedGame.getName());
                    existing.setDescription(updatedGame.getDescription());
                    return gameRepository.save(existing);
                })
                .orElseThrow(() -> new IllegalArgumentException("Game not found: " + id));
    }

    @Override
    public void delete(String id) {
        gameRepository.deleteById(id);
    }
}
