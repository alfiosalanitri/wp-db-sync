# wp-db-sync
A simple bash script to import/export a wordpress database to current wordpress installation directory.

## Installation
- `sudo chmod +x /path/to/wp-db-sync`
- `sudo ln -s /path/to/wp-db-sync /usr/local/bin/wp-db-sync`

## Usage
- `cd /to/wordpress/website/directory/`
- `wb-db-sync -e` to export current database to /to/wordpress/website/directory/dump.sql
- `wp-db-sync -i` to import the database saved to /to/wordpress/website/directory/dump.sql

# Author:
wp-db-sync is written by Alfio Salanitri www.alfiosalanitri.it and are licensed under the terms of the GNU General Public License, version 2 or higher.
