![SeAT](http://i.imgur.com/aPPOxSK.png)

This guide attempts to document the SeAT upgrade procedure. As with anything, it is a **very** good idea to have backups ready before attempting any upgrades. In the case of SeAT, the most important component that needs to be backed up is the SeAT database. In short, something as simple as `mysqldump -uroot -p seat > backup.sql` should be perfectly fine. Should something go wrong, then you can simply re-install SeAT, restore the database and you should be good to go.

### getting started
Upgrades themselves should be relatively simple. All we really need to do is upgrade the SeAT packages and run any new migrations.

### upgrading SeAT

*  Ensure that you are in the path where you installed. By default this should be `/var/www/seat`.
* Put your application into maintenance mode. This will ensure that no request from the outside will hit your applications logic, and also help you perform an upgrade uninterrupted. Do this with:

```bash
php artisan down
```

* Its a good thing to update `composer` itself. This is not a hard requirement, but definitely recommended. Do this with:

```bash
composer self-update
```

* The next thing to do is get the latest SeAT packages. The below example adds the `--no-dev` argument as these packages are generally not needed in production. Upgrade the packages with:

```bash
composer update --no-dev
```

* With the packages upgraded, we can now publish any new migrations/assets/configs. This can be done with:

```bash
php artisan vendor:publish --force
```

* Once the needed files are published, run any new/outstanding migrations with:

```bash
php artisan migrate
```

* With the migrations done, run the schedule seeder to update any schedule changes with:

```bash
php artisan db:seed --class=Seat\\Services\\database\\seeds\\ScheduleSeeder
```

* Finally, we can simply bring our application back out of maintenance mode with:

```bash
php artisan up
```
