import * as Yup from 'yup';

export function getSubmitFn<Schema extends Yup.ObjectSchema<Record<string, any>>>(
  _: Schema,
  callback: (values: Yup.InferType<Schema>) => void
) {
  return (values: Record<string, any>) => {
    return callback(values);
  };
}