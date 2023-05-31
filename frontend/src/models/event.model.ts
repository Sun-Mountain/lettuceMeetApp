export interface Event {
  id?: number,
  event_title: string,
  description?: string,
  start_date: Date,
  end_date?: Date,
  uid: string,
  user_id: string
}