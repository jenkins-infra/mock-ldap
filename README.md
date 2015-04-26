## Test LDAP Container
[![Build Status](http://ci.jenkins-ci.org/buildStatus/icon?job=infra_mock-ldap)](http://ci.jenkins-ci.org/view/Infrastructure/job/infra_mock-ldap/)

This container runs OpenLDAP, like `ldap.jenkins-ci.org`, except that it uses bogus test data instead
of real production data. This is useful as a test fixture.

Two users 'kohsuke' and 'alice' exist in this database. 'kohsuke' is an admin and 'alice' is a regular user. Passwords for both users are 'password'.
