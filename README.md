# wp-db-sync
A simple bash script to import/export a wordpress database to/from wordpress root directory.

## Installation
- `sudo chmod +x /path/to/wp-db-sync`
- `sudo ln -s /path/to/wp-db-sync /usr/local/bin/wp-db-sync`

## Usage
- `cd /to/wordpress/website/directory/`
- `wb-db-sync -e` to export the database to /wordpress/website/directory/dump.sql
- `wp-db-sync -i` to import the database from /wordpress/website/directory/dump.sql (note: the script will export a dump.sql.bkp before importing the database)

# Author:
wp-db-sync is written by Alfio Salanitri www.alfiosalanitri.it and are licensed under the terms of the GNU General Public License, version 2 or higher.
