#! /bin/bash

TEMPDIR=`mktemp -d /tmp/XXXXXXXXXXXXX`
  echo $TEMPDIR
  curl -isk https://$ghehost/join | grep 'Status: 200 OK'
  curl -k -v -L -c $TEMPDIR/cookies https://$ghehost/login > $TEMPDIR/github-curl.out
    authenticity_token=$(grep 'name="authenticity_token"' $TEMPDIR/github-curl.out | head -1 | sed -e 's/.*value="\([^"]*\)".*/\1/')
    curl -X POST -k -v -b $TEMPDIR/cookies -c $TEMPDIR/cookies \
    -F "authenticity_token=$authenticity_token" \
    -F "user[login]=octocat" \
    -F "user[email]=octocat@test" \
    -F "user[password]=$ghepass" \
    -F "user[password_confirmation]=$ghepass" \
    -F "source_label=Detail Form" \
    https://$ghehost/join >$TEMPDIR/github-curl.out 2>&1
    cat $TEMPDIR/github-curl.out
    grep "< Set-Cookie: logged_in=yes;" $TEMPDIR/github-curl.out
    rm -rf $TEMPDIR
