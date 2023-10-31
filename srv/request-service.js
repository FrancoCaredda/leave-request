const cds = require("@sap/cds");

module.exports = cds.service.impl((srv) => {
    srv.before(["UPDATE"], "LeaveRequests", (req) => {
        const { status_ID } = req.data;

        if (status_ID === "LR_APPROVED" || status_ID === "LR_DENIED") {
            req.error(400, "You can't modify an approved or denied request");
        }
    });

    srv.before(["CREATE", "UPDATE"], "LeaveRequests", (req) => {
        const { start, end } = req.data;
        const dStart = new Date(start);
        const dEnd   = new Date(end);

        if (dStart.getTime() > dEnd.getTime()) {
            req.error(400, "The start date can't be after the end date");
        }
    });
});