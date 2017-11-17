# CREATING A NEW GALAXY FLAVOR

**From scratch**

`On MacOS`

## Prerequisite

1. [Docker](https://download.docker.com/mac/stable/Docker.dmg). Verify if it is running by opening the command line and typing docker ps or docker version

2. [Kitematic](https://download.docker.com/kitematic/Kitematic-Mac.zip)


## Procedure

1. Open Kitematic and click `+New`,
2. Search for `galaxy-stable` and hit `create`.
3. Click on `galaxy-stable` on the left pane, then click on `web preview`, this will open your `default web browser` and `load galaxy` running from the galaxy-stable docker image. 

## Installing additional tools and activating "Generate Tool List" webhook

1. To install additional tools, log-in to galaxy using `admin@galaxy.org` as the **email** and `admin` as the **password**.
2. You will need to activate the `Generate Tool List webhook` to create a list of tools that you added to Galaxy. To activate the `webhook` go to `Kitematic`, click `galaxy-stable` and then click `exec`. This will open an instance of the terminal logged-in to your galaxy docker instance.
3. Edit the `galaxy.ini` at `/etc/galaxy/`. **Uncomment** the line containing **webhooks_dir = `config/plugins/webhooks`**, `append demo` at the **end**. The line will now be: `webhooks_dir = config/plugins/webhooks/demo`
4. Verify if the demo webhook is activated by opening `/galaxy-central/config/plugins/webhooks/demo/search/config/searchover.yaml` and checking if the following line is present: `activate: true`
5. Restart galaxy by typing `supervisorctl restart galaxy:`
6. Verify if `Generate Tool List` webhook is activated by refreshing the galaxy page on the browser, two new icons will appear on the right side: magnifying lens and list icon.
7. Click on the `list icon` (make sure that pop ups is enabled on your browser). This will open a new tab with the following heading `Create a Docker flavour of this instance:`

## Preparing docker build files.

1. Create three files:
`Dockerfile`
`README.md`
`demoflavor.yaml`
You can copy the contents of the first two files from [bgruening/docker-recipes](https://github.com/bgruening/docker-recipes/tree/master/galaxy-openms). Modify specific lines to suit your tools and description. But maintaining the **FROM bgruening/galaxy-stable** line. The `demoflavor.yaml` should contain the lines generated by the **Generate Tool List** webhook.
2. Upload this to your github repository.
3. Log in to your **docker hub account**. Click on the Create link in the upperright hand corner, then click **Create automated build**.
4. Choose `Github` and enter your github credentials. Then click authorize.
5. Click on the repository you just created then click `build details`. If the build did not start yet, click `Trigger`. This will create a new galaxy docker image with the tools you installed.
6. Using Kitematic create a new galaxy instance using the docker image you just created.