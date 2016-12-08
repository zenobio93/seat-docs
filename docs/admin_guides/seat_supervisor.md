![SeAT](http://i.imgur.com/aPPOxSK.png)

## introduction
SeAT is able to query a supervisor instance for worker statuses and other information. This information can then be displayed in the *Queue Status* screen.

![seat supervisor](https://i.imgur.com/fCnYQ08.png)

## the config
A bit of setup work is needed in order to have your SeAT setup query a supervisor instance. The basic idea to get this working is:

- Add a `[inet_http_server]` configuration block to your `supervisor.conf` file.
- Add the username, password, ip and port of the supervisor instance to your SeAT `.env` configuration file.

## 1. add supervisor configuration block.

On your server where `supervisor` is running, open the configuration file `/etc/supervisor/supervisord.conf` in your favorite text editor. Add the following configuration block to your configuration file:

```
[inet_http_server]
port = 127.0.0.1:9001
username = seat
password = your_secure_password
```

Obviously, substitute the values with those that correspond with your environment. For most setups, the values in the example should be just fine.

![seat supervisor config](https://i.imgur.com/6jVLsLv.png)

## 2. configure SeAT with the new values.

SeAT itself also needs some configurations added in order for it to know where the supervisor instance is, as well as what password to use when querying for status information.

Again, on your server, find your SeAT installations `.env` file (usually located at `/var/www/seat/.env`) and add the following configuration block:

```
SUPERVISOR_RPC_ADDRESS=127.0.0.1
SUPERVISOR_RPC_USERNAME=seat
SUPERVISOR_RPC_PASSWORD=hd@rjf&@921aJlw0
SUPERVISOR_RPC_PORT=9001
SUPERVISOR_GROUP=seat
```

The defaults here should also be sufficient but feel free to adjust as needed.

## troubleshooting
In case something goes wrong, you have a few debugging options.

- Obviously, first ensure that `supervisor` itself is running.
- If the http interface is started on a remote server, ensure that no firewall is blocking TCP traffic to the destination server.
- Hop onto Slack (details in the contact page) for help.
