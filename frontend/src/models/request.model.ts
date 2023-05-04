export interface Request {
  method: string,
  headers: {
    "Content-Type": string,
    "Authorization"?: string
  },
  body?: any
}