![SeAT](https://i.imgur.com/aPPOxSK.png)

# General Upgrades

As with anything, it is a **very** good idea to have backups ready before attempting any upgrades.
In the case of SeAT, the most important component needs to be backed up is the SeAT database.
Should something go wrong, then you can simply re-install SeAT, restore the database, and you should be good to go.

## Docker installation

As expected, updates for SeAT are deployed via images on the [GitHub Container Registry].
Every package version release will automatically start the build process to generate a new docker image.
This means updates are super simple in the docker world. To update your instance, simply run:

=== "SeAT 4.x"

    ```bash linenums="1"
    # Update to the latest dockerhub images
    docker-compose pull
    
    # Take the stack down
    docker-compose down
    
    # Bring the stack back up
    docker-compose up -d
    
    # Cleanup any dangling images
    docker image prune -f
    ```

=== "SeAT 5.x - Traefik"

    ```bash linenums="1"
    # Update to the latest dockerhub images
    docker compose -f docker-compose.yml -f docker-compose.mariadb.yml -f docker-compose.traefik.yml pull
    
    # Take the stack down
    docker compose -f docker-compose.yml -f docker-compose.mariadb.yml -f docker-compose.traefik.yml down
    
    # Bring the stack back up
    docker compose -f docker-compose.yml -f docker-compose.mariadb.yml -f docker-compose.traefik.yml up -d
    
    # Cleanup any dangling images
    docker image prune -f
    ```

=== "SeAT 5.x - Proxy"

    ```bash linenums="1"
    # Update to the latest dockerhub images
    docker compose -f docker-compose.yml -f docker-compose.mariadb.yml -f docker-compose.proxy.yml pull
    
    # Take the stack down
    docker compose -f docker-compose.yml -f docker-compose.mariadb.yml -f docker-compose.proxy.yml down
    
    # Bring the stack back up
    docker compose -f docker-compose.yml -f docker-compose.mariadb.yml -f docker-compose.proxy.yml up -d
    
    # Cleanup any dangling images
    docker image prune -f
    ```

!!! warning "Better safe then sorry"
    **Always** perform a [database backup] of your database before doing an update. Always.

## Blade installation

- Ensure that you are in the path where you installed. By default this should be `/var/www/seat`.
- Cut jobs processing.

```bash
supervisorctl stop all
```

- Put your application into maintenance mode. This will ensure that no request from the outside will hit your applications logic, and also help you perform an upgrade uninterrupted. Do this with:

```bash
php artisan down
```

- Its a good thing to update `composer` itself. This is not a hard requirement, but definitely recommended. Do this with:

```bash
composer self-update
```

- The next thing to do is get the latest SeAT packages. The below example adds the `--no-dev` argument as these packages are generally not needed in production. Upgrade the packages with:

```bash
composer update --no-dev
```

- With the packages upgraded, we can now publish any new migrations/assets/configs. This can be done with:

```bash
php artisan vendor:publish --force --all
```

- Once the needed files are published, run any new/outstanding migrations with:

```bash
php artisan migrate
```

- With the migrations done, run the seeders to update any static data:

=== "SeAT 4.x"

    ```bash
    php artisan db:seed --class=Seat\\Console\\database\\seeds\\ScheduleSeeder
    ```

=== "SeAT 5.x"

    ```bash
    php artisan db:seed --class=Seat\\Eveapi\\Database\\Seeders\\ScheduleSeeder
    ```

- Finally, we can simply bring our application back out of maintenance mode with:

```bash
php artisan up
```

- Prune job queue, this will prevent already queued jobs to use old codebase

```bash
php artisan cache:clear
```

- Renew cached configuration and routes

```bash linenums="1"
php artisan config:cache
php artisan route:cache
```

- Restart the supervisor workers to ensure they also pickup the latest code:

```bash
supervisorctl start all
```

!!! warning "Better safe then sorry"
    **Always** perform a database backup of your database before doing an update. Always.

    You can use `mysqldump -uroot -p seat > backup.sql` (change *root* and *seat* according to your configuration)

[here]: ../admin_guides/docker_admin.md#performing-updates
[database backup]: ../admin_guides/docker_admin.md#database-backups-and-restore
[GitHub Container Registry]: https://github.com/eveseat/seat-docker/pkgs/container/seat
