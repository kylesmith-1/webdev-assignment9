
import { Row, Col, Card } from 'react-bootstrap';
import { Link } from 'react-router-dom';
import { connect } from 'react-redux';


function Post({post, id}) {
  if (id == post.id) {
  return (
      <div>
          <h2>{post.title}</h2>
          <h3>Date: {post.date}</h3>
          <p>Description: {post.body}</p>
      </div>
  );
  }
  else {
    return (<div></div>);;
  }
}

function Event({posts, session, id}) {
  let cards = posts.map((post) => (
    <Post post={post} id={id} />
  ));

  let new_link = null;
  if (session) {
    new_link = (
      <p><Link to="/posts/new">New Event</Link></p>
    )
  }
  else {
    new_link = (
      <p>Please register/sign in to view your events.</p>
    )
  }

  return (
    <div>
      <Row>{cards}</Row>
    </div>
  );
}

export default connect(
  ({posts, session}) => ({posts, session}))(Event);
