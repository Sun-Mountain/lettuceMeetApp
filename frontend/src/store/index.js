import { createStore } from "vuex";
import sessionManager from "@/store/modules/session_manager";

export default createStore({
  state: {
    errors: ""
  },
  mutations: {},
  actions: {},
  modules: {
    sessionManager,
  },
});