export interface User {
<<<<<<< HEAD
  id?: number,
  first_name: string,
  last_name: string,
  username: string,
  email: string,
  current_password?: string,
  password?: string,
  password_confirmation?: string
=======
  id?: number;
  first_name: string;
  last_name: string;
  preferred_username: string;
  email: string;
  current_password?: string;
  password?: string;
  password_confirmation?: string;
>>>>>>> main
}

export interface Login {
  email: string;
  password: string;
}
