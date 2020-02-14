class UsersSearch {
    constructor(el){
        this.el = $('el');
        this.input = $('el.input');
        this.ul = $('el.ul');
    }
}

nav.users-search.forEach((el) => {
    new UsersSearch(el); 
});

