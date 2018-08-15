# breadsMCbackup

A pretty simple script to backup your entire LINUX Minecraft Server directory to another directory of your choice. It can also auto-update to the latest version of Paper (github.com/PaperMC/Paper) after 'x' number of days. It has some error checking, logs everything it does, auto-deletes old backups after 'x' days and has the ability to alert using Pushover (www.pushover.net).

## Why and Getting Started

Hopefully you'll find this script of some use, this all started when my personal server crashed and I lost everything. It started on a windows machine with a batch file backup job to a NAS, then to powershell script because I didn't like .bat logging, and now to a full blown ESXi VM with nightly backups and automated updates.

### Prerequisites

This script is based on my server which uses the following:

- Linux server (Debian 9 or Ubuntu) already running a [PaperMC](https://github.com/PaperMC/Paper) server
- Server running via a service: [minecraft-server.server](./minecraft-server.service)
- Server running in Linux [screen](https://linux.die.net/man/1/screen)
- Permissions to start/stop the service without a password prompt (lookup [sudoers](https://linux.die.net/man/5/sudoers))
```
"username" ALL=NOPASSWD:/usr/sbin/service "service file name" start
"username" ALL=NOPASSWD:/usr/sbin/service "service file name" stop

minecraft ALL=NOPASSWD:/usr/sbin/service minecraft-server stop
minecraft ALL=NOPASSWD:/usr/sbin/service minecraft-server start
```
- (Temporary) A pushover account from pushover.net (hoping to remove this Dependency soon), in the meantime you can comment out any "push" code in there


### Mandatory things to change
A few variables must match exactly in your service file and the [backup.sh](./backup.sh) script.

1. If your service file name is *"minecraft-server.service"* then the _**servicename**_ variable in the [backup.sh](./backup.sh) script will be ```servicename="minecraft-server"``` 
2. In your service file, the name of the screen in this command ```ExecStart=/usr/bin/screen -h 2048 -dmS SCREENNAME java ``` must match the screenname variable in the [backup.sh](./backup.sh) script. Using this as an example your [backup.sh](./backup.sh) script _**screenname**_ variable will be ```screenname=SCREENNAME```

### User Options aka other variables to setup:
3. _**savemethod**_ = 'y' or 'n'
```
This determines if the script will send a _stop-save_ command to the server or a _stop_ to the server
Note if you want the server to auto upgrade this variable must be set to __'y'__
````

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
