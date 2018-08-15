# breadsMCbackup

A pretty simple script to backup your entire LINUX Minecraft Server directory to another directory of your choice. It can also auto-update to the latest version of Paper (github.com/PaperMC/Paper) after 'x' number of days. It has some error checking, logs everything it does, auto-deletes old backups after 'x' days and the ability to alert using Pushover (www.pushover.net).

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

This script is based on my server which uses the following:


- Linux server (Debian 9 or Ubuntu) already running a [PaperMC](https://github.com/PaperMC/Paper) server
- Server running via a service [minecraft-server.service](./minecraft-service.service)
- Server running in Linux [screen](https://linux.die.net/man/1/screen)
- Permissions to start/stop the service without a password prompt (lookup [sudoers](https://linux.die.net/man/5/sudoers))
```
"username" ALL=NOPASSWD:/usr/sbin/service "service file name" start
"username" ALL=NOPASSWD:/usr/sbin/service "service file name" stop

minecraft ALL=NOPASSWD:/usr/sbin/service minecraft-server stop
minecraft ALL=NOPASSWD:/usr/sbin/service minecraft-server start
```
- (Temporary) A pushover account from pushover.net (hoping to remove this Dependency soon)


### Installing
A few variables must match in your service file and the [backup.sh](./backup.sh) script.

They are:
- In the service-name.service file
-- The actual name of the file, in this example "minecraft-server.service"
- In the backup.sh file
-- the variable at the top called $servicename

First setup your service: [minecraft-server.service](./minecraft-service.service)
'''systemd


'''

The name of the screen:

If you use the "$savemethod = n" method in the script it relies on having your server run via a service it's important the -S screen name in your service file matches the $screensession variable in the script

Take a look at the minecraft-service.service file and either use it with your server specifics (source path, screensession name, java -jar command line options, etc...) or take note of the fields that are

Say what the step will be

```
Give the example
```

And repeat

```
until finished
```

End with an example of getting some data out of the system or using it for a little demo

## Running the tests

Explain how to run the automated tests for this system

### Break down into end to end tests

Explain what these tests test and why

```
Give an example
```

### And coding style tests

Explain what these tests test and why

```
Give an example
```

## Deployment

Add additional notes about how to deploy this on a live system

## Built With

* [Dropwizard](http://www.dropwizard.io/1.0.2/docs/) - The web framework used
* [Maven](https://maven.apache.org/) - Dependency Management
* [ROME](https://rometools.github.io/rome/) - Used to generate RSS Feeds

## Contributing

Please read [CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/your/project/tags).

## Authors

* **Billie Thompson** - *Initial work* - [PurpleBooth](https://github.com/PurpleBooth)

See also the list of [contributors](https://github.com/your/project/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Hat tip to anyone whose code was used
* Inspiration
* etc
