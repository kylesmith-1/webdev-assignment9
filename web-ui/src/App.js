
import { Container } from 'react-bootstrap';
import { Switch, Route } from 'react-router-dom';

import './App.scss';
import Nav from './Nav';
import UsersList from './Users/List';
import UsersNew from './Users/New';
import PostsNew from './Posts/New';
import Feed from './Feed';


import flatpickr from 'flatpickr';

flatpickr("#date_selector", {
    enableTime: true,
    dateFormat: "Y-m-d H:i",
  });

function App() {
  return (
    <Container>
      <Nav />
      <Switch>
        <Route path="/" exact>
          <Feed />
        </Route>
        <Route path="/posts/new" exact>
          <PostsNew />
        </Route>
        <Route path="/users" exact>
          <UsersList />
        </Route>
        <Route path="/users/new" exact>
          <UsersNew />
        </Route>
      </Switch>
    </Container>
  );
}

export default App;
