![SeAT](http://i.imgur.com/aPPOxSK.png)

To get up and running for development purposes, follow the next few quick steps:

- Get composer if don't already have it: `curl -sS https://getcomposer.org/installer | php`  
- Create the seat project: `php composer.phar create-project eveseat/seat`. This will leave SeAT in the `seat` directory relative to the one you ran the `create-project` command in.  
- `cd` to the `seat` directory and publish the packages migrations / assets: `php artisan vendor:publish --force`  
- Edit `.env` with your MySQL database details
- Run the migrations: `php artisan migrate`  
- Set an admin password with `php artisa seat:admin:reset`
- Update the SDE with `php artisan eve:update-sde`
- Serve the development server: `php artisan serve`
