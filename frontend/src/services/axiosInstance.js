import axios from "axios";

const instance = axios.create({
  baseURL: "http://localhost:8080", // adapte si nécessaire
  withCredentials: false, // true si tu veux envoyer un cookie plus tard
});

export default instance;
