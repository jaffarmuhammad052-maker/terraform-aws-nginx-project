import http from 'k6/http';
import { sleep } from 'k6';

export const options = {
  vus: 50,             // virtual users
  duration: '60s',     // run for 1 minute
};

export default function () {
  http.get('http://dev-project-alb-938272914.us-east-1.elb.amazonaws.com/');
  sleep(1);
}

