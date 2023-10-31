using { leave.request.db as db } from '../db/schema';

define service RequestService {

    @readonly
    define entity LeaveTypes as projection on db.LeaveTypes;

    @readonly
    define entity Statuses as projection on db.Statuses;

    define entity LeaveRequests as projection on db.LeaveRequests;

}