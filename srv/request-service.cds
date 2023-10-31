using { leave.request.db as db } from '../db/schema';

@requires: 'authenticated-user'
define service RequestService {

    @readonly
    define entity LeaveTypes as projection on db.LeaveTypes;

    @readonly
    define entity Statuses as projection on db.Statuses;

    define entity LeaveRequests as projection on db.LeaveRequests;

    annotate LeaveRequests with @restrict : [{
        grant: ['CREATE', 'READ', 'UPDATE', 'DELETE'],
        to: ['Employee'],
        where: 'createdBy = $user'
    }, {
        grant: ['READ', 'UPDATE'],
        to: ['Admin']
    }];
}