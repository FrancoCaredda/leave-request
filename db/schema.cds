namespace leave.request.db;

using { cuid, managed } from '@sap/cds/common';

define entity LeaveTypes : cuid {
    type : localized String(50) not null;
}

define entity Statuses {
    key ID      : String(30) not null;
    status      : localized String(50) not null;
    criticality : Integer;
}

define entity LeaveRequests : cuid, managed {
    cause     : String;
    start     : Date not null;
    end       : Date not null;

    leaveType : Association to one LeaveTypes not null;
    status    : Association to one Statuses   not null;
}