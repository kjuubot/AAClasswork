const FollowToggle = require ("./follow_toggle.js")

$(document).ready(function callback() {
    button.follow-toggle.forEach(ele => {
        FollowToggle(ele);
    })
});