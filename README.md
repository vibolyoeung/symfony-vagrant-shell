# Vagrant + apache + posgresql + symfony

Please read and check this Readme from times to times so that
to not waste time later wondering how to do things which are
already explained here

if something is wrong or missing: report me, if you don't tell me
I have no way to improve it =)

Note: you must have a 64 bit machine/OS to use this

  * we use `vagrant` to create the dev environnement
  * `apache` to provide the web server
  * `symfony` + `doctrine` for the base Framework
  * `DoctrineMigration` to create database migration (should be simpler than Phinx)


for windows user you can have a nfs using this plugin

```
vagrant plugin install vagrant-winnfsd
```

# Create the vagrant machine

```
vagrant up
```

```
vagrant provision
```

# Test if everything works correctly

If everything works correctly you should be able to go here

[http://127.0.0.1:8088/app_dev.php/]

and see a Welcome Page

# Basic tasks

```
php app/console doctrine:migrations:diff
php app/console doctrine:migrations:migrate
```

more instruction in the [official documentation](http://symfony.com/doc/current/bundles/DoctrineMigrationsBundle/index.html#generating-migrations-automatically)


#Resource

## Symfony / Doctrine

  * [The official documentation](http://symfony.com/doc/current/book/index.html)
