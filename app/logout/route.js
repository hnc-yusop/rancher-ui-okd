import { inject as service } from '@ember/service';
import Route from '@ember/routing/route';

export default Route.extend({
  access: service(),

  beforeModel(transition) {
    window.location.href='https://orca-keycloak.cloud.hancom.com/auth/realms/hancom_realm/protocol/openid-connect/logout?redirect_uri=https://orca-rancher.cloud.hancom.com/dashboard/logout';

    //transition.send('logout');
  }
});
