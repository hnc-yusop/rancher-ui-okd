import { inject as service } from '@ember/service';
import Route from '@ember/routing/route';

export default Route.extend({
  access: service(),

  beforeModel(transition) {

    //transition.send('logout');
    window.location.replace('https://a1802c5b8fd3c45e39b24c35faa5c741-1743911073.ap-northeast-2.elb.amazonaws.com/auth/realms/my_realm/protocol/openid-connect/logout?redirect_uri=https://a2d72cc7797e44a9d87d980ba089b782-594175455.ap-northeast-2.elb.amazonaws.com/dashboard/logout');

    //window.location.href='https://orca-keycloak.cloud.hancom.com/auth/realms/hancom_realm/protocol/openid-connect/logout?redirect_uri=https://a317e09c1895e4c409a6031db3f71372-1861319992.ap-northeast-2.elb.amazonaws.com/dashboard/logout';
  }
});
