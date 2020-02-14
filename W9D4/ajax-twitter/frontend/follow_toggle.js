class FollowToggle {
    constructor(el) {
        this.userId = el.user-id;
        this.followState = el.initial-follow-state;
        $el = $('el');
        this.render();
    }
}

FollowToggle.prototype.render = function() {
    if (this.followState === 'unfollowed'){
        console.log("Follow!")
    } else {
        console.log("Unfollow!")
    }
}

FollowToggle.prototype.handleClick(){
    $('.follow-toggle').on('submit', e => {
        e.preventDefault();
        if (this.followState === 'unfollowed') {
            return $.ajax({
                method: `POST`,
                url: `user_follow`,
                dataType: 'JSON'
            })

            this.followState = 'following';
        } else {
            return $.ajax({
                method: `DELETE`,
                url: `user_follow`,
                dataType: 'JSON'
            })

            this.followState = 'unfollowing';
        }
    }

    this.render();
}

module.exports = FollowToggle;