# Test LDAP Container

[![Build Status](http://ci.jenkins-ci.org/buildStatus/icon?job=infra_mock-ldap)](http://ci.jenkins-ci.org/view/Infrastructure/job/infra_mock-ldap/)

This container runs OpenLDAP, like `ldap.jenkins-ci.org`, except that it uses bogus test data instead
of real production data.
This is useful as a test fixture.
It can be also used for testing of the [Jenkins Account App](https://github.com/jenkins-infra/account-app).

Two users 'kohsuke' and 'alice' exist in this database. 'kohsuke' is an admin and 'alice' is a regular user. Passwords for both users are 'password'.

## Usage

1. `make image`
2. `make run`
3. Open a second terminal, run `make setup-ldap` there

After that the LDAP instance will be available on port 389.
It can be accessed with the following master credentials:

```conf
managerDN=cn=admin,dc=jenkins-ci,dc=org
managerPassword=s3cr3t
```
