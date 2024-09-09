import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:googleapis_auth/auth_io.dart';

class ServerKeyService {
  Future<String> getServiceKey() async {
    final scopes = [
      'https://www.googleapis.com/auth/userinfo.email',
      'https://www.googleapis.com/auth/firebase.database',
      'https://www.googleapis.com/auth/firebase.messaging'
    ];

    final client = await clientViaServiceAccount(
        ServiceAccountCredentials.fromJson({
          "type": "service_account",
          "project_id": "fcmtest-d89c8",
          "private_key_id": "81985a23b47798438b73ddad247ea56100e5d1b4",
          "private_key":
              "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCbLZOmfBTd3UEF\ncaLHZ4TAg0gbdJ7clkKlsgJlkqvTXBamTrhgjeA6AVXFJC3BNqDvbGLLR8DuUL+6\nbmG3YwzYFMycenedHzIt4lmac4I3UuHBHsSF5mBZxK2gXVmyPfbCctgknVTM8rri\nEo5ebOa8iHdpRBtkklyNbGuND36Z9y5/kOYq7mgPX8Pp1JYMy55ffo3WdkFx780p\nc9vyKUtbNw4avkiqHuvScavGV2mLaqps/FPgMI/uBPx79cd0E+nmESVWtAU5liLt\nM4p5XNEcVQsZ3f4Dqybfop9XB39cEvZrXTiJ/3XN9O+f15XO1MsSbcAzBbDSMtNI\n/iPdIZCLAgMBAAECggEAP1lfXgdos1xIV5MY+2O4z6iojsDQu8fB5Ifjr5itecct\n3e3kGlLBF50E6UrIPQjysVtjh44+5mtjohW+4ZFXpHz1POpIG4YpQ48UulducOxu\nihrn6qvuaKdApGeHnxrpul8M+wGZpWNwRKuDoGu/1Ha3nOs3bZrMmtWIoJkTO4II\nu94lDRWqewwiE8OeXUNKPz1+N1CfOMmsgqWVAX9ZOrl4E3z6cnpUcp+dD7zpfCg3\niNwpcntQsVBZCUrtIYLvLku59pRcXXbMecIBACy+x4wK8rGqy1KmrvEFJ7wnm/h2\nzNviO+dnpZmWNF2dg5P+CJyJ8g9XKVkmQ5uNfk5jvQKBgQDWG/S1nuxIQdkUZtGd\nRO920vSgkhVe0HghjCsR3qfmxzWBOdTSxAyJm5eDWCuJGTxj+JnREgNv0H392WET\nOJF1Ixano8auVd1U6EGjVLCvuEYnJkUEegniuBcuSAPJHcg6UBSeaSt7Fc8lH8L3\n3mgJO/MB3+ZqNPOsm4MbnzagdQKBgQC5ifKJUjP4eqcC8y5apLzFD27vPq1cbI4D\nxAkqw9R/bnAzwNortIJa0XpxT2UFupy8mwQDs3fW25hlec4dnFs7qNVfVJacd+v6\nQ3ESA1y1KemFUSXD+mZbmKvCHZlDlT6tCHrSRMBoE9Xblw+b52z1ARjH4LzfFhMT\n29iwAyFM/wKBgQC03urrXrSWGeJLJMygwbJVO8JhvuaEsTE6jdF4iBJolxKw9uy9\nm9ZHjQQCdcJZT9M/VKyD/Gag140Hm9IwzZG7VYf22Bin/2s5JfcFBi84UkAZJHAb\nZwjg2MjkVPu1sw4JjMrOQ2Py16qk3t7yS5SxcE5J4B4izFapEro/5FDeXQKBgQCe\nzWhOipI64dfimXuaT5fWXrBHi3DcQ3mF1Zs3BCfz7fWRBkZ10+kijFrtctP3hFK0\nx0U3Wbt/pbKZYBi/lV0tAgOmtYK3Z5kNOf4kOcZ2tOnPlrXpOH+1dEXGPok4pBvi\nA/kD0Z6RNjD74x6UBQ9n4ElygnOFyaIIhEnB1NwCxwKBgCSDmrNP/9zN6dqVcJq/\nQvvg9ibxX2cTm69GHljNaXGH/6ehiiOUane1+yf4ASzQte+47vqZjzS6/3QZZeFx\n04UkhIwjKycmcwAq6U483BWVGo0rp+HGr+iZOWuR6vi6XEt9zw9TYrk0KkDDkzQQ\n5Vg7JUmBQZcWYVAetqJdTe0j\n-----END PRIVATE KEY-----\n",
          "client_email": "firebase-adminsdk-zdxvs@fcmtest-d89c8.iam.gserviceaccount.com",
          "client_id": "113381027424750761886",
          "auth_uri": "https://accounts.google.com/o/oauth2/auth",
          "token_uri": "https://oauth2.googleapis.com/token",
          "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
          "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-zdxvs%40fcmtest-d89c8.iam.gserviceaccount.com",
          "universe_domain": "googleapis.com"
        }),
        scopes);
    final serverKey = client.credentials.accessToken.data;
    return serverKey;
  }


}
