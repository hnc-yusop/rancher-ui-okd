import { inject as service } from '@ember/service';
import Route from '@ember/routing/route';

export default Route.extend({
  access: service(),

  beforeModel(transition) {
    window.location.href='https://orca-keycloak.cloud.hancom.com/auth/realms/hancom_realm/protocol/openid-connect/logout?redirect_uri=https://a317e09c1895e4c409a6031db3f71372-1861319992.ap-northeast-2.elb.amazonaws.com/dashboard/logout';

    //transition.send('logout');
  }
});
