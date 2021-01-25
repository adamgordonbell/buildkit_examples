# How to run mitmproxy on docker on mac

Have you ever wanted to see what kinds of requests your docker daemon and docker containers are making?  MITMproxy is a great tool for just that but getting it working with docker containers is a little tricky. Its even trickier are Windows and MacOS where docker containers run in their own VM that docker desktop tries to hide from you. 

# what is it

Mitmproxy is a commandline tool that acts as a http and https proxy and records all the traffic.  You can easily see what requests are being made and even replay them.  Its great for diagnozing problems.

# Installing it

brew install mitmproxy

To start with we are going to 

# getting the self signed cert



# Setting it as a proxy on docker machine

This is great we can now see http requests comming through as we docker pull and docker run commands.

# A problem - our containers making web requests get angry
There is a problem with this though. We have now configured our Docker VM to always proxy traffic through our proxy, but our individual containers don't neccarily have the root cert available.


# An Alpine Solution
https://stackoverflow.com/a/60187535/135202


## Solution #1 

## Solution #2

