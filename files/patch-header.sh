#!/bin/bash

STATEMENTS=""
while IFS=': ' read NAME VALUE; do
  if [ "${NAME}" ] && [ "${VALUE}" ]; then
    STATEMENTS="${STATEMENTS}  http-request set-header ${NAME} ${VALUE}\n"
  fi
done <<< "${SET_REQUEST_HEADER}"

sed -e "s|http-request set-header Forwarded for=\(.\+\)$|\
\0\n\
${STATEMENTS}\
|" <$1 >$1.tmp

if diff -q $1 $1.tmp >/dev/null; then
  echo "Failed to apply `basename $0 .sh`" >&2
  exit 1
else
  echo "Applied `basename $0 .sh`"
fi

mv $1.tmp $1
