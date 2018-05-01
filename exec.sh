#!/usr/bin/env bash
docker build -t Auth0WebApp_tguimaraesApps/Auth0WebApp_tguimaraesApp-01-login .
docker run -p 3000:3000 -it Auth0WebApp_tguimaraesApps/Auth0WebApp_tguimaraesApp-01-login
