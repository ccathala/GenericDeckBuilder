import axiosInstance from "./axiosInstance";

export const gameService = {
  // Valider un deck côté serveur
  async validateDeck(deckData) {
    try {
      const response = await axiosInstance.post(
        "/api/decks/validate",
        deckData
      );
      return {
        success: true,
        data: response.data,
      };
    } catch (error) {
      return {
        success: false,
        error: error.response?.data?.error || error.message,
      };
    }
  },
};

export default gameService;
