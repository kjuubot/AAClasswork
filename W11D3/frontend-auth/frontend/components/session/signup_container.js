import { connect } from 'react-redux';
import { createNewUser } from '../../actions/session_actions'
import Signup from './signup';

const mapDispatchToProps = dispatch => ({
    createNewUser: forUser => dispatch(createNewUser(formUser)),
});

export default connect(null, mapDispatchToProps)(Signup);