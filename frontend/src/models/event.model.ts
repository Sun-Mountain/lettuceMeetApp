export interface Event {
  id?: number,
  all_day: boolean,
  end_date?: Date,
  end_time?: Date,
  event_title: string,
  description?: string,
  private: boolean,
  start_date: Date,
  start_time?: Date,
  uid: string
}