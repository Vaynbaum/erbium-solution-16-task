import { BasicTestStatus } from './basic_test_status.model';
import { TypeBasicTest } from './type_basic_test.model';

export class BasicTest {
  constructor(
    public id: number,
    public basic_test_status_id: number,
    public type_basic_test_id: number,
    public passed: boolean,
    public value: number,
    public begin: Date,
    public end: Date,
    public intern_id: number,
    public type_basic_test: TypeBasicTest,
    public basic_test_status: BasicTestStatus
  ) {}
}

export class UpdateBasicTest {
  constructor(
    public id: number,
    public status_id: number,
    public passed: boolean,
    public value: number
  ) {}
}
