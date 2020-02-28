import { signup, login, logout } from '../utils/session_util'

export const RECEIVE_CURRENT_USER = "RECEIVE_CURRENT_USER";
export const LOGOUT_CURRENT_USER = "LOGOUT_CURRENT_USER";

const receiveCurrentUser = user => ({
    type: RECEIVE_CURRENT_USER,
    user
});

const logoutCurrentUser = () => ({
    type: LOGOUT_CURRENT_USER
})

export const createNewUser = formUser => dispatch => signup(formUser)
    .then(currentUser => dispatch(receiveCurrentUser(currentUser)));

export const login = formUser => dispatch => login(formUser)
    .then(currentUser => dispatch(receiveCurrentUser(currentUser)));

export const logout = () => dispatch => logout()
    .then(() => dispatch(logoutCurrentUser()));