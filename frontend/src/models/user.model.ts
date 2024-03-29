export interface User {
  id?: number,
  first_name: string,
  last_name: string,
  username: string,
  email: string,
  current_password?: string,
  password?: string,
  password_confirmation?: string
}

export interface Login {
  email: string;
  password: string;
}

export interface Email {
  email: string;
}
