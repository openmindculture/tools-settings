# WordPress in Docker (and WordPress Development in General)

## Coding Custom Blocks in WordPress

Custom blocks need funktionally redundant code both in PHP (for rendering to the frontend) as well as in JavaScript (React component for the block editor).

Custom Blocks mit Custom Markup!!! PoC KO? weil Shortcode Block unreliable (how could it just suddenly stop working altogether, how can it be so easy to break, and why wouldn't Google or AI show easy fixes for common reasons?, has no preview (although I might have faked one with CSS ::after) and no descendants; block variations are limited, don't support custom markup and no arbitratry descendants! Tech TIL TODO mit PHP render damit cacheable static output.

Since WordPres 7.0, PHP-only custom blocks are officially supported and possible using autoregister.

## Show Debugging Output in the Browser in WordPress

Add the following code in `wp-config.php` (not in `functions.php`):

```
define( 'WP_DEBUG', true );
define( 'WP_DEBUG_DISPLAY', true );
@ini_set( 'display_errors', 1 );
```

In a local docker setup:

`docker ps` shows the WordPress container ID like bef44f642c24. In most cases, you only need to type the first letters that distinguish it clearly from all other running containers.

Edit the config file in the container (not recommended):

```
docker exec -it bef44 bash
apt update && yes | apt install vim
vi wp-config.php
```

Alternatively use `apt-get` like in the paragraphs below.

Then you can use the _usual_ vi commands and modes like dd, shift+o, or Esc wq! to (over)write and quit (save and exit) or Esc q! to quit without saving.

That's not recommended as the editor might not persist beyond the current session, and it has been omitted from the official wordpress:latest Docker image by design to keep the image size small and increase security.

The recommended way to edit files is to mount your `wp-content` directory as a volume in `docker-compose.yaml`, and then edit the files from on the host machine in the preferred editor/IDE.

Printing debug information to the browser is not recommended for security reasons either, so the WP_DEBUG code should be removed when no longer needed.

### Debug Log

Inside the docker container:

- `tail -f /var/www/html/wp-content/debug.log`

In the development setup with debug mode enabled, this file logs messages written by `error_log()`.

### WP CLI and vi inside the wordpress:latest docker container

Inside the docker container:

```
apt-get update
apt-get install vim
apt-get install -y curl less
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
wp --info --allow-root
wp post list --post_type=page --fields=ID,post_title | grep foo
wp post list --post_type=attachment --fields=ID,post_title | grep bar.jpg
wp post meta update <PAGE_ID> _thumbnail_id <ATTACHMENT_ID>
```

If the image isn't uploaded yet, import it and set it in one go:
`wp media import /path/to/new-image.jpg --post_id=<PAGE_ID> --featured_image`

### Database console

Enter the database Docker container and log into the mysql cli using the credentials defined in `./.docker-compose.yml`
e.g.

- `docker exec -it wp-localhost_db_1 bash`
- `mysql -uwordpress -pwordpress`
- `use wordpress`

Now you can use mysql commands like
- `show tables like 'wp_%';` or
- `select post_title from wp_posts where id='144093';` or
- `select * from wp_postmeta where post_id='144093';`

or complex queries like counting how many posts have an identical title in their posts and postmeta entry:

- `select count(*) from wp_posts,wp_postmeta where wp_posts.post_title = wp_postmeta.meta_value AND wp_postmeta.meta_key = 'title' AND wp_postmeta.meta_id = wp_posts.id;`