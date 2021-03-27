
import { Row, Col, Card } from 'react-bootstrap';
import { Link } from 'react-router-dom';
import { connect } from 'react-redux';


function Post({post, session}) {
  if (session && post.user.name === session.name) {

  
  //return (<div></div>);
  return (
    <Col md="3">
      <Card>
        <Card.Text>
          {post.title}
        </Card.Text>
        <Card.Text>
          Date: {post.date}
        </Card.Text>
        <Card.Text>
          Posted by {post.user.name} <br/>
          {post.body} <br/>
          <Link to={"events/"+post.id}>Details</Link>
        </Card.Text>
      </Card>
    </Col>
  );
  }
  else {
    return (<div></div>);;
  }
}

function Feed({posts, session}) {
  let cards = posts.map((post) => (
    <Post post={post} session={session} key={post.id} />
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
      <h2>My Events Feed</h2>
      { new_link }
      <Row>{cards}</Row>
    </div>
  );
}

export default connect(
  ({posts, session}) => ({posts, session}))(Feed);
