import { ResponseStatus } from './response_status.model';
import { Selection } from './selection.model';

export class Response {
  constructor(
    public comment: string,
    public response_status_id: number,
    public selection_id: number,
    public passed: boolean,
    public response_status: ResponseStatus,
    public selection: Selection,
    public id: number
  ) {}
}
