const APIUtil = {
    followUser: id => {
        let followPromise = new Promise((resolve, reject) => {
            setTimeout(function () {
                resolve("Success!")  
                reject("failure!") 
            }, 0)
        })
        followPromise.then(() => {
            console.log('User followed!')
        })
        .catch(() => {
            console.log('Action failed')
        })
    },

    unfollowUser: id => {
        let unfollowPromise = new Promise((resolve, reject) => {
            setTimeout(function () {
                resolve("Success!")
                reject("failure!")
            }, 0)
        })
        unfollowPromise.then(() => {
            console.log('User unfollowed!')
        })
            .catch(() => {
                console.log('Action failed')
            })
    }
};

function searchUsers(queryVal) {
    return $.ajax({
        method: `GET`,
        url: `search_users`,
        data: {
            username: queryVal
        },
        dataType: 'JSON'
    })
}

module.exports = APIUtil;