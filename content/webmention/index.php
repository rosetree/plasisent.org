<?php

# Licensed under a CC0 1.0 Universal (CC0 1.0) Public Domain Dedication
# http://creativecommons.org/publicdomain/zero/1.0/
#
# thanks to:
#   https://adactio.com/journal/6495/
#
# see also:
#   http://indiewebcamp.com/webmentions
#   https://gist.github.com/aaronpk/5744879
#
# test:
#   curl -i -d "source=source_url&target=target_url" webmentions_url

if (!isset($_POST['source']) || !isset($_POST['target'])) {
  header($_SERVER['SERVER_PROTOCOL'] . ' 400 Bad Request');
  exit;
}

ob_start();
$ch = curl_init($_POST['source']);
curl_setopt($ch, CURLOPT_USERAGENT, 'Plasisent (webmention.org)');
curl_setopt($ch, CURLOPT_HEADER, 0);
$ok = curl_exec($ch);
curl_close($ch);
$source = ob_get_contents();
ob_end_clean();

header($_SERVER['SERVER_PROTOCOL'] . ' 202 Accepted');

if (stristr($source, $_POST['target'])) {
  $source_url = $_POST['source'];
  $target_url = $_POST['target'];

  $msg = date('c')."\t$source_url\t$target_url\n";

  mail(/* to      = */ 'micha@rosetree.de',
       /* subject = */ "[Webmention] from $source_url",
       /* message = */ $msg);
}

?>
