#!/usr/local/bin/bash

function server () {

  while true
  do
    read method path version
    if [[ $method = 'GET'	]]
    then
      if [[ -f ./www/$path ]]
      then
        echo -e "HTTP/1.1 200 OK \r\nContent-Type: text/html; charset=utf-8\r\nContent-Length: $(wc -c <./www/$path)\r\n\r\n"; cat "./www/$path"; echo -e "\r\n"
        # echo 'Content-Type: text/html; charset=utf-8'
        # echo "Content-Length: $(wc -c <./www/$path)"
      else
        echo -e 'HTTP/1.1 404 Not Found\r\nContent-Length: 0\r\n\r\n'
      fi
    else
      echo -e 'HTTP/1.1 400 Bad Request \r\nContent-Length: 0\r\n\r\n'
    fi
  done
}

coproc SERVER_PROCESS { server; }

netcat  -lvp 2345 <&${SERVER_PROCESS[0]} >&${SERVER_PROCESS[1]}
