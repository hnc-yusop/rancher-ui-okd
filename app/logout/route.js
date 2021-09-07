import { inject as service } from '@ember/service';
import Route from '@ember/routing/route';

export default Route.extend({
  access: service(),

  beforeModel(transition) {
    window.location.href='https://localhost/a_logout.html';

    //transition.send('logout');
  }
});
