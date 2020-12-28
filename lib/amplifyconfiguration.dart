const amplifyconfig = ''' {
    "UserAgent": "aws-amplify-cli/2.0",
    "Version": "1.0",
    "analytics": {
        "plugins": {
            "awsPinpointAnalyticsPlugin": {
                "pinpointAnalytics": {
                    "appId": "cf697512f010434794c8e6c3950609c1",
                    "region": "us-east-1"
                },
                "pinpointTargeting": {
                    "region": "us-east-1"
                }
            }
        }
    },
    "auth": {
        "plugins": {
            "awsCognitoAuthPlugin": {
                "UserAgent": "aws-amplify-cli/0.1.0",
                "Version": "0.1.0",
                "IdentityManager": {
                    "Default": {}
                },
                "CredentialsProvider": {
                    "CognitoIdentity": {
                        "Default": {
                            "PoolId": "us-east-1:6308d12f-e9de-4189-ae1b-fe11c654717e",
                            "Region": "us-east-1"
                        }
                    }
                },
                "CognitoUserPool": {
                    "Default": {
                        "PoolId": "us-east-1_SMICPbu25",
                        "AppClientId": "1aredingti8u9qtn8m706b6rae",
                        "AppClientSecret": "1sj4u94dn51v13996e98rlajorml6up7dsb0iev9rsric15dj98b",
                        "Region": "us-east-1"
                    }
                },
                "Auth": {
                    "Default": {
                        "OAuth": {
                            "WebDomain": "kidztokenzapp77274934-77274934-dev.auth.us-east-1.amazoncognito.com",
                            "AppClientId": "1aredingti8u9qtn8m706b6rae",
                            "AppClientSecret": "1sj4u94dn51v13996e98rlajorml6up7dsb0iev9rsric15dj98b",
                            "SignInRedirectURI": "ktzapp://callback/",
                            "SignOutRedirectURI": "ktzapp://signout/",
                            "Scopes": [
                                "phone",
                                "email",
                                "openid",
                                "profile",
                                "aws.cognito.signin.user.admin"
                            ]
                        },
                        "authenticationFlowType": "USER_SRP_AUTH"
                    }
                },
                "PinpointAnalytics": {
                    "Default": {
                        "AppId": "cf697512f010434794c8e6c3950609c1",
                        "Region": "us-east-1"
                    }
                },
                "PinpointTargeting": {
                    "Default": {
                        "Region": "us-east-1"
                    }
                }
            }
        }
    }
}''';