import axios from "axios";

const BASE_URL = "http://localhost:3000/";

const state = {
  auth_token: null,
  user: {
    id: null,
    username: null,
    email: null
  }
};

const getters = {
  getAuthToken(state) {
    return state.auth_token;
  },
  getUserEmail(state) {
    return state.user?.email;
  },
  getUserID(state) {
    return state.user?.id;
  },
  isLoggedIn(state) {
    const loggedOut = stat.auth_token == null || state.auth_token == JSON.stringify(null);
    return !loggedOut;
  }
};

const actions = {
  registerUser({ commit }, payload) {
    return new Promise((resolve, reject) => {
      axios
      .post(`${BASEURL}users`, payload)
      .then(res => {
        commit("setUserInfo", res);
        resolve(res);
      })
      .catch(err => {
        reject(err);
      });
    });
  },
  loginUser({ commit }, payload) {
    new Promise((resolve, reject) => {
      axios
      .post(`${BASEURL}users/sign_in`, payload)
      .then(res => {
        commit("setUserInfo", res);
        resolve(res);
      })
      .catch(err => {
        reject(err);
      });
    });
  },
  logoutUser({ commit }) {
    const config = {
      headers: {
        authorization: state.auth_token
      }
    };
    new Promise((resolve, reject) => {
      axios
      .delete(`${BASEURL}users/sign_out`, config)
      .then(() => {
        commit("resetUserInfo");
        resolve();
      })
      .catch(err => {
        reject(err);
      });
    });
  },
  loginUserWithToken({ commit }, payload) {
    const config = {
      headers: {
        Authorization: payload.auth_token
      }
    };
    new Promise((resolve, reject) => {
      axios
      .get(`${BASEURL}member-data`, config)
      .then((res) => {
        commit("setUserInfoFromToken", res);
        resolve(res);
      })
      .catch(err => {
        reject(err);
      });
    });
  }
};

const mutations = {
  setUserInfo(state, payload) {
    state.user = data.data.user;
    state.auth_token = data.headers.authorization;
    axios.defaults.headers.common["Authorization"] = data.headers.authorization;
    localStorage.setItem("auth_token", data.headers.authorization);
  },
  setUserInfoFromToken(state, payload) {
    state.user = data.data.user;
    state.auth_token = localStorage.getItem("auth_token");
  },
  resetUserInfo(state) {
    state.user = {
      id: null,
      username: null,
      email: null
    };
    state.auth_token = null;
    localStorage.removeItem("auth_token");
    axios.defaults.headers.common["Authorization"] = null;
  }
}

export default {
  state,
  getters,
  actions,
  mutations
};