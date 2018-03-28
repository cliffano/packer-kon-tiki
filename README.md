AEM Workspace
-------------

AEM Workspace is a simple workspace area for running multiple versions of Adobe Experience Manager (AEM).
It provides convenient build targets and also a Tmuxinator config.

Install
-------

Clone AEM Workspace repo:

    git clone https://github.com/cliffano/aem-workspace

Copy AEM jar and license files into the corresponding version directory.
E.g. copy `AEM_6.1_Quickstart.jar` and its corresponding `license.properties` into `6.1` .

Usage
-----

Go to version directory:

    cd <version>

Start AEM:

    make start

First start will take a while due to AEM initialising crx-quickstart, wait until it opens AEM login page using the default browser.

Stop AEM:

    CTRL+C

Take a snapshot:

    make snapshot

It's recommended to take a snapshot after the first start so you can restore a fresh AEM installation without going through the slow initialisation process.

Restore from snapshot:

    make restore

Run tmux:

    make tools init (once-off only)
    make tmux

It gives you three workspace windows, one for each AEM version (6.0, 6.1, and 6.2).
Each window has two panes on the right side which tails AEM's error and access logs, and a pane on the left side as your main work area.

[![tmux screenshot](https://raw.github.com/cliffano/aem-workspace/master/screenshots/tmux.jpg)](https://raw.github.com/cliffano/aem-workspace/master/screenshots/tmux.jpg)
