import { useAuthStore } from "@/store";
import router from "@/router";

export const fetchWrapper = {
  get: request("GET"),
  post: request("POST"),
  put: request("PUT"),
  delete: request("DELETE"),
};

function request(method: string) {
  return (url: string, body?: any) => {
    const requestOptions = {
      method,
      headers: {
        "Content-Type": "application/json",
        Authorization: authToken(url)
      },
      body
    };
    if (body) {
      requestOptions.body = JSON.stringify(body);
    }
    return fetch(url, requestOptions).then(handleResponse);
  };
}

// helper functions

function authToken(url: string) {
  // return auth header with jwt if user is logged in and request is to the api url
  const { currentUser, token } = useAuthStore();
  const isLoggedIn = currentUser ? true : false;
  const isApiUrl = url.startsWith(import.meta.env.API_URL);
  if (isLoggedIn && isApiUrl) {
    return `${token}`;
  } else {
    return '';
  }
}

async function handleResponse(response: any) {
  const isJson = response.headers
  ?.get("content-type")
  ?.includes("application/json");
  const data = isJson ? await response.json() : null;
  const token = response.headers.get("Authorization")

  if(token) {
    data.token = token;
  }

  // check for error response
  if (!response.ok) {
    const { currentUser } = useAuthStore();
    if ([401, 403].includes(response.status) && currentUser) {
      // auto logout if 401 Unauthorized or 403 Forbidden response returned from api
      router.push("/");
    }

    // get error message from body or default to response status
    const error = (data && data.message) || response.status;
    return Promise.reject(error);
  }

  return data;
}
